
  create view "dwh"."gold"."mart_team_btts_analysis__dbt_tmp"
    
    
  as (
    

with match_data as (
    select
        fm.season_id,
        fm.season_name,
        fm.season_year,
        fm.match_id,
        fm.match_date,
        fm.home_team_id,
        fm.home_team_name,
        fm.away_team_id,
        fm.away_team_name,
        fm.home_score,
        fm.away_score,
        fm.winner_code,
        -- BTTS indicator
        case when fm.home_score > 0 and fm.away_score > 0 then 1 else 0 end as btts,
        -- Clean sheet indicators
        case when fm.away_score = 0 then 1 else 0 end as home_clean_sheet,
        case when fm.home_score = 0 then 1 else 0 end as away_clean_sheet,
        -- xG data from fact_team_match
        coalesce(ftm_home.stat_expectedgoals, 0) as home_xg,
        coalesce(ftm_away.stat_expectedgoals, 0) as away_xg
    from "dwh"."silver"."fact_match" fm
    left join "dwh"."silver"."fact_team_match" ftm_home 
        on fm.match_id = ftm_home.match_id 
        and fm.home_team_id = ftm_home.team_id 
        and ftm_home.period = 'ALL'
    left join "dwh"."silver"."fact_team_match" ftm_away 
        on fm.match_id = ftm_away.match_id 
        and fm.away_team_id = ftm_away.team_id 
        and ftm_away.period = 'ALL'
    where fm.status_type = 'finished'
),
team_overall_stats as (
    -- Overall statistics (all matches combined)
    select
        team_id,
        team_name,
        season_id,
        season_name,
        season_year,
        count(*) as matches_played,
        
        -- Win percentage
        sum(case when is_win = 1 then 1 else 0 end)::numeric / nullif(count(*), 0) * 100 as win_pct,
        
        -- Goals
        round(avg(goals_for), 2) as avg_goals_per_match,
        round(avg(goals_for), 2) as avg_scored,
        round(avg(goals_against), 2) as avg_conceded,
        
        -- BTTS percentage
        sum(btts)::numeric / nullif(count(*), 0) * 100 as btts_pct,
        
        -- Clean sheet percentage
        sum(clean_sheet)::numeric / nullif(count(*), 0) * 100 as clean_sheet_pct,
        
        -- xG metrics
        round(avg(xg_for), 2) as avg_xg,
        round(avg(xg_against), 2) as avg_xga
    from (
        -- Home matches
        select
            home_team_id as team_id,
            home_team_name as team_name,
            season_id,
            season_name,
            season_year,
            home_score as goals_for,
            away_score as goals_against,
            case when winner_code = 1 then 1 else 0 end as is_win,
            btts,
            home_clean_sheet as clean_sheet,
            home_xg as xg_for,
            away_xg as xg_against
        from match_data
        
        union all
        
        -- Away matches
        select
            away_team_id as team_id,
            away_team_name as team_name,
            season_id,
            season_name,
            season_year,
            away_score as goals_for,
            home_score as goals_against,
            case when winner_code = 2 then 1 else 0 end as is_win,
            btts,
            away_clean_sheet as clean_sheet,
            away_xg as xg_for,
            home_xg as xg_against
        from match_data
    ) all_matches
    group by team_id, team_name, season_id, season_name, season_year
),
team_home_stats as (
    -- Home statistics
    select
        home_team_id as team_id,
        home_team_name as team_name,
        season_id,
        season_name,
        season_year,
        count(*) as home_matches_played,
        
        -- Win percentage
        sum(case when winner_code = 1 then 1 else 0 end)::numeric / nullif(count(*), 0) * 100 as home_win_pct,
        
        -- Goals
        round(avg(home_score + away_score), 2) as home_avg_goals_per_match,
        round(avg(home_score), 2) as home_avg_scored,
        round(avg(away_score), 2) as home_avg_conceded,
        
        -- BTTS percentage
        sum(btts)::numeric / nullif(count(*), 0) * 100 as home_btts_pct,
        
        -- Clean sheet percentage
        sum(home_clean_sheet)::numeric / nullif(count(*), 0) * 100 as home_clean_sheet_pct,
        
        -- xG metrics
        round(avg(home_xg), 2) as home_avg_xg,
        round(avg(away_xg), 2) as home_avg_xga
    from match_data
    group by home_team_id, home_team_name, season_id, season_name, season_year
),
team_away_stats as (
    -- Away statistics
    select
        away_team_id as team_id,
        away_team_name as team_name,
        season_id,
        season_name,
        season_year,
        count(*) as away_matches_played,
        
        -- Win percentage
        sum(case when winner_code = 2 then 1 else 0 end)::numeric / nullif(count(*), 0) * 100 as away_win_pct,
        
        -- Goals
        round(avg(home_score + away_score), 2) as away_avg_goals_per_match,
        round(avg(away_score), 2) as away_avg_scored,
        round(avg(home_score), 2) as away_avg_conceded,
        
        -- BTTS percentage
        sum(btts)::numeric / nullif(count(*), 0) * 100 as away_btts_pct,
        
        -- Clean sheet percentage
        sum(away_clean_sheet)::numeric / nullif(count(*), 0) * 100 as away_clean_sheet_pct,
        
        -- xG metrics
        round(avg(away_xg), 2) as away_avg_xg,
        round(avg(home_xg), 2) as away_avg_xga
    from match_data
    group by away_team_id, away_team_name, season_id, season_name, season_year
)
select
    ov.team_id,
    ov.team_name,
    ov.season_id,
    ov.season_name,
    ov.season_year,
    
    -- Overall stats
    ov.matches_played,
    round(ov.win_pct, 1) as overall_win_pct,
    ov.avg_goals_per_match as overall_avg_goals_per_match,
    ov.avg_scored as overall_avg_scored,
    ov.avg_conceded as overall_avg_conceded,
    round(ov.btts_pct, 1) as overall_btts_pct,
    round(ov.clean_sheet_pct, 1) as overall_clean_sheet_pct,
    ov.avg_xg as overall_avg_xg,
    ov.avg_xga as overall_avg_xga,
    
    -- Home stats
    hs.home_matches_played,
    round(hs.home_win_pct, 1) as home_win_pct,
    hs.home_avg_goals_per_match,
    hs.home_avg_scored,
    hs.home_avg_conceded,
    round(hs.home_btts_pct, 1) as home_btts_pct,
    round(hs.home_clean_sheet_pct, 1) as home_clean_sheet_pct,
    hs.home_avg_xg,
    hs.home_avg_xga,
    
    -- Away stats
    aws.away_matches_played,
    round(aws.away_win_pct, 1) as away_win_pct,
    aws.away_avg_goals_per_match,
    aws.away_avg_scored,
    aws.away_avg_conceded,
    round(aws.away_btts_pct, 1) as away_btts_pct,
    round(aws.away_clean_sheet_pct, 1) as away_clean_sheet_pct,
    aws.away_avg_xg,
    aws.away_avg_xga
from team_overall_stats ov
left join team_home_stats hs 
    on ov.team_id = hs.team_id 
    and ov.season_id = hs.season_id
left join team_away_stats aws 
    on ov.team_id = aws.team_id 
    and ov.season_id = aws.season_id
order by season_year desc, overall_btts_pct desc
  );