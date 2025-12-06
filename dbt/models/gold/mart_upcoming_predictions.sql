{{ config(materialized='table') }}

with team_home_stats as (
    select
        fm.season_id,
        fm.home_team_id as team_id,
        count(*) as home_matches,
        avg(fm.home_score) as avg_home_goals_scored,
        avg(fm.away_score) as avg_home_goals_conceded,
        avg(coalesce(ftm.stat_expectedgoals, 0)) as avg_home_xg,
        avg(coalesce(ftm.stat_shotsongoal, 0)) as avg_home_shots_on_target,
        avg(coalesce(ftm.stat_ballpossession, 0)) as avg_home_possession,
        sum(case when fm.winner_code = 1 then 1 else 0 end)::numeric / nullif(count(*), 0) as home_win_rate,
        sum(case when fm.winner_code = 2 then 1 else 0 end)::numeric / nullif(count(*), 0) as home_draw_rate
    from {{ ref('fact_match') }} fm
    left join {{ ref('fact_team_match') }} ftm 
        on fm.match_id = ftm.match_id 
        and fm.home_team_id = ftm.team_id 
        and ftm.period = 'ALL'
    where fm.status_type = 'finished'
    group by fm.season_id, fm.home_team_id
),
team_away_stats as (
    select
        fm.season_id,
        fm.away_team_id as team_id,
        count(*) as away_matches,
        avg(fm.away_score) as avg_away_goals_scored,
        avg(fm.home_score) as avg_away_goals_conceded,
        avg(coalesce(ftm.stat_expectedgoals, 0)) as avg_away_xg,
        avg(coalesce(ftm.stat_shotsongoal, 0)) as avg_away_shots_on_target,
        avg(coalesce(ftm.stat_ballpossession, 0)) as avg_away_possession,
        sum(case when fm.winner_code = 3 then 1 else 0 end)::numeric / nullif(count(*), 0) as away_win_rate,
        sum(case when fm.winner_code = 2 then 1 else 0 end)::numeric / nullif(count(*), 0) as away_draw_rate
    from {{ ref('fact_match') }} fm
    left join {{ ref('fact_team_match') }} ftm 
        on fm.match_id = ftm.match_id 
        and fm.away_team_id = ftm.team_id 
        and ftm.period = 'ALL'
    where fm.status_type = 'finished'
    group by fm.season_id, fm.away_team_id
),
team_form as (
    select
        team_id,
        season_id,
        points_last_5,
        wins_last_5,
        goals_for_last_5,
        goals_against_last_5
    from {{ ref('mart_team_form') }}
),
upcoming_matches as (
    select
        match_id,
        start_timestamp as match_date,
        season_id,
        season_name,
        season_year,
        home_team_id,
        home_team_name,
        away_team_id,
        away_team_name,
        tournament_name,
        status_type
    from {{ ref('mart_upcoming_fixtures') }}
    where status_type = 'notstarted'
),
base_predictions as (
    select
        mp.match_id,
        mp.match_date,
        mp.season_id,
        mp.season_name,
        mp.season_year,
        mp.home_team_id,
        mp.home_team_name,
        mp.away_team_id,
        mp.away_team_name,
        mp.tournament_name,
        mp.status_type,
        
        -- Home team features
        coalesce(hs.avg_home_goals_scored, 0) as home_avg_goals_scored_home,
        coalesce(hs.avg_home_goals_conceded, 0) as home_avg_goals_conceded_home,
        coalesce(hs.avg_home_xg, 0) as home_avg_xg_home,
        coalesce(hs.avg_home_shots_on_target, 0) as home_avg_shots_on_target_home,
        coalesce(hs.avg_home_possession, 0) as home_avg_possession_home,
        coalesce(hs.home_win_rate, 0) as home_win_rate_home,
        coalesce(hs.home_draw_rate, 0) as home_draw_rate_home,
        coalesce(hf.points_last_5, 0) as home_points_last_5,
        coalesce(hf.wins_last_5, 0) as home_wins_last_5,
        coalesce(hf.goals_for_last_5, 0) as home_goals_for_last_5,
        coalesce(hf.goals_against_last_5, 0) as home_goals_against_last_5,
        
        -- Away team features
        coalesce(as_.avg_away_goals_scored, 0) as away_avg_goals_scored_away,
        coalesce(as_.avg_away_goals_conceded, 0) as away_avg_goals_conceded_away,
        coalesce(as_.avg_away_xg, 0) as away_avg_xg_away,
        coalesce(as_.avg_away_shots_on_target, 0) as away_avg_shots_on_target_away,
        coalesce(as_.avg_away_possession, 0) as away_avg_possession_away,
        coalesce(as_.away_win_rate, 0) as away_win_rate_away,
        coalesce(as_.away_draw_rate, 0) as away_draw_rate_away,
        coalesce(af.points_last_5, 0) as away_points_last_5,
        coalesce(af.wins_last_5, 0) as away_wins_last_5,
        coalesce(af.goals_for_last_5, 0) as away_goals_for_last_5,
        coalesce(af.goals_against_last_5, 0) as away_goals_against_last_5,
        
        -- Raw probability components
        coalesce(hs.home_win_rate, 0.33) as raw_home_win_rate,
        coalesce(as_.away_win_rate, 0.33) as raw_away_win_rate,
        coalesce(hs.home_draw_rate, 0.33) as raw_home_draw_rate,
        coalesce(as_.away_draw_rate, 0.33) as raw_away_draw_rate
        
    from upcoming_matches mp
    left join team_home_stats hs 
        on mp.home_team_id = hs.team_id 
        and mp.season_id = hs.season_id
    left join team_away_stats as_ 
        on mp.away_team_id = as_.team_id 
        and mp.season_id = as_.season_id
    left join team_form hf 
        on mp.home_team_id = hf.team_id 
        and mp.season_id = hf.season_id
    left join team_form af 
        on mp.away_team_id = af.team_id 
        and mp.season_id = af.season_id
),
normalized_predictions as (
    select
        *,
        -- xG-enhanced predicted goals
        round((home_avg_goals_scored_home * 0.5 + home_avg_xg_home * 0.5 + away_avg_goals_conceded_away) / 2, 2) as predicted_home_goals,
        round((away_avg_goals_scored_away * 0.5 + away_avg_xg_away * 0.5 + home_avg_goals_conceded_home) / 2, 2) as predicted_away_goals,
        round((home_avg_xg_home + away_avg_xg_away) / 2, 2) as predicted_total_xg,
        
        -- Form multiplier (0.8 to 1.2 based on recent performance)
        case 
            when home_points_last_5 >= 12 then 1.2
            when home_points_last_5 >= 9 then 1.1
            when home_points_last_5 >= 6 then 1.0
            when home_points_last_5 >= 3 then 0.9
            else 0.8
        end as home_form_multiplier,
        
        case 
            when away_points_last_5 >= 12 then 1.2
            when away_points_last_5 >= 9 then 1.1
            when away_points_last_5 >= 6 then 1.0
            when away_points_last_5 >= 3 then 0.9
            else 0.8
        end as away_form_multiplier
    from base_predictions
),
form_adjusted as (
    select
        *,
        -- Apply form multipliers to base probabilities
        (
            (raw_home_win_rate * 0.35 +
            (home_avg_xg_home / nullif(home_avg_xg_home + away_avg_xg_away, 0)) * 0.30 +
            (home_avg_shots_on_target_home / nullif(home_avg_shots_on_target_home + away_avg_shots_on_target_away, 0)) * 0.15 +
            (home_avg_possession_home / 100) * 0.10 +
            (home_goals_for_last_5 / nullif(home_goals_for_last_5 + away_goals_for_last_5, 0)) * 0.10)
            * home_form_multiplier
        ) as combined_home_prob,
        
        (
            (raw_away_win_rate * 0.35 +
            (away_avg_xg_away / nullif(home_avg_xg_home + away_avg_xg_away, 0)) * 0.30 +
            (away_avg_shots_on_target_away / nullif(home_avg_shots_on_target_home + away_avg_shots_on_target_away, 0)) * 0.15 +
            (away_avg_possession_away / 100) * 0.10 +
            (away_goals_for_last_5 / nullif(home_goals_for_last_5 + away_goals_for_last_5, 0)) * 0.10)
            * away_form_multiplier
        ) as combined_away_prob,
        
        (
            (raw_home_draw_rate + raw_away_draw_rate) / 2 * 0.50 +
            (1 - abs(home_avg_xg_home - away_avg_xg_away) / nullif(greatest(home_avg_xg_home, away_avg_xg_away), 0)) * 0.25 +
            (1 - abs(home_form_multiplier - away_form_multiplier) / 0.4) * 0.25
        ) as combined_draw_prob
    from normalized_predictions
),
final_normalized as (
    select
        *,
        combined_home_prob / nullif(combined_home_prob + combined_away_prob + combined_draw_prob, 0) as norm_home_prob,
        combined_draw_prob / nullif(combined_home_prob + combined_away_prob + combined_draw_prob, 0) as norm_draw_prob,
        combined_away_prob / nullif(combined_home_prob + combined_away_prob + combined_draw_prob, 0) as norm_away_prob
    from form_adjusted
)
select
    match_id,
    match_date,
    season_id,
    season_name,
    season_year,
    home_team_id,
    home_team_name,
    away_team_id,
    away_team_name,
    tournament_name,
    
    -- Predicted scores
    predicted_home_goals,
    predicted_away_goals,
    predicted_total_xg,
    
    -- Match outlook
    case
        when norm_home_prob > norm_away_prob + 0.15 then 'HOME_FAVORITE'
        when norm_away_prob > norm_home_prob + 0.15 then 'AWAY_FAVORITE'
        else 'BALANCED'
    end as match_outlook,
    
    -- Probabilities
    round(coalesce(norm_home_prob, 0.33) * 100, 1) as home_win_probability,
    round(coalesce(norm_draw_prob, 0.33) * 100, 1) as draw_probability,
    round(coalesce(norm_away_prob, 0.33) * 100, 1) as away_win_probability,
    
    -- Fair odds
    case 
        when norm_home_prob > 0.01 then round(1 / norm_home_prob, 2)
        else 99.99
    end as home_win_fair_odds,
    case 
        when norm_draw_prob > 0.01 then round(1 / norm_draw_prob, 2)
        else 99.99
    end as draw_fair_odds,
    case 
        when norm_away_prob > 0.01 then round(1 / norm_away_prob, 2)
        else 99.99
    end as away_win_fair_odds,
    
    current_timestamp as created_at

from final_normalized
order by match_date asc