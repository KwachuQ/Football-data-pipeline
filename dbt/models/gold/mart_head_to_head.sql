{{ config(
    materialized='table',
    post_hook=["CREATE INDEX IF NOT EXISTS idx_h2h_team1_team2 ON {{ this }}(team_id_1, team_id_2);",
        "CREATE INDEX IF NOT EXISTS idx_h2h_team2_team1 ON {{ this }}(team_id_2, team_id_1);"]
        ) 
        }}

with h2h_matches as (
    select
        fm.match_id,
        fm.match_date,
        fm.season_id,
        fm.season_name,
        fm.season_year,
        fm.home_team_id,
        fm.home_team_name,
        fm.away_team_id,
        fm.away_team_name,
        fm.home_score,
        fm.away_score,
        fm.winner_code,
        least(fm.home_team_id, fm.away_team_id) as team_id_1,
        greatest(fm.home_team_id, fm.away_team_id) as team_id_2,
        fm.home_score + fm.away_score as total_goals
    from {{ ref('fact_match') }} fm
    where fm.status_type = 'finished'
),
ranked_matches as (
    select
        *,
        row_number() over (partition by team_id_1, team_id_2 order by match_date desc) as match_rank
    from h2h_matches
),
last_5_matches as (
    select
        team_id_1,
        team_id_2,
        string_agg(
            case 
                when (home_team_id = team_id_1 and winner_code = 1) or (away_team_id = team_id_1 and winner_code = 2) then '1'
                when winner_code = 3 then 'X'
                else '2'
            end || ' (' || 
            case when home_team_id = team_id_1 then home_score || '-' || away_score else away_score || '-' || home_score end ||
            ')',
            ' | ' order by match_date desc
        ) as last_5_results
    from ranked_matches
    where match_rank <= 5
    group by team_id_1, team_id_2
)
select
    h.team_id_1,
    h.team_id_2,
    max(case when h.home_team_id = h.team_id_1 then h.home_team_name else h.away_team_name end) as team_1_name,
    max(case when h.home_team_id = h.team_id_2 then h.home_team_name else h.away_team_name end) as team_2_name,
    count(*) as total_matches,
    sum(case when (h.home_team_id = h.team_id_1 and h.winner_code = 1) or (h.away_team_id = h.team_id_1 and h.winner_code = 2) then 1 else 0 end) as team_1_wins,
    sum(case when h.winner_code = 3 then 1 else 0 end) as draws,
    sum(case when (h.home_team_id = h.team_id_2 and h.winner_code = 1) or (h.away_team_id = h.team_id_2 and h.winner_code = 2) then 1 else 0 end) as team_2_wins,
    sum(case when h.home_team_id = h.team_id_1 then h.home_score else h.away_score end) as team_1_goals,
    sum(case when h.home_team_id = h.team_id_2 then h.home_score else h.away_score end) as team_2_goals,
    round(avg(case when h.home_team_id = h.team_id_1 then h.home_score else h.away_score end), 2) as team_1_avg_goals,
    round(avg(case when h.home_team_id = h.team_id_2 then h.home_score else h.away_score end), 2) as team_2_avg_goals,
    
    -- Over/Under stats
    round(sum(case when h.total_goals > 1.5 then 1 else 0 end)::numeric / nullif(count(*), 0) * 100, 1) as over_15_pct,
    round(sum(case when h.total_goals > 2.5 then 1 else 0 end)::numeric / nullif(count(*), 0) * 100, 1) as over_25_pct,
    round(sum(case when h.total_goals > 3.5 then 1 else 0 end)::numeric / nullif(count(*), 0) * 100, 1) as over_35_pct,
    
    -- BTTS stats
    round(sum(case when h.home_score > 0 and h.away_score > 0 then 1 else 0 end)::numeric / nullif(count(*), 0) * 100, 1) as btts_pct,
    
    max(h.match_date) as last_meeting_date,
    l5.last_5_results
from h2h_matches h
left join last_5_matches l5 on h.team_id_1 = l5.team_id_1 and h.team_id_2 = l5.team_id_2
group by h.team_id_1, h.team_id_2, l5.last_5_results
having count(*) >= 1
order by total_matches desc, last_meeting_date desc