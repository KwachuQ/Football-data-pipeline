--
-- PostgreSQL database dump
--

\restrict ePATOjLgOBUYsHZaVWRL0uJGg8Lu2nwfMzNkwEpcdyqyJVAJKRP5JEf8hhV79sI

-- Dumped from database version 17.6 (Debian 17.6-2.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-2.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP TABLE IF EXISTS gold.mart_upcoming_predictions;
DROP TABLE IF EXISTS gold.mart_upcoming_fixtures;
DROP TABLE IF EXISTS gold.mart_team_season_summary;
DROP TABLE IF EXISTS gold.mart_team_possession;
DROP TABLE IF EXISTS gold.mart_team_overview;
DROP TABLE IF EXISTS gold.mart_team_form;
DROP TABLE IF EXISTS gold.mart_team_discipline;
DROP TABLE IF EXISTS gold.mart_team_defense;
DROP VIEW IF EXISTS gold.mart_team_btts_analysis;
DROP TABLE IF EXISTS gold.mart_team_attack;
DROP TABLE IF EXISTS gold.mart_match_predictions;
DROP TABLE IF EXISTS gold.mart_league_averages;
DROP TABLE IF EXISTS gold.mart_head_to_head;
DROP SCHEMA IF EXISTS gold;
--
-- Name: gold; Type: SCHEMA; Schema: -; Owner: airflow
--

CREATE SCHEMA gold;


ALTER SCHEMA gold OWNER TO airflow;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: mart_head_to_head; Type: TABLE; Schema: gold; Owner: airflow
--

CREATE TABLE gold.mart_head_to_head (
    team_id_1 integer,
    team_id_2 integer,
    team_1_name text,
    team_2_name text,
    total_matches bigint,
    team_1_wins bigint,
    draws bigint,
    team_2_wins bigint,
    team_1_goals bigint,
    team_2_goals bigint,
    team_1_avg_goals numeric,
    team_2_avg_goals numeric,
    over_15_pct numeric,
    over_25_pct numeric,
    over_35_pct numeric,
    btts_pct numeric,
    last_meeting_date date,
    last_5_results text
);


ALTER TABLE gold.mart_head_to_head OWNER TO airflow;

--
-- Name: mart_league_averages; Type: TABLE; Schema: gold; Owner: airflow
--

CREATE TABLE gold.mart_league_averages (
    season_id integer,
    season_name text,
    season_year text,
    tournament_id integer,
    tournament_name text,
    total_matches bigint,
    teams_count bigint,
    avg_goals_per_match numeric,
    avg_home_goals numeric,
    avg_away_goals numeric,
    home_win_pct numeric,
    away_win_pct numeric,
    draw_pct numeric,
    btts_pct numeric,
    clean_sheet_pct numeric,
    avg_goals_per_game_per_team numeric,
    avg_xg_per_game numeric,
    avg_xg_difference numeric,
    avg_xg_diff_per_game numeric,
    avg_big_chances_created_per_game numeric,
    avg_big_chances_missed_per_game numeric,
    avg_big_chances_scored_per_game numeric,
    avg_shots_per_game numeric,
    avg_shots_on_target_per_game numeric,
    avg_shots_off_target_per_game numeric,
    avg_blocked_shots_per_game numeric,
    avg_shots_inside_box_per_game numeric,
    avg_shots_outside_box_per_game numeric,
    avg_corners_per_game numeric,
    avg_dribbles_success_pct numeric,
    avg_touches_in_box_per_game numeric,
    avg_goals_conceded_per_game numeric,
    avg_xga_per_game numeric,
    avg_xga_difference numeric,
    avg_xga_difference_per_game numeric,
    avg_clean_sheet_pct numeric,
    avg_saves_per_game numeric,
    avg_tackles_per_game numeric,
    avg_tackles_won_pct numeric,
    avg_interceptions_per_game numeric,
    avg_clearances_per_game numeric,
    avg_blocked_shots_per_game_def numeric,
    avg_ball_recoveries_per_game numeric,
    avg_aerial_duels_pct numeric,
    avg_ground_duels_pct numeric,
    avg_duels_won_pct numeric,
    avg_possession_pct numeric,
    avg_pass_accuracy_pct numeric,
    avg_accurate_passes_per_game numeric,
    avg_total_passes_per_game numeric,
    avg_accurate_long_balls_per_game numeric,
    avg_accurate_crosses_per_game numeric,
    avg_final_third_entries_per_game numeric,
    avg_touches_in_box_per_game_poss numeric,
    avg_dispossessed_per_game numeric,
    avg_throw_ins_per_game numeric,
    avg_goal_kicks_per_game numeric,
    avg_yellow_cards_per_game numeric,
    avg_fouls_per_game numeric,
    avg_offsides_per_game numeric,
    avg_free_kicks_per_game numeric,
    total_goals_in_season bigint,
    total_xg_in_season numeric,
    total_shots_in_season numeric,
    total_shots_on_target_in_season numeric,
    total_hit_woodwork_in_season numeric,
    total_big_chances_created numeric,
    total_big_chances_missed numeric,
    total_big_chances_scored numeric,
    total_corners_in_season numeric,
    total_xga_in_season numeric,
    total_saves_in_season numeric,
    total_tackles_in_season numeric,
    total_interceptions_in_season numeric,
    total_errors_lead_to_goal_in_season numeric,
    total_errors_lead_to_shot_in_season numeric,
    total_accurate_passes_in_season numeric,
    total_passes_in_season numeric,
    total_accurate_long_balls_in_season numeric,
    total_accurate_crosses_in_season numeric,
    total_final_third_entries_in_season numeric,
    total_yellow_cards_in_season numeric,
    total_red_cards_in_season numeric,
    total_fouls_in_season numeric,
    total_offsides_in_season numeric,
    total_free_kicks_in_season numeric
);


ALTER TABLE gold.mart_league_averages OWNER TO airflow;

--
-- Name: mart_match_predictions; Type: TABLE; Schema: gold; Owner: airflow
--

CREATE TABLE gold.mart_match_predictions (
    match_id integer,
    match_date date,
    season_id integer,
    season_name text,
    season_year text,
    home_team_id integer,
    home_team_name text,
    away_team_id integer,
    away_team_name text,
    tournament_name text,
    home_avg_goals_scored_home numeric,
    home_avg_goals_conceded_home numeric,
    home_avg_xg_home numeric,
    home_avg_shots_on_target_home numeric,
    home_avg_possession_home numeric,
    home_win_rate_home numeric,
    home_points_last_5 bigint,
    home_wins_last_5 bigint,
    home_goals_for_last_5 bigint,
    home_goals_against_last_5 bigint,
    away_avg_goals_scored_away numeric,
    away_avg_goals_conceded_away numeric,
    away_avg_xg_away numeric,
    away_avg_shots_on_target_away numeric,
    away_avg_possession_away numeric,
    away_win_rate_away numeric,
    away_points_last_5 bigint,
    away_wins_last_5 bigint,
    away_goals_for_last_5 bigint,
    away_goals_against_last_5 bigint,
    predicted_home_goals numeric,
    predicted_away_goals numeric,
    predicted_total_xg numeric,
    match_outlook text,
    home_win_probability numeric,
    draw_probability numeric,
    away_win_probability numeric,
    home_win_fair_odds numeric,
    draw_fair_odds numeric,
    away_win_fair_odds numeric,
    actual_home_score integer,
    actual_away_score integer,
    actual_result text,
    prediction_correct boolean,
    home_goals_error numeric,
    away_goals_error numeric,
    created_at timestamp with time zone
);


ALTER TABLE gold.mart_match_predictions OWNER TO airflow;

--
-- Name: mart_team_attack; Type: TABLE; Schema: gold; Owner: airflow
--

CREATE TABLE gold.mart_team_attack (
    team_id integer,
    team_name text,
    season_id integer,
    season_name text,
    season_year text,
    matches_played bigint,
    total_goals bigint,
    goals_per_game numeric,
    total_xg numeric,
    xg_per_game numeric,
    xg_difference numeric,
    xg_diff_per_game numeric,
    total_big_chances_created numeric,
    big_chances_created_per_game numeric,
    total_big_chances_missed numeric,
    big_chances_missed_per_game numeric,
    total_big_chances_scored numeric,
    big_chances_scored_per_game numeric,
    total_shots_on_target numeric,
    shots_on_target_per_game numeric,
    total_shots_off_target numeric,
    shots_off_target_per_game numeric,
    total_blocked_shots numeric,
    blocked_shots_per_game numeric,
    total_shots numeric,
    shots_per_game numeric,
    total_shots_inside_box numeric,
    shots_inside_box_per_game numeric,
    total_shots_outside_box numeric,
    shots_outside_box_per_game numeric,
    total_hit_woodwork numeric,
    total_corners numeric,
    corners_per_game numeric,
    avg_dribbles_success_pct numeric,
    total_touches_in_box numeric,
    touches_in_box_per_game numeric
);


ALTER TABLE gold.mart_team_attack OWNER TO airflow;

--
-- Name: mart_team_btts_analysis; Type: VIEW; Schema: gold; Owner: airflow
--

CREATE VIEW gold.mart_team_btts_analysis AS
 WITH match_data AS (
         SELECT fm.season_id,
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
                CASE
                    WHEN ((fm.home_score > 0) AND (fm.away_score > 0)) THEN 1
                    ELSE 0
                END AS btts,
                CASE
                    WHEN (fm.away_score = 0) THEN 1
                    ELSE 0
                END AS home_clean_sheet,
                CASE
                    WHEN (fm.home_score = 0) THEN 1
                    ELSE 0
                END AS away_clean_sheet,
            COALESCE(ftm_home.stat_expectedgoals, (0)::numeric) AS home_xg,
            COALESCE(ftm_away.stat_expectedgoals, (0)::numeric) AS away_xg
           FROM ((silver.fact_match fm
             LEFT JOIN silver.fact_team_match ftm_home ON (((fm.match_id = ftm_home.match_id) AND (fm.home_team_id = ftm_home.team_id) AND (ftm_home.period = 'ALL'::text))))
             LEFT JOIN silver.fact_team_match ftm_away ON (((fm.match_id = ftm_away.match_id) AND (fm.away_team_id = ftm_away.team_id) AND (ftm_away.period = 'ALL'::text))))
          WHERE (fm.status_type = 'finished'::text)
        ), team_overall_stats AS (
         SELECT all_matches.team_id,
            all_matches.team_name,
            all_matches.season_id,
            all_matches.season_name,
            all_matches.season_year,
            count(*) AS matches_played,
            (((sum(
                CASE
                    WHEN (all_matches.is_win = 1) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS win_pct,
            round(avg((all_matches.goals_for + all_matches.goals_against)), 2) AS avg_goals_per_match,
            round(avg(all_matches.goals_for), 2) AS avg_scored,
            round(avg(all_matches.goals_against), 2) AS avg_conceded,
            (((sum(all_matches.btts))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS btts_pct,
            (((sum(all_matches.clean_sheet))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS clean_sheet_pct,
            round(avg(all_matches.xg_for), 2) AS avg_xg,
            round(avg(all_matches.xg_against), 2) AS avg_xga,
            (((sum(
                CASE
                    WHEN (all_matches.goals_against >= 1) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS overall_conceded_over_05_pct,
            (((sum(
                CASE
                    WHEN (all_matches.goals_against >= 2) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS overall_conceded_over_15_pct,
            (((sum(
                CASE
                    WHEN (all_matches.goals_against >= 3) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS overall_conceded_over_25_pct,
            (((sum(
                CASE
                    WHEN (all_matches.goals_against >= 4) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS overall_conceded_over_35_pct
           FROM ( SELECT match_data.home_team_id AS team_id,
                    match_data.home_team_name AS team_name,
                    match_data.season_id,
                    match_data.season_name,
                    match_data.season_year,
                    match_data.home_score AS goals_for,
                    match_data.away_score AS goals_against,
                        CASE
                            WHEN (match_data.winner_code = 1) THEN 1
                            ELSE 0
                        END AS is_win,
                    match_data.btts,
                    match_data.home_clean_sheet AS clean_sheet,
                    match_data.home_xg AS xg_for,
                    match_data.away_xg AS xg_against
                   FROM match_data
                UNION ALL
                 SELECT match_data.away_team_id AS team_id,
                    match_data.away_team_name AS team_name,
                    match_data.season_id,
                    match_data.season_name,
                    match_data.season_year,
                    match_data.away_score AS goals_for,
                    match_data.home_score AS goals_against,
                        CASE
                            WHEN (match_data.winner_code = 2) THEN 1
                            ELSE 0
                        END AS is_win,
                    match_data.btts,
                    match_data.away_clean_sheet AS clean_sheet,
                    match_data.away_xg AS xg_for,
                    match_data.home_xg AS xg_against
                   FROM match_data) all_matches
          GROUP BY all_matches.team_id, all_matches.team_name, all_matches.season_id, all_matches.season_name, all_matches.season_year
        ), team_home_stats AS (
         SELECT match_data.home_team_id AS team_id,
            match_data.home_team_name AS team_name,
            match_data.season_id,
            match_data.season_name,
            match_data.season_year,
            count(*) AS home_matches_played,
            (((sum(
                CASE
                    WHEN (match_data.winner_code = 1) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS home_win_pct,
            round(avg((match_data.home_score + match_data.away_score)), 2) AS home_avg_goals_per_match,
            round(avg(match_data.home_score), 2) AS home_avg_scored,
            round(avg(match_data.away_score), 2) AS home_avg_conceded,
            (((sum(match_data.btts))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS home_btts_pct,
            (((sum(match_data.home_clean_sheet))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS home_clean_sheet_pct,
            round(avg(match_data.home_xg), 2) AS home_avg_xg,
            round(avg(match_data.away_xg), 2) AS home_avg_xga,
            (((sum(
                CASE
                    WHEN (match_data.home_score >= 1) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS home_scored_over_05_pct,
            (((sum(
                CASE
                    WHEN (match_data.home_score >= 2) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS home_scored_over_15_pct,
            (((sum(
                CASE
                    WHEN (match_data.home_score >= 3) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS home_scored_over_25_pct,
            (((sum(
                CASE
                    WHEN (match_data.home_score >= 4) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS home_scored_over_35_pct,
            (((sum(
                CASE
                    WHEN (match_data.home_score = 0) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS home_failed_to_score_pct,
            (((sum(
                CASE
                    WHEN (match_data.away_score >= 1) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS home_conceded_over_05_pct,
            (((sum(
                CASE
                    WHEN (match_data.away_score >= 2) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS home_conceded_over_15_pct,
            (((sum(
                CASE
                    WHEN (match_data.away_score >= 3) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS home_conceded_over_25_pct,
            (((sum(
                CASE
                    WHEN (match_data.away_score >= 4) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS home_conceded_over_35_pct
           FROM match_data
          GROUP BY match_data.home_team_id, match_data.home_team_name, match_data.season_id, match_data.season_name, match_data.season_year
        ), team_away_stats AS (
         SELECT match_data.away_team_id AS team_id,
            match_data.away_team_name AS team_name,
            match_data.season_id,
            match_data.season_name,
            match_data.season_year,
            count(*) AS away_matches_played,
            (((sum(
                CASE
                    WHEN (match_data.winner_code = 2) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS away_win_pct,
            round(avg((match_data.home_score + match_data.away_score)), 2) AS away_avg_goals_per_match,
            round(avg(match_data.away_score), 2) AS away_avg_scored,
            round(avg(match_data.home_score), 2) AS away_avg_conceded,
            (((sum(match_data.btts))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS away_btts_pct,
            (((sum(match_data.away_clean_sheet))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS away_clean_sheet_pct,
            round(avg(match_data.away_xg), 2) AS away_avg_xg,
            round(avg(match_data.home_xg), 2) AS away_avg_xga,
            (((sum(
                CASE
                    WHEN (match_data.away_score >= 1) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS away_scored_over_05_pct,
            (((sum(
                CASE
                    WHEN (match_data.away_score >= 2) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS away_scored_over_15_pct,
            (((sum(
                CASE
                    WHEN (match_data.away_score >= 3) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS away_scored_over_25_pct,
            (((sum(
                CASE
                    WHEN (match_data.away_score >= 4) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS away_scored_over_35_pct,
            (((sum(
                CASE
                    WHEN (match_data.away_score = 0) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS away_failed_to_score_pct,
            (((sum(
                CASE
                    WHEN (match_data.home_score >= 1) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS away_conceded_over_05_pct,
            (((sum(
                CASE
                    WHEN (match_data.home_score >= 2) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS away_conceded_over_15_pct,
            (((sum(
                CASE
                    WHEN (match_data.home_score >= 3) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS away_conceded_over_25_pct,
            (((sum(
                CASE
                    WHEN (match_data.home_score >= 4) THEN 1
                    ELSE 0
                END))::numeric / (NULLIF(count(*), 0))::numeric) * (100)::numeric) AS away_conceded_over_35_pct
           FROM match_data
          GROUP BY match_data.away_team_id, match_data.away_team_name, match_data.season_id, match_data.season_name, match_data.season_year
        )
 SELECT ov.team_id,
    ov.team_name,
    ov.season_id,
    ov.season_name,
    ov.season_year,
    ov.matches_played,
    round(ov.win_pct, 1) AS overall_win_pct,
    ov.avg_goals_per_match AS overall_avg_goals_per_match,
    ov.avg_scored AS overall_avg_scored,
    ov.avg_conceded AS overall_avg_conceded,
    round(ov.btts_pct, 1) AS overall_btts_pct,
    round(ov.clean_sheet_pct, 1) AS overall_clean_sheet_pct,
    ov.avg_xg AS overall_avg_xg,
    ov.avg_xga AS overall_avg_xga,
    round(COALESCE(ov.overall_conceded_over_05_pct, (0)::numeric), 1) AS overall_conceded_over_05_pct,
    round(COALESCE(ov.overall_conceded_over_15_pct, (0)::numeric), 1) AS overall_conceded_over_15_pct,
    round(COALESCE(ov.overall_conceded_over_25_pct, (0)::numeric), 1) AS overall_conceded_over_25_pct,
    round(COALESCE(ov.overall_conceded_over_35_pct, (0)::numeric), 1) AS overall_conceded_over_35_pct,
    hs.home_matches_played,
    round(hs.home_win_pct, 1) AS home_win_pct,
    hs.home_avg_goals_per_match,
    hs.home_avg_scored,
    hs.home_avg_conceded,
    round(hs.home_btts_pct, 1) AS home_btts_pct,
    round(hs.home_clean_sheet_pct, 1) AS home_clean_sheet_pct,
    hs.home_avg_xg,
    hs.home_avg_xga,
    round(COALESCE(hs.home_scored_over_05_pct, (0)::numeric), 1) AS home_scored_over_05_pct,
    round(COALESCE(hs.home_scored_over_15_pct, (0)::numeric), 1) AS home_scored_over_15_pct,
    round(COALESCE(hs.home_scored_over_25_pct, (0)::numeric), 1) AS home_scored_over_25_pct,
    round(COALESCE(hs.home_scored_over_35_pct, (0)::numeric), 1) AS home_scored_over_35_pct,
    round(COALESCE(hs.home_failed_to_score_pct, (0)::numeric), 1) AS home_failed_to_score_pct,
    round(COALESCE(hs.home_conceded_over_05_pct, (0)::numeric), 1) AS home_conceded_over_05_pct,
    round(COALESCE(hs.home_conceded_over_15_pct, (0)::numeric), 1) AS home_conceded_over_15_pct,
    round(COALESCE(hs.home_conceded_over_25_pct, (0)::numeric), 1) AS home_conceded_over_25_pct,
    round(COALESCE(hs.home_conceded_over_35_pct, (0)::numeric), 1) AS home_conceded_over_35_pct,
    aws.away_matches_played,
    round(aws.away_win_pct, 1) AS away_win_pct,
    aws.away_avg_goals_per_match,
    aws.away_avg_scored,
    aws.away_avg_conceded,
    round(aws.away_btts_pct, 1) AS away_btts_pct,
    round(aws.away_clean_sheet_pct, 1) AS away_clean_sheet_pct,
    aws.away_avg_xg,
    aws.away_avg_xga,
    round(COALESCE(aws.away_scored_over_05_pct, (0)::numeric), 1) AS away_scored_over_05_pct,
    round(COALESCE(aws.away_scored_over_15_pct, (0)::numeric), 1) AS away_scored_over_15_pct,
    round(COALESCE(aws.away_scored_over_25_pct, (0)::numeric), 1) AS away_scored_over_25_pct,
    round(COALESCE(aws.away_scored_over_35_pct, (0)::numeric), 1) AS away_scored_over_35_pct,
    round(COALESCE(aws.away_failed_to_score_pct, (0)::numeric), 1) AS away_failed_to_score_pct,
    round(COALESCE(aws.away_conceded_over_05_pct, (0)::numeric), 1) AS away_conceded_over_05_pct,
    round(COALESCE(aws.away_conceded_over_15_pct, (0)::numeric), 1) AS away_conceded_over_15_pct,
    round(COALESCE(aws.away_conceded_over_25_pct, (0)::numeric), 1) AS away_conceded_over_25_pct,
    round(COALESCE(aws.away_conceded_over_35_pct, (0)::numeric), 1) AS away_conceded_over_35_pct
   FROM ((team_overall_stats ov
     LEFT JOIN team_home_stats hs ON (((ov.team_id = hs.team_id) AND (ov.season_id = hs.season_id))))
     LEFT JOIN team_away_stats aws ON (((ov.team_id = aws.team_id) AND (ov.season_id = aws.season_id))))
  ORDER BY ov.season_year DESC, (round(ov.btts_pct, 1)) DESC;


ALTER VIEW gold.mart_team_btts_analysis OWNER TO airflow;

--
-- Name: mart_team_defense; Type: TABLE; Schema: gold; Owner: airflow
--

CREATE TABLE gold.mart_team_defense (
    team_id integer,
    team_name text,
    season_id integer,
    season_name text,
    season_year text,
    matches_played bigint,
    total_goals_conceded bigint,
    goals_conceded_per_game numeric,
    total_xga numeric,
    xga_per_game numeric,
    xga_difference numeric,
    xga_difference_per_game numeric,
    clean_sheets bigint,
    clean_sheet_pct numeric,
    total_saves numeric,
    saves_per_game numeric,
    total_tackles numeric,
    tackles_per_game numeric,
    avg_tackles_won_pct numeric,
    total_interceptions numeric,
    interceptions_per_game numeric,
    total_clearances numeric,
    clearances_per_game numeric,
    total_blocked_shots numeric,
    blocked_shots_per_game numeric,
    total_ball_recoveries numeric,
    ball_recoveries_per_game numeric,
    avg_aerial_duels_pct numeric,
    avg_ground_duels_pct numeric,
    avg_duels_won_pct numeric,
    total_errors_lead_to_goal numeric,
    total_errors_lead_to_shot numeric
);


ALTER TABLE gold.mart_team_defense OWNER TO airflow;

--
-- Name: mart_team_discipline; Type: TABLE; Schema: gold; Owner: airflow
--

CREATE TABLE gold.mart_team_discipline (
    team_id integer,
    team_name text,
    season_id integer,
    season_name text,
    season_year text,
    matches_played bigint,
    total_yellow_cards numeric,
    yellow_cards_per_game numeric,
    total_red_cards numeric,
    total_fouls numeric,
    fouls_per_game numeric,
    total_offsides numeric,
    offsides_per_game numeric,
    total_free_kicks numeric,
    free_kicks_per_game numeric
);


ALTER TABLE gold.mart_team_discipline OWNER TO airflow;

--
-- Name: mart_team_form; Type: TABLE; Schema: gold; Owner: airflow
--

CREATE TABLE gold.mart_team_form (
    team_id integer,
    team_name text,
    season_id integer,
    season_name text,
    season_year text,
    last_5_results text,
    points_last_5 bigint,
    wins_last_5 bigint,
    draws_last_5 bigint,
    losses_last_5 bigint,
    goals_for_last_5 bigint,
    goals_against_last_5 bigint,
    last_5_results_home text,
    points_last_5_home bigint,
    last_5_results_away text,
    points_last_5_away bigint,
    last_10_results text,
    points_last_10 bigint,
    wins_last_10 bigint,
    draws_last_10 bigint,
    losses_last_10 bigint,
    goals_for_last_10 bigint,
    goals_against_last_10 bigint,
    last_15_results text,
    points_last_15 bigint,
    wins_last_15 bigint,
    draws_last_15 bigint,
    losses_last_15 bigint,
    goals_for_last_15 bigint,
    goals_against_last_15 bigint,
    last_20_results text,
    points_last_20 bigint,
    wins_last_20 bigint,
    draws_last_20 bigint,
    losses_last_20 bigint,
    goals_for_last_20 bigint,
    goals_against_last_20 bigint,
    halftime_leading_count bigint,
    halftime_leading_wins bigint,
    halftime_leading_draws bigint,
    halftime_leading_losses bigint,
    halftime_leading_win_pct numeric,
    conceded_first_count bigint,
    points_after_conceding_first bigint,
    points_pct_after_conceding_first numeric
);


ALTER TABLE gold.mart_team_form OWNER TO airflow;

--
-- Name: mart_team_overview; Type: TABLE; Schema: gold; Owner: airflow
--

CREATE TABLE gold.mart_team_overview (
    season_id integer,
    season_name text,
    season_year text,
    team_id integer,
    team_name text,
    matches_played bigint,
    wins bigint,
    draws bigint,
    losses bigint,
    total_points bigint,
    points_per_game numeric,
    goals_for bigint,
    goals_against bigint,
    goal_difference bigint,
    goals_per_game numeric,
    goals_conceded_per_game numeric,
    clean_sheets bigint,
    clean_sheet_percentage numeric
);


ALTER TABLE gold.mart_team_overview OWNER TO airflow;

--
-- Name: mart_team_possession; Type: TABLE; Schema: gold; Owner: airflow
--

CREATE TABLE gold.mart_team_possession (
    team_id integer,
    team_name text,
    season_id integer,
    season_name text,
    season_year text,
    matches_played bigint,
    avg_possession_pct numeric,
    total_accurate_passes numeric,
    total_passes numeric,
    accurate_passes_per_game numeric,
    total_passes_per_game numeric,
    pass_accuracy_pct numeric,
    total_accurate_long_balls numeric,
    accurate_long_balls_per_game numeric,
    total_accurate_crosses numeric,
    accurate_crosses_per_game numeric,
    total_final_third_entries numeric,
    final_third_entries_per_game numeric,
    total_touches_in_box numeric,
    touches_in_box_per_game numeric,
    total_dispossessed numeric,
    dispossessed_per_game numeric,
    total_throw_ins numeric,
    throw_ins_per_game numeric,
    total_goal_kicks numeric,
    goal_kicks_per_game numeric
);


ALTER TABLE gold.mart_team_possession OWNER TO airflow;

--
-- Name: mart_team_season_summary; Type: TABLE; Schema: gold; Owner: airflow
--

CREATE TABLE gold.mart_team_season_summary (
    season_id integer,
    season_name text,
    season_year text,
    team_id integer,
    team_name text,
    matches_played bigint,
    wins bigint,
    draws bigint,
    losses bigint,
    total_points bigint,
    points_per_game numeric,
    goals_for bigint,
    goals_against bigint,
    goal_difference bigint,
    goals_per_game numeric,
    goals_conceded_per_game numeric,
    clean_sheets bigint,
    clean_sheet_percentage numeric,
    home_wins bigint,
    home_draws bigint,
    home_losses bigint,
    away_wins bigint,
    away_draws bigint,
    away_losses bigint,
    total_xg numeric,
    xg_per_game numeric,
    xg_difference numeric,
    xg_diff_per_game numeric,
    total_big_chances_created numeric,
    big_chances_created_per_game numeric,
    total_big_chances_missed numeric,
    big_chances_missed_per_game numeric,
    total_shots numeric,
    shots_per_game numeric,
    total_shots_on_target numeric,
    shots_on_target_per_game numeric,
    total_shots_inside_box numeric,
    shots_inside_box_per_game numeric,
    total_shots_outside_box numeric,
    shots_outside_box_per_game numeric,
    total_corners numeric,
    corners_per_game numeric,
    avg_dribbles_success_pct numeric,
    total_hit_woodwork numeric,
    total_saves numeric,
    saves_per_game numeric,
    total_tackles numeric,
    tackles_per_game numeric,
    avg_tackles_won_pct numeric,
    total_interceptions numeric,
    interceptions_per_game numeric,
    total_clearances numeric,
    clearances_per_game numeric,
    total_blocked_shots numeric,
    blocked_shots_per_game numeric,
    total_ball_recoveries numeric,
    ball_recoveries_per_game numeric,
    avg_aerial_duels_pct numeric,
    avg_ground_duels_pct numeric,
    avg_duels_won_pct numeric,
    total_errors_lead_to_goal numeric,
    total_errors_lead_to_shot numeric,
    avg_possession_pct numeric,
    total_accurate_passes numeric,
    total_passes numeric,
    pass_accuracy_pct numeric,
    accurate_passes_per_game numeric,
    total_passes_per_game numeric,
    total_accurate_long_balls numeric,
    accurate_long_balls_per_game numeric,
    total_accurate_crosses numeric,
    accurate_crosses_per_game numeric,
    total_final_third_entries numeric,
    final_third_entries_per_game numeric,
    total_touches_in_box_possession numeric,
    touches_in_box_per_game_possession numeric,
    total_dispossessed numeric,
    dispossessed_per_game numeric,
    total_yellow_cards numeric,
    yellow_cards_per_game numeric,
    total_red_cards numeric,
    total_fouls numeric,
    fouls_per_game numeric,
    total_offsides numeric,
    offsides_per_game numeric,
    total_free_kicks numeric,
    free_kicks_per_game numeric,
    last_5_results text,
    points_last_5 bigint,
    wins_last_5 bigint,
    draws_last_5 bigint,
    losses_last_5 bigint,
    goals_for_last_5 bigint,
    goals_against_last_5 bigint,
    halftime_leading_count bigint,
    halftime_leading_wins bigint,
    halftime_leading_win_pct numeric,
    conceded_first_count bigint,
    points_after_conceding_first bigint,
    points_pct_after_conceding_first numeric,
    home_scored_1h_pct numeric,
    home_scored_2h_pct numeric,
    home_scored_both_halves_pct numeric,
    home_avg_goals_1h numeric,
    home_avg_goals_2h numeric,
    home_clean_sheet_1h_pct numeric,
    home_clean_sheet_2h_pct numeric,
    home_avg_conceded_1h numeric,
    home_avg_conceded_2h numeric,
    away_scored_1h_pct numeric,
    away_scored_2h_pct numeric,
    away_scored_both_halves_pct numeric,
    away_avg_goals_1h numeric,
    away_avg_goals_2h numeric,
    away_clean_sheet_1h_pct numeric,
    away_clean_sheet_2h_pct numeric,
    away_avg_conceded_1h numeric,
    away_avg_conceded_2h numeric
);


ALTER TABLE gold.mart_team_season_summary OWNER TO airflow;

--
-- Name: mart_upcoming_fixtures; Type: TABLE; Schema: gold; Owner: airflow
--

CREATE TABLE gold.mart_upcoming_fixtures (
    match_id integer,
    match_slug text,
    custom_id text,
    start_timestamp timestamp with time zone,
    status_type text,
    home_team_id integer,
    home_team_name text,
    away_team_id integer,
    away_team_name text,
    tournament_id integer,
    tournament_name text,
    season_id integer,
    season_name text,
    season_year text,
    round_number integer,
    extraction_date date,
    extracted_at timestamp with time zone,
    created_at timestamp with time zone
);


ALTER TABLE gold.mart_upcoming_fixtures OWNER TO airflow;

--
-- Name: mart_upcoming_predictions; Type: TABLE; Schema: gold; Owner: airflow
--

CREATE TABLE gold.mart_upcoming_predictions (
    match_id integer,
    match_date timestamp with time zone,
    season_id integer,
    season_name text,
    season_year text,
    home_team_id integer,
    home_team_name text,
    away_team_id integer,
    away_team_name text,
    tournament_name text,
    predicted_home_goals numeric,
    predicted_away_goals numeric,
    predicted_total_xg numeric,
    match_outlook text,
    home_win_probability numeric,
    draw_probability numeric,
    away_win_probability numeric,
    home_win_fair_odds numeric,
    draw_fair_odds numeric,
    away_win_fair_odds numeric,
    created_at timestamp with time zone
);


ALTER TABLE gold.mart_upcoming_predictions OWNER TO airflow;

--
-- Data for Name: mart_head_to_head; Type: TABLE DATA; Schema: gold; Owner: airflow
--

COPY gold.mart_head_to_head (team_id_1, team_id_2, team_1_name, team_2_name, total_matches, team_1_wins, draws, team_2_wins, team_1_goals, team_2_goals, team_1_avg_goals, team_2_avg_goals, over_15_pct, over_25_pct, over_35_pct, btts_pct, last_meeting_date, last_5_results) FROM stdin;
3106	3121	Legia Warszawa	Lech Poznań	42	18	11	13	45	38	1.07	0.90	57.1	38.1	9.5	40.5	2025-10-26	X (0-0) | 2 (0-1) | 2 (2-5) | 1 (2-1) | X (0-0)
3121	7691	Lech Poznań	Jagiellonia Białystok	40	16	8	16	68	53	1.70	1.33	87.5	50.0	32.5	47.5	2025-09-28	X (2-2) | 2 (1-2) | 1 (5-0) | 1 (2-1) | X (3-3)
3106	7913	Legia Warszawa	KS Lechia Gdańsk	39	22	7	10	53	33	1.36	0.85	64.1	46.2	17.9	38.5	2025-11-22	X (2-2) | 1 (2-1) | 1 (2-0) | 2 (0-1) | 1 (2-1)
3106	7691	Legia Warszawa	Jagiellonia Białystok	39	14	15	10	55	34	1.41	0.87	69.2	38.5	20.5	43.6	2025-09-24	X (0-0) | 2 (0-1) | X (1-1) | X (1-1) | 2 (0-2)
3121	7913	Lech Poznań	KS Lechia Gdańsk	38	24	5	9	65	32	1.71	0.84	65.8	55.3	18.4	42.1	2025-07-26	1 (4-3) | 2 (0-1) | 1 (3-1) | 1 (5-0) | 1 (3-0)
3108	7691	Śląsk Wrocław	Jagiellonia Białystok	38	14	13	11	59	50	1.55	1.32	84.2	55.3	39.5	63.2	2025-05-16	X (1-1) | X (2-2) | 2 (1-3) | 1 (2-1) | X (1-1)
3121	4901	Lech Poznań	Cracovia	37	16	11	10	59	40	1.59	1.08	75.7	48.6	24.3	54.1	2025-12-07	X (2-2) | 2 (1-4) | 1 (2-1) | 1 (2-0) | X (0-0)
3106	4901	Legia Warszawa	Cracovia	36	23	7	6	61	30	1.69	0.83	72.2	55.6	27.8	41.7	2025-08-31	2 (1-2) | 2 (1-3) | 1 (3-2) | 2 (0-2) | 1 (2-0)
7691	7913	Jagiellonia Białystok	KS Lechia Gdańsk	36	14	6	16	48	57	1.33	1.58	80.6	55.6	30.6	50.0	2025-08-31	1 (2-0) | 2 (0-1) | 1 (3-2) | 1 (1-0) | X (2-2)
4901	7691	Cracovia	Jagiellonia Białystok	36	10	11	15	46	52	1.28	1.44	69.4	52.8	33.3	61.1	2025-08-10	2 (2-5) | X (2-2) | 1 (4-2) | 1 (3-1) | 2 (2-4)
3108	4901	Śląsk Wrocław	Cracovia	36	17	11	8	55	43	1.53	1.19	77.8	47.2	27.8	58.3	2025-04-12	1 (4-2) | 2 (2-4) | 1 (4-0) | 1 (1-0) | X (1-1)
3108	3121	Śląsk Wrocław	Lech Poznań	36	10	10	16	38	49	1.06	1.36	75.0	44.4	22.2	44.4	2025-03-29	1 (3-1) | 2 (0-1) | X (0-0) | 1 (3-1) | 1 (2-1)
3106	7918	Legia Warszawa	Piast Gliwice	35	17	7	11	54	36	1.54	1.03	71.4	45.7	31.4	51.4	2025-12-14	2 (0-1) | 2 (0-2) | 2 (0-1) | 2 (1-2) | 1 (3-1)
4901	7918	Cracovia	Piast Gliwice	35	11	10	14	45	48	1.29	1.37	68.6	45.7	31.4	57.1	2025-08-24	X (0-0) | X (0-0) | X (0-0) | X (1-1) | 2 (1-2)
3106	3108	Legia Warszawa	Śląsk Wrocław	35	19	10	6	57	26	1.63	0.74	62.9	45.7	28.6	42.9	2025-03-02	1 (3-1) | X (1-1) | X (0-0) | 2 (0-4) | 1 (3-1)
3113	7691	Zagłębie Lubin	Jagiellonia Białystok	34	11	8	15	38	44	1.12	1.29	70.6	50.0	23.5	47.1	2025-11-30	X (0-0) | 1 (3-1) | 2 (1-3) | 2 (1-2) | 2 (0-3)
3110	7691	Górnik Zabrze	Jagiellonia Białystok	34	12	6	16	47	50	1.38	1.47	79.4	61.8	32.4	64.7	2025-10-26	1 (2-1) | X (1-1) | 2 (0-2) | 1 (2-1) | 2 (1-4)
3106	3110	Legia Warszawa	Górnik Zabrze	34	21	7	6	71	40	2.09	1.18	91.2	70.6	44.1	64.7	2025-10-05	2 (1-3) | 1 (2-1) | X (1-1) | 1 (3-1) | 1 (2-1)
3113	3121	Zagłębie Lubin	Lech Poznań	34	11	10	13	37	43	1.09	1.26	73.5	44.1	14.7	55.9	2025-09-12	1 (2-1) | 2 (1-3) | 2 (0-1) | 2 (0-2) | X (1-1)
4901	7913	Cracovia	KS Lechia Gdańsk	34	16	5	13	48	44	1.41	1.29	73.5	50.0	23.5	44.1	2025-08-03	X (2-2) | 2 (0-2) | 1 (2-1) | 1 (2-1) | 2 (0-1)
3108	7918	Śląsk Wrocław	Piast Gliwice	34	9	10	15	41	47	1.21	1.38	76.5	44.1	29.4	52.9	2025-02-03	2 (1-3) | 2 (0-2) | X (2-2) | 1 (1-0) | 2 (0-1)
3108	7913	Śląsk Wrocław	KS Lechia Gdańsk	34	11	13	10	41	41	1.21	1.21	76.5	41.2	20.6	61.8	2024-12-07	2 (0-1) | X (0-0) | 1 (2-1) | 2 (0-2) | X (1-1)
3113	4901	Zagłębie Lubin	Cracovia	33	6	15	12	35	41	1.06	1.24	75.8	36.4	15.2	63.6	2025-11-03	X (0-0) | 2 (1-2) | X (1-1) | X (1-1) | 2 (1-2)
7913	7918	KS Lechia Gdańsk	Piast Gliwice	33	16	6	11	46	37	1.39	1.12	75.8	45.5	27.3	48.5	2025-10-19	1 (2-1) | 1 (3-1) | X (3-3) | 2 (1-0) | 2 (1-3)
3106	3113	Legia Warszawa	Zagłębie Lubin	33	21	5	7	69	34	2.09	1.03	87.9	75.8	45.5	54.5	2025-10-19	2 (1-3) | 1 (3-0) | 1 (2-1) | 1 (3-0) | 1 (2-1)
3106	3117	Legia Warszawa	Pogoń Szczecin	33	17	6	10	54	35	1.64	1.06	75.8	57.6	27.3	54.5	2025-09-28	1 (1-0) | X (0-0) | 2 (0-1) | X (1-1) | 1 (4-3)
7691	7918	Jagiellonia Białystok	Piast Gliwice	33	11	11	11	36	37	1.09	1.12	78.8	24.2	9.1	48.5	2025-09-13	X (1-1) | X (1-1) | 1 (1-0) | X (1-1) | X (0-0)
3108	3110	Śląsk Wrocław	Górnik Zabrze	33	7	13	13	42	49	1.27	1.48	84.8	45.5	30.3	63.6	2025-05-09	2 (0-2) | 2 (0-1) | 2 (0-2) | X (1-1) | 2 (0-2)
3110	7913	Górnik Zabrze	KS Lechia Gdańsk	32	6	13	13	35	49	1.09	1.53	84.4	40.6	25.0	59.4	2025-12-05	2 (2-5) | 1 (2-1) | 1 (2-1) | 2 (2-3) | X (1-1)
3117	3121	Pogoń Szczecin	Lech Poznań	32	6	12	14	35	46	1.09	1.44	78.1	43.8	28.1	40.6	2025-10-19	X (2-2) | 2 (0-3) | 2 (0-2) | 2 (0-1) | 1 (5-0)
5065	7691	MKS Korona Kielce	Jagiellonia Białystok	32	8	9	15	42	61	1.31	1.91	87.5	62.5	43.8	62.5	2025-10-05	2 (1-3) | 1 (3-1) | 2 (1-3) | 2 (0-3) | X (2-2)
3117	7913	Pogoń Szczecin	KS Lechia Gdańsk	32	12	9	11	44	43	1.38	1.34	68.8	40.6	31.3	53.1	2025-09-21	2 (3-4) | X (3-3) | 1 (3-0) | 1 (1-0) | 1 (2-1)
3110	3121	Górnik Zabrze	Lech Poznań	32	7	9	16	34	55	1.06	1.72	84.4	56.3	25.0	62.5	2025-08-02	2 (1-2) | 1 (2-1) | X (0-0) | X (1-1) | 1 (1-0)
3121	7918	Lech Poznań	Piast Gliwice	32	18	8	6	55	23	1.72	0.72	68.8	43.8	28.1	34.4	2025-05-24	1 (1-0) | X (0-0) | 2 (0-1) | X (1-1) | 1 (1-0)
3111	7691	Wisła Kraków	Jagiellonia Białystok	32	12	9	11	45	38	1.41	1.19	71.9	46.9	31.3	50.0	2022-05-07	X (0-0) | 2 (1-3) | 1 (2-0) | X (1-1) | 1 (3-0)
3111	3121	Wisła Kraków	Lech Poznań	32	7	10	15	27	47	0.84	1.47	65.6	34.4	21.9	43.8	2022-03-13	X (1-1) | 2 (0-5) | 2 (1-2) | 1 (1-0) | X (1-1)
3106	3111	Legia Warszawa	Wisła Kraków	32	17	8	7	48	31	1.50	0.97	65.6	46.9	25.0	34.4	2022-02-25	1 (2-1) | 2 (0-1) | X (0-0) | 1 (2-1) | 1 (3-1)
3117	7691	Pogoń Szczecin	Jagiellonia Białystok	31	10	10	11	37	40	1.19	1.29	67.7	48.4	25.8	54.8	2025-11-09	2 (1-2) | X (1-1) | X (1-1) | X (2-2) | 1 (2-1)
3117	7918	Pogoń Szczecin	Piast Gliwice	31	12	11	8	29	24	0.94	0.77	51.6	32.3	12.9	29.0	2025-10-03	1 (2-1) | 2 (1-2) | 1 (1-0) | 2 (0-2) | X (0-0)
3113	7918	Zagłębie Lubin	Piast Gliwice	31	7	11	13	29	42	0.94	1.35	71.0	38.7	22.6	48.4	2025-08-30	X (2-2) | 2 (0-1) | 2 (0-1) | 2 (0-2) | X (1-1)
3121	5065	Lech Poznań	MKS Korona Kielce	31	18	8	5	48	22	1.55	0.71	58.1	38.7	25.8	32.3	2025-08-16	X (1-1) | 1 (2-0) | 1 (3-2) | 2 (1-2) | 1 (1-0)
3113	7913	Zagłębie Lubin	KS Lechia Gdańsk	31	8	9	14	44	53	1.42	1.71	77.4	67.7	38.7	71.0	2025-08-15	1 (6-2) | 2 (1-3) | X (1-1) | 1 (3-1) | 2 (0-3)
3108	3111	Śląsk Wrocław	Wisła Kraków	31	13	7	11	37	31	1.19	1.00	58.1	32.3	19.4	38.7	2022-04-18	X (1-1) | 1 (5-0) | X (1-1) | 1 (3-1) | 1 (2-1)
3111	7913	Wisła Kraków	KS Lechia Gdańsk	31	12	10	9	50	34	1.61	1.10	67.7	48.4	32.3	41.9	2022-03-05	X (1-1) | X (2-2) | 2 (0-2) | 2 (1-3) | 2 (0-1)
3106	5065	Legia Warszawa	MKS Korona Kielce	30	21	5	4	65	29	2.17	0.97	70.0	56.7	43.3	53.3	2025-07-27	1 (2-0) | X (1-1) | 1 (1-0) | X (3-3) | 1 (1-0)
3108	3113	Śląsk Wrocław	Zagłębie Lubin	30	13	7	10	40	42	1.33	1.40	80.0	50.0	30.0	46.7	2025-05-03	1 (3-1) | 2 (0-3) | 1 (2-1) | 2 (0-3) | X (0-0)
3108	5065	Śląsk Wrocław	MKS Korona Kielce	30	6	13	11	33	37	1.10	1.23	80.0	40.0	13.3	63.3	2025-02-22	2 (0-2) | X (1-1) | X (0-0) | X (1-1) | 2 (1-3)
3110	3113	Górnik Zabrze	Zagłębie Lubin	29	13	4	12	45	41	1.55	1.41	89.7	51.7	27.6	51.7	2025-11-07	2 (0-2) | 2 (1-2) | 2 (0-1) | 1 (2-1) | 2 (0-2)
3117	4901	Pogoń Szczecin	Cracovia	29	13	8	8	47	39	1.62	1.34	82.8	58.6	27.6	69.0	2025-10-25	1 (2-1) | 1 (5-2) | 2 (1-2) | 1 (3-1) | 1 (5-1)
3110	5065	Górnik Zabrze	MKS Korona Kielce	29	11	12	6	45	32	1.55	1.10	75.9	48.3	27.6	55.2	2025-10-18	X (1-1) | X (1-1) | 1 (4-2) | 1 (3-1) | 1 (1-0)
3113	5065	Zagłębie Lubin	MKS Korona Kielce	29	11	12	6	38	26	1.31	0.90	75.9	27.6	17.2	48.3	2025-08-01	X (1-1) | X (1-1) | 2 (0-2) | 1 (1-0) | 2 (0-2)
3108	3117	Śląsk Wrocław	Pogoń Szczecin	29	10	12	7	40	32	1.38	1.10	79.3	41.4	17.2	58.6	2025-03-07	X (1-1) | 2 (3-5) | 2 (0-1) | 1 (2-0) | 1 (2-0)
3110	3111	Górnik Zabrze	Wisła Kraków	29	12	6	11	37	42	1.28	1.45	69.0	44.8	37.9	48.3	2022-04-10	2 (1-4) | 2 (0-1) | X (0-0) | X (0-0) | 2 (0-1)
4901	5065	Cracovia	MKS Korona Kielce	28	11	9	8	40	28	1.43	1.00	71.4	50.0	14.3	50.0	2025-11-29	1 (1-0) | X (1-1) | 1 (2-0) | X (1-1) | X (0-0)
5065	7913	MKS Korona Kielce	KS Lechia Gdańsk	28	13	7	8	38	27	1.36	0.96	53.6	39.3	28.6	35.7	2025-09-27	1 (3-0) | 2 (2-3) | X (0-0) | 1 (1-0) | 1 (1-0)
3110	4901	Górnik Zabrze	Cracovia	28	8	6	14	28	44	1.00	1.57	71.4	39.3	28.6	35.7	2025-09-27	X (1-1) | 2 (0-1) | 2 (2-3) | 2 (0-5) | 1 (1-0)
3113	3117	Zagłębie Lubin	Pogoń Szczecin	27	8	8	11	34	36	1.26	1.33	77.8	44.4	22.2	40.7	2025-11-24	2 (1-5) | 2 (0-1) | X (2-2) | 1 (2-0) | 1 (1-0)
5065	7918	MKS Korona Kielce	Piast Gliwice	27	8	10	9	26	28	0.96	1.04	66.7	25.9	11.1	48.1	2025-10-31	X (0-0) | X (1-1) | 2 (0-2) | X (1-1) | X (0-0)
3110	7918	Górnik Zabrze	Piast Gliwice	27	9	6	11	27	30	1.04	1.15	51.9	33.3	18.5	37.0	2025-07-26	1 (1-0) | 2 (0-2) | 1 (1-0) | 1 (3-1) | X (0-0)
3111	5065	Wisła Kraków	MKS Korona Kielce	27	10	9	8	42	30	1.56	1.11	70.4	40.7	29.6	51.9	2020-07-11	X (1-1) | 1 (2-0) | X (1-1) | 1 (1-0) | 1 (6-2)
3110	3117	Górnik Zabrze	Pogoń Szczecin	26	10	10	6	36	28	1.38	1.08	73.1	46.2	26.9	61.5	2025-08-17	1 (3-0) | 2 (0-3) | 1 (1-0) | 2 (0-1) | 1 (1-0)
3111	4901	Wisła Kraków	Cracovia	25	12	7	6	33	20	1.32	0.80	60.0	32.0	16.0	52.0	2022-05-01	X (0-0) | 1 (1-0) | X (0-0) | X (1-1) | 1 (2-0)
3111	3113	Wisła Kraków	Zagłębie Lubin	25	12	3	10	39	38	1.56	1.52	72.0	68.0	44.0	60.0	2021-12-11	2 (1-2) | 2 (1-4) | 2 (1-2) | 2 (1-3) | 1 (1-0)
3111	7918	Wisła Kraków	Piast Gliwice	24	9	7	8	32	30	1.33	1.25	75.0	45.8	25.0	50.0	2022-04-03	X (2-2) | 2 (0-1) | 1 (3-2) | 2 (3-4) | 2 (0-4)
3117	5065	Pogoń Szczecin	MKS Korona Kielce	23	8	11	4	31	25	1.35	1.09	69.6	47.8	30.4	60.9	2025-09-13	2 (0-1) | X (0-0) | X (2-2) | 1 (3-1) | X (0-0)
3111	3117	Wisła Kraków	Pogoń Szczecin	23	10	5	8	36	30	1.57	1.30	73.9	56.5	30.4	52.2	2022-03-18	2 (1-4) | 2 (0-1) | 1 (2-1) | X (2-2) | 1 (1-0)
3105	3121	Ruch Chorzów	Lech Poznań	22	4	4	14	18	48	0.82	2.18	86.4	68.2	36.4	40.9	2024-05-03	1 (2-1) | 2 (0-2) | 2 (0-3) | 2 (0-5) | 2 (0-3)
3105	3106	Ruch Chorzów	Legia Warszawa	22	6	3	13	15	34	0.68	1.55	63.6	40.9	18.2	31.8	2024-02-09	2 (0-1) | 2 (0-3) | 1 (3-1) | 2 (0-2) | X (0-0)
3105	4901	Ruch Chorzów	Cracovia	21	10	3	8	33	23	1.57	1.10	71.4	38.1	23.8	38.1	2024-05-25	1 (2-0) | X (4-4) | 2 (0-2) | 2 (0-1) | X (1-1)
3105	3108	Ruch Chorzów	Śląsk Wrocław	21	6	7	8	21	29	1.00	1.38	66.7	42.9	23.8	52.4	2024-04-27	1 (3-2) | X (2-2) | 2 (0-6) | 1 (2-0) | 1 (2-1)
3105	7691	Ruch Chorzów	Jagiellonia Białystok	20	5	4	11	19	32	0.95	1.60	55.0	40.0	25.0	40.0	2024-02-24	X (1-1) | 2 (0-1) | 2 (1-2) | 2 (1-4) | 2 (0-4)
3105	7913	Ruch Chorzów	KS Lechia Gdańsk	20	5	9	6	22	25	1.10	1.25	65.0	40.0	15.0	55.0	2017-03-11	1 (2-1) | 2 (1-2) | 2 (1-2) | 2 (0-2) | 1 (3-2)
3105	5065	Ruch Chorzów	MKS Korona Kielce	19	8	5	6	26	18	1.37	0.95	68.4	42.1	21.1	42.1	2024-05-18	2 (0-2) | X (1-1) | 2 (0-1) | 1 (4-0) | 1 (2-1)
3105	3111	Ruch Chorzów	Wisła Kraków	19	6	5	8	22	27	1.16	1.42	73.7	47.4	31.6	57.9	2016-12-16	1 (1-0) | 1 (2-1) | 2 (2-3) | X (0-0) | 2 (1-2)
3113	3122	Zagłębie Lubin	Wisła Płock	18	6	3	9	24	31	1.33	1.72	88.9	66.7	33.3	55.6	2025-08-25	2 (1-2) | 2 (0-2) | 1 (2-1) | 1 (3-1) | 2 (0-4)
3105	7918	Ruch Chorzów	Piast Gliwice	18	7	5	6	18	18	1.00	1.00	72.2	44.4	5.6	27.8	2024-03-01	1 (3-0) | X (0-0) | 2 (0-3) | X (0-0) | 2 (1-2)
3113	3115	Zagłębie Lubin	Widzew Łódź	17	7	5	5	16	17	0.94	1.00	58.8	41.2	11.8	35.3	2025-12-06	1 (2-1) | 2 (0-1) | 1 (2-1) | 2 (0-2) | 1 (3-1)
4901	5064	Cracovia	MZKS Arka Gdynia	17	6	5	6	18	17	1.06	1.00	76.5	35.3	5.9	41.2	2025-10-04	2 (1-2) | 1 (1-0) | 1 (3-1) | 1 (3-0) | X (0-0)
3105	3110	Ruch Chorzów	Górnik Zabrze	17	5	5	7	16	17	0.94	1.00	58.8	41.2	11.8	35.3	2024-03-16	2 (1-2) | 2 (0-1) | 1 (2-0) | 1 (1-0) | X (2-2)
3105	3113	Ruch Chorzów	Zagłębie Lubin	17	6	6	5	20	24	1.18	1.41	76.5	52.9	29.4	64.7	2023-12-08	X (2-2) | X (1-1) | 1 (1-0) | 2 (1-2) | 2 (1-4)
3108	5064	Śląsk Wrocław	MZKS Arka Gdynia	17	8	3	6	31	22	1.82	1.29	94.1	64.7	29.4	58.8	2020-06-07	2 (1-2) | 1 (2-1) | 1 (4-0) | 1 (2-0) | 2 (1-2)
3122	4901	Wisła Płock	Cracovia	16	5	4	7	16	20	1.00	1.25	56.3	43.8	25.0	43.8	2025-12-04	X (0-0) | 2 (0-3) | 1 (1-0) | 2 (0-3) | 1 (2-1)
3121	3122	Lech Poznań	Wisła Płock	16	10	3	3	26	11	1.63	0.69	62.5	50.0	25.0	37.5	2025-11-30	X (0-0) | 1 (1-0) | 2 (1-3) | 1 (1-0) | 1 (4-1)
3115	5065	Widzew Łódź	MKS Korona Kielce	16	7	4	5	20	18	1.25	1.13	68.8	56.3	25.0	56.3	2025-11-23	2 (1-3) | 2 (1-2) | 2 (0-1) | 1 (3-1) | X (1-1)
3110	3122	Górnik Zabrze	Wisła Płock	16	5	5	6	26	22	1.63	1.38	75.0	43.8	43.8	56.3	2025-11-21	X (1-1) | 1 (3-2) | X (1-1) | 2 (2-3) | 1 (4-2)
3122	7691	Wisła Płock	Jagiellonia Białystok	16	6	4	6	25	24	1.56	1.50	75.0	62.5	37.5	68.8	2025-09-19	2 (0-1) | 2 (2-4) | X (1-1) | 1 (1-0) | 1 (3-0)
5064	7913	MZKS Arka Gdynia	KS Lechia Gdańsk	16	0	4	12	16	29	1.00	1.81	68.8	62.5	25.0	68.8	2025-08-24	2 (0-1) | 2 (3-4) | X (2-2) | X (0-0) | 2 (1-2)
3122	7918	Wisła Płock	Piast Gliwice	16	4	3	9	14	22	0.88	1.38	56.3	37.5	18.8	37.5	2025-08-01	1 (2-0) | 2 (0-1) | 1 (1-0) | 2 (0-2) | 2 (3-4)
3108	3122	Śląsk Wrocław	Wisła Płock	16	8	4	4	23	19	1.44	1.19	81.3	62.5	25.0	62.5	2023-05-13	1 (3-1) | 1 (2-1) | 1 (2-1) | 1 (3-1) | X (0-0)
3111	5064	Wisła Kraków	MZKS Arka Gdynia	16	7	2	7	19	19	1.19	1.19	43.8	43.8	37.5	31.3	2020-07-18	2 (0-1) | X (0-0) | 2 (0-1) | 2 (1-3) | 2 (1-4)
3122	5065	Wisła Płock	MKS Korona Kielce	15	7	2	6	24	22	1.60	1.47	86.7	60.0	33.3	66.7	2025-12-08	X (1-1) | 1 (2-0) | 2 (0-1) | 1 (2-1) | 1 (3-1)
3121	5064	Lech Poznań	MZKS Arka Gdynia	15	5	7	3	17	9	1.13	0.60	53.3	33.3	13.3	33.3	2025-11-09	2 (1-3) | X (1-1) | X (0-0) | 1 (1-0) | 2 (0-1)
3117	3122	Pogoń Szczecin	Wisła Płock	15	6	3	6	20	18	1.33	1.20	80.0	46.7	26.7	46.7	2025-11-03	2 (0-2) | 1 (1-0) | X (2-2) | 2 (1-2) | 2 (0-1)
3106	3115	Legia Warszawa	Widzew Łódź	15	10	4	1	25	10	1.67	0.67	66.7	33.3	20.0	53.3	2025-11-02	X (1-1) | 1 (2-0) | 1 (2-1) | 2 (0-1) | 1 (3-1)
5064	7918	MZKS Arka Gdynia	Piast Gliwice	15	4	4	7	15	21	1.00	1.40	60.0	53.3	20.0	60.0	2025-10-25	1 (2-1) | 2 (0-1) | X (0-0) | 2 (1-2) | 2 (0-1)
5064	7691	MZKS Arka Gdynia	Jagiellonia Białystok	15	2	2	11	13	32	0.87	2.13	80.0	60.0	40.0	46.7	2025-10-18	2 (0-4) | 2 (0-2) | 2 (0-3) | 2 (1-3) | 2 (0-2)
3113	5064	Zagłębie Lubin	MZKS Arka Gdynia	15	5	5	5	18	16	1.20	1.07	73.3	33.3	26.7	46.7	2025-09-29	1 (4-0) | 2 (2-3) | 2 (1-2) | 1 (2-0) | X (0-0)
3110	3115	Górnik Zabrze	Widzew Łódź	15	8	4	3	28	19	1.87	1.27	93.3	60.0	46.7	53.3	2025-09-21	1 (3-2) | X (0-0) | 1 (2-0) | 2 (1-3) | X (1-1)
5064	5065	MZKS Arka Gdynia	MKS Korona Kielce	15	6	4	5	19	13	1.27	0.87	66.7	46.7	6.7	53.3	2025-09-20	X (0-0) | X (1-1) | 1 (1-0) | X (1-1) | 1 (2-0)
3115	3121	Widzew Łódź	Lech Poznań	15	3	4	8	13	23	0.87	1.53	66.7	46.7	26.7	53.3	2025-08-31	2 (1-2) | 2 (1-4) | 1 (2-1) | X (1-1) | 1 (3-1)
3106	3122	Legia Warszawa	Wisła Płock	15	8	1	6	23	20	1.53	1.33	60.0	46.7	40.0	46.7	2025-08-17	2 (0-1) | 1 (2-0) | 2 (1-2) | 2 (0-1) | 1 (5-2)
3106	5064	Legia Warszawa	MZKS Arka Gdynia	15	11	2	2	26	9	1.73	0.60	53.3	33.3	20.0	33.3	2025-08-03	X (0-0) | 1 (5-1) | 1 (1-0) | 1 (2-1) | X (1-1)
3115	7691	Widzew Łódź	Jagiellonia Białystok	15	4	4	7	24	24	1.60	1.60	80.0	60.0	46.7	73.3	2025-07-27	2 (2-3) | 2 (0-1) | 2 (0-1) | 2 (1-3) | 2 (1-2)
3108	3115	Śląsk Wrocław	Widzew Łódź	15	6	5	4	21	17	1.40	1.13	66.7	60.0	26.7	53.3	2025-02-15	1 (3-0) | X (0-0) | 1 (2-1) | 1 (2-0) | 2 (0-1)
3111	3122	Wisła Kraków	Wisła Płock	15	6	3	6	24	26	1.60	1.73	80.0	66.7	46.7	66.7	2022-04-25	2 (3-4) | 2 (0-2) | 1 (3-1) | 2 (0-3) | 1 (1-0)
3113	35268	Zagłębie Lubin	Raków Częstochowa	14	4	2	8	14	28	1.00	2.00	85.7	64.3	28.6	57.1	2025-12-14	1 (1-0) | 2 (0-2) | 2 (1-5) | 1 (2-0) | 2 (0-5)
3122	7913	Wisła Płock	KS Lechia Gdańsk	14	4	2	8	10	19	0.71	1.36	64.3	35.7	7.1	42.9	2025-10-03	X (1-1) | 2 (0-1) | 1 (1-0) | 2 (0-1) | 2 (1-3)
3110	35268	Górnik Zabrze	Raków Częstochowa	14	7	3	4	15	12	1.07	0.86	50.0	35.7	14.3	42.9	2025-09-15	1 (1-0) | 2 (0-1) | X (0-0) | 1 (1-0) | 1 (2-1)
3115	4901	Widzew Łódź	Cracovia	14	6	6	2	20	13	1.43	0.93	78.6	35.7	28.6	57.1	2025-08-15	2 (0-1) | X (1-1) | 1 (3-1) | X (2-2) | 1 (2-0)
3105	3117	Ruch Chorzów	Pogoń Szczecin	14	2	4	8	13	27	0.93	1.93	85.7	57.1	28.6	64.3	2024-04-12	2 (0-5) | 2 (0-3) | 2 (1-2) | 2 (1-2) | X (1-1)
3108	7919	Śląsk Wrocław	Podbeskidzie Bielsko-Biała	14	6	8	0	23	13	1.64	0.93	71.4	35.7	28.6	57.1	2021-04-20	1 (4-3) | 1 (2-0) | 1 (2-1) | 1 (1-0) | X (1-1)
7691	7919	Jagiellonia Białystok	Podbeskidzie Bielsko-Biała	14	4	5	5	19	25	1.36	1.79	85.7	64.3	42.9	64.3	2021-02-20	X (1-1) | X (2-2) | 1 (3-2) | 2 (0-3) | X (1-1)
3115	7913	Widzew Łódź	KS Lechia Gdańsk	13	3	3	7	13	17	1.00	1.31	69.2	38.5	23.1	46.2	2025-11-08	2 (1-2) | 1 (2-0) | X (1-1) | X (0-0) | 2 (2-3)
3110	5064	Górnik Zabrze	MZKS Arka Gdynia	13	4	5	4	17	14	1.31	1.08	69.2	30.8	23.1	53.8	2025-11-02	1 (5-1) | 1 (2-1) | 1 (2-0) | 2 (0-1) | 1 (1-0)
4901	35268	Cracovia	Raków Częstochowa	13	7	5	1	20	9	1.54	0.69	69.2	38.5	23.1	38.5	2025-10-18	1 (2-0) | X (0-0) | 1 (1-0) | 1 (2-0) | X (1-1)
3121	35268	Lech Poznań	Raków Częstochowa	13	4	4	5	21	21	1.62	1.62	76.9	69.2	53.8	53.8	2025-09-24	X (2-2) | 2 (0-1) | X (0-0) | 2 (0-4) | 1 (4-1)
3106	35268	Legia Warszawa	Raków Częstochowa	13	4	4	5	20	21	1.54	1.62	92.3	61.5	46.2	76.9	2025-09-20	X (1-1) | 2 (2-3) | 2 (0-1) | X (1-1) | 2 (1-2)
3117	35268	Pogoń Szczecin	Raków Częstochowa	13	3	3	7	9	14	0.69	1.08	53.8	30.8	7.7	38.5	2025-08-31	1 (2-0) | 1 (1-0) | 2 (0-1) | 2 (1-2) | X (1-1)
3111	7919	Wisła Kraków	Podbeskidzie Bielsko-Biała	13	5	4	4	23	15	1.77	1.15	69.2	53.8	38.5	46.2	2021-04-05	2 (0-2) | 1 (3-0) | 1 (4-3) | 2 (1-2) | 1 (6-0)
3110	7919	Górnik Zabrze	Podbeskidzie Bielsko-Biała	13	7	3	3	23	13	1.77	1.00	76.9	53.8	23.1	46.2	2021-02-07	2 (1-2) | 1 (4-2) | 1 (1-0) | X (0-0) | 2 (0-2)
5065	7919	MKS Korona Kielce	Podbeskidzie Bielsko-Biała	13	7	5	1	22	14	1.69	1.08	84.6	53.8	30.8	76.9	2016-05-06	X (1-1) | X (1-1) | X (0-0) | 1 (3-1) | X (2-2)
3105	3128	Ruch Chorzów	GKS Bełchatów	13	6	1	6	17	16	1.31	1.23	61.5	53.8	15.4	53.8	2015-05-25	2 (2-4) | 1 (1-0) | 2 (0-1) | 1 (3-0) | 1 (2-1)
3115	7918	Widzew Łódź	Piast Gliwice	12	7	2	3	18	14	1.50	1.17	83.3	50.0	16.7	58.3	2025-11-28	1 (2-0) | 1 (2-0) | 1 (1-0) | 1 (1-0) | 2 (2-3)
7918	35268	Piast Gliwice	Raków Częstochowa	12	4	1	7	9	15	0.75	1.25	50.0	41.7	16.7	33.3	2025-11-22	1 (3-1) | 2 (0-3) | 1 (1-0) | 2 (1-3) | 1 (2-1)
7691	35268	Jagiellonia Białystok	Raków Częstochowa	12	3	3	6	18	22	1.50	1.83	83.3	83.3	41.7	66.7	2025-11-02	2 (1-2) | 1 (2-1) | X (2-2) | 1 (4-2) | 2 (1-2)
3122	5064	Wisła Płock	MZKS Arka Gdynia	12	4	6	2	16	12	1.33	1.00	66.7	33.3	25.0	58.3	2025-08-29	2 (0-1) | X (0-0) | 1 (2-1) | 1 (4-1) | X (1-1)
3108	35268	Śląsk Wrocław	Raków Częstochowa	12	2	4	6	9	20	0.75	1.67	75.0	41.7	16.7	58.3	2025-04-25	2 (0-3) | X (0-0) | 1 (2-1) | X (1-1) | 2 (1-4)
3106	7919	Legia Warszawa	Podbeskidzie Bielsko-Biała	12	7	1	4	23	10	1.92	0.83	66.7	66.7	33.3	41.7	2021-05-16	1 (1-0) | 2 (0-1) | X (2-2) | 1 (5-0) | 1 (3-0)
7918	7919	Piast Gliwice	Podbeskidzie Bielsko-Biała	12	9	3	0	27	10	2.25	0.83	75.0	66.7	41.7	50.0	2021-05-03	1 (2-0) | 1 (5-0) | 1 (3-2) | X (2-2) | 1 (2-1)
3121	7919	Lech Poznań	Podbeskidzie Bielsko-Biała	12	5	3	4	14	12	1.17	1.00	58.3	33.3	25.0	33.3	2021-04-23	2 (0-1) | 1 (4-0) | 2 (1-4) | 2 (0-1) | 1 (2-0)
7913	7919	KS Lechia Gdańsk	Podbeskidzie Bielsko-Biała	12	4	3	5	22	17	1.83	1.42	75.0	66.7	58.3	58.3	2021-03-06	X (2-2) | 1 (4-0) | 1 (5-0) | X (1-1) | 2 (0-1)
4901	7919	Cracovia	Podbeskidzie Bielsko-Biała	12	5	4	3	21	14	1.75	1.17	75.0	50.0	41.7	66.7	2021-02-13	X (1-1) | X (2-2) | 1 (4-1) | 1 (1-0) | 1 (3-0)
3128	7691	GKS Bełchatów	Jagiellonia Białystok	12	4	5	3	13	10	1.08	0.83	66.7	25.0	16.7	41.7	2015-04-25	X (0-0) | 1 (1-0) | X (1-1) | X (2-2) | 1 (2-0)
3121	3128	Lech Poznań	GKS Bełchatów	12	5	4	3	19	11	1.58	0.92	58.3	50.0	33.3	41.7	2015-04-04	1 (2-1) | 1 (5-0) | X (0-0) | 1 (1-0) | 2 (0-1)
3128	7913	GKS Bełchatów	KS Lechia Gdańsk	12	5	5	2	12	9	1.00	0.75	58.3	25.0	8.3	50.0	2015-03-07	2 (0-1) | X (1-1) | X (1-1) | X (1-1) | 2 (1-3)
3111	3128	Wisła Kraków	GKS Bełchatów	12	6	4	2	17	10	1.42	0.83	66.7	50.0	25.0	50.0	2015-02-28	2 (1-3) | 1 (1-0) | X (0-0) | 1 (2-1) | X (2-2)
3108	3128	Śląsk Wrocław	GKS Bełchatów	12	6	1	5	13	15	1.08	1.25	66.7	50.0	8.3	41.7	2014-12-12	1 (2-1) | 2 (0-2) | 2 (0-1) | 1 (2-1) | 1 (1-0)
3106	3128	Legia Warszawa	GKS Bełchatów	12	5	3	4	14	9	1.17	0.75	66.7	25.0	8.3	16.7	2014-11-21	1 (3-0) | 2 (0-1) | X (0-0) | 1 (2-0) | X (1-1)
7691	36851	Jagiellonia Białystok	Bruk-Bet Termalica Nieciecza	11	4	2	5	7	12	0.64	1.09	45.5	36.4	9.1	27.3	2025-12-07	2 (1-2) | 2 (0-4) | 2 (1-2) | 1 (1-0) | X (0-0)
7913	36851	KS Lechia Gdańsk	Bruk-Bet Termalica Nieciecza	11	5	3	3	18	10	1.64	0.91	81.8	36.4	18.2	54.5	2025-11-29	1 (5-1) | 1 (2-0) | 1 (2-0) | 2 (0-1) | X (2-2)
7913	35268	KS Lechia Gdańsk	Raków Częstochowa	11	2	0	9	9	26	0.82	2.36	90.9	90.9	36.4	54.5	2025-10-26	2 (1-2) | 2 (1-3) | 2 (1-2) | 2 (0-4) | 2 (0-3)
3117	36851	Pogoń Szczecin	Bruk-Bet Termalica Nieciecza	11	4	5	2	22	14	2.00	1.27	100.0	45.5	45.5	72.7	2025-08-02	X (1-1) | X (2-2) | 1 (3-1) | 1 (2-0) | 1 (4-2)
3105	7919	Ruch Chorzów	Podbeskidzie Bielsko-Biała	11	4	4	3	12	12	1.09	1.09	72.7	36.4	18.2	45.5	2015-12-05	X (1-1) | X (1-1) | 1 (2-0) | 1 (2-0) | 2 (0-3)
3128	5065	GKS Bełchatów	MKS Korona Kielce	11	3	4	4	11	14	1.00	1.27	72.7	27.3	27.3	45.5	2015-06-02	X (2-2) | 2 (0-2) | 1 (2-0) | 2 (0-1) | X (1-1)
3128	4901	GKS Bełchatów	Cracovia	11	4	3	4	16	13	1.45	1.18	72.7	54.5	27.3	54.5	2015-05-10	X (1-1) | 2 (1-3) | X (1-1) | X (2-2) | 2 (1-2)
3117	7295	Pogoń Szczecin	Radomiak Radom	10	4	2	4	18	14	1.80	1.40	90.0	60.0	50.0	40.0	2025-12-06	X (2-2) | 2 (1-5) | 2 (0-2) | 2 (0-1) | 1 (4-0)
5065	35268	MKS Korona Kielce	Raków Częstochowa	10	3	2	5	8	11	0.80	1.10	50.0	20.0	10.0	30.0	2025-11-09	2 (1-4) | X (1-1) | X (1-1) | 2 (0-2) | 2 (0-1)
3106	36851	Legia Warszawa	Bruk-Bet Termalica Nieciecza	10	3	3	4	17	11	1.70	1.10	80.0	60.0	20.0	50.0	2025-11-09	2 (1-2) | 1 (4-1) | X (0-0) | 1 (3-0) | 2 (0-1)
3121	36851	Lech Poznań	Bruk-Bet Termalica Nieciecza	10	8	1	1	28	8	2.80	0.80	90.0	80.0	60.0	50.0	2025-09-20	1 (2-0) | 1 (5-0) | 1 (3-1) | 1 (3-1) | 1 (3-1)
3117	5064	Pogoń Szczecin	MZKS Arka Gdynia	10	7	2	1	25	11	2.50	1.10	90.0	70.0	40.0	60.0	2025-08-09	2 (1-2) | X (1-1) | 1 (2-0) | X (3-3) | 1 (3-2)
3122	35268	Wisła Płock	Raków Częstochowa	10	2	2	6	10	23	1.00	2.30	100.0	70.0	20.0	70.0	2025-07-27	1 (2-1) | 2 (1-2) | 2 (1-7) | 2 (0-2) | X (1-1)
4901	36851	Cracovia	Bruk-Bet Termalica Nieciecza	10	3	2	5	16	18	1.60	1.80	100.0	60.0	40.0	80.0	2025-07-25	1 (2-0) | 2 (1-2) | 1 (2-1) | 1 (4-2) | 2 (0-2)
3106	38732	Legia Warszawa	Stal Mielec	10	3	3	4	15	16	1.50	1.60	80.0	70.0	60.0	70.0	2025-05-24	X (2-2) | X (2-2) | 1 (3-1) | 2 (1-3) | 1 (2-0)
35268	38732	Raków Częstochowa	Stal Mielec	10	8	2	0	16	4	1.60	0.40	60.0	40.0	10.0	30.0	2025-05-03	1 (2-0) | 1 (1-0) | X (0-0) | 1 (2-0) | X (0-0)
3113	38732	Zagłębie Lubin	Stal Mielec	10	3	4	3	17	18	1.70	1.80	90.0	70.0	60.0	60.0	2025-04-28	X (2-2) | X (2-2) | X (0-0) | 2 (2-4) | 1 (2-0)
3110	38732	Górnik Zabrze	Stal Mielec	10	6	2	2	14	9	1.40	0.90	70.0	50.0	20.0	60.0	2025-04-22	X (0-0) | 1 (3-1) | X (1-1) | 2 (1-2) | 1 (1-0)
3108	38732	Śląsk Wrocław	Stal Mielec	10	3	4	3	12	12	1.20	1.20	80.0	40.0	20.0	70.0	2025-03-15	1 (4-1) | 1 (2-1) | 2 (0-1) | 2 (1-3) | X (1-1)
3117	38732	Pogoń Szczecin	Stal Mielec	10	6	1	3	18	12	1.80	1.20	60.0	50.0	40.0	50.0	2025-02-16	1 (2-1) | 1 (1-0) | X (0-0) | 2 (2-3) | 1 (4-2)
7691	38732	Jagiellonia Białystok	Stal Mielec	10	3	4	3	20	14	2.00	1.40	100.0	60.0	50.0	70.0	2025-02-07	2 (1-2) | 1 (2-0) | 2 (2-3) | 1 (4-0) | X (1-1)
3105	3115	Ruch Chorzów	Widzew Łódź	10	5	2	3	15	11	1.50	1.10	80.0	60.0	20.0	60.0	2024-04-20	2 (2-3) | 2 (1-2) | 1 (2-1) | 1 (1-0) | 1 (3-0)
3108	36851	Śląsk Wrocław	Bruk-Bet Termalica Nieciecza	10	4	2	4	15	17	1.50	1.70	100.0	70.0	20.0	80.0	2022-04-23	2 (0-4) | 2 (3-4) | 1 (2-1) | 2 (1-2) | X (1-1)
3125	7918	Górnik Łęczna	Piast Gliwice	10	2	4	4	10	14	1.00	1.40	60.0	50.0	20.0	50.0	2022-04-09	2 (0-1) | X (1-1) | 2 (1-2) | 1 (1-0) | X (3-3)
3108	3125	Śląsk Wrocław	Górnik Łęczna	10	5	4	1	17	12	1.70	1.20	90.0	60.0	30.0	70.0	2022-02-11	X (1-1) | X (0-0) | 2 (0-2) | X (2-2) | 1 (3-0)
3111	36851	Wisła Kraków	Bruk-Bet Termalica Nieciecza	10	5	4	1	21	13	2.10	1.30	80.0	70.0	50.0	60.0	2021-12-17	1 (3-0) | X (2-2) | X (3-3) | 1 (1-0) | 2 (1-2)
3117	7919	Pogoń Szczecin	Podbeskidzie Bielsko-Biała	10	6	2	2	17	10	1.70	1.00	90.0	50.0	20.0	60.0	2021-04-16	1 (2-0) | X (1-1) | 1 (2-0) | 1 (3-2) | 2 (1-2)
3113	7919	Zagłębie Lubin	Podbeskidzie Bielsko-Biała	10	3	3	4	10	12	1.00	1.20	70.0	50.0	10.0	60.0	2021-04-11	1 (2-1) | 2 (1-2) | 1 (2-1) | 2 (0-2) | 1 (3-2)
3110	3128	Górnik Zabrze	GKS Bełchatów	10	4	2	4	10	9	1.00	0.90	60.0	10.0	10.0	30.0	2015-04-20	1 (2-0) | 2 (0-1) | 2 (0-2) | 1 (2-0) | X (1-1)
3119	3128	Polonia Warszawa	GKS Bełchatów	10	4	2	4	13	11	1.30	1.10	60.0	60.0	20.0	40.0	2013-04-27	2 (0-1) | 1 (5-0) | 2 (1-2) | 1 (2-1) | X (0-0)
3105	3119	Ruch Chorzów	Polonia Warszawa	10	3	1	6	9	17	0.90	1.70	80.0	60.0	20.0	50.0	2013-04-22	1 (2-1) | 2 (1-2) | 1 (1-0) | 2 (0-1) | 2 (0-3)
3108	3119	Śląsk Wrocław	Polonia Warszawa	10	4	2	4	14	15	1.40	1.50	70.0	70.0	40.0	40.0	2013-04-13	X (2-2) | 1 (2-1) | 2 (0-3) | 1 (4-0) | 1 (1-0)
3106	3119	Legia Warszawa	Polonia Warszawa	10	2	5	3	8	11	0.80	1.10	60.0	40.0	10.0	50.0	2013-03-30	1 (2-1) | X (1-1) | X (0-0) | 2 (1-2) | 1 (1-0)
3119	7691	Polonia Warszawa	Jagiellonia Białystok	10	3	2	5	12	11	1.20	1.10	70.0	30.0	20.0	40.0	2013-03-15	2 (0-2) | X (1-1) | 1 (4-1) | 2 (2-3) | 1 (2-0)
3111	3119	Wisła Kraków	Polonia Warszawa	10	6	1	3	12	10	1.20	1.00	70.0	40.0	10.0	50.0	2013-03-09	1 (2-1) | 2 (1-3) | 2 (0-1) | X (1-1) | 2 (0-2)
3119	3121	Polonia Warszawa	Lech Poznań	10	4	2	4	13	15	1.30	1.50	60.0	50.0	30.0	40.0	2013-03-01	1 (1-0) | 2 (1-2) | 2 (0-1) | 1 (1-0) | 1 (1-0)
3119	7913	Polonia Warszawa	KS Lechia Gdańsk	10	3	5	2	11	8	1.10	0.80	60.0	30.0	20.0	60.0	2013-02-22	X (1-1) | 1 (3-1) | 1 (3-1) | 1 (1-0) | X (0-0)
4901	7295	Cracovia	Radomiak Radom	9	5	0	4	16	9	1.78	1.00	77.8	66.7	11.1	33.3	2025-11-07	2 (0-3) | 2 (1-2) | 2 (1-2) | 1 (6-0) | 1 (1-0)
3113	36851	Zagłębie Lubin	Bruk-Bet Termalica Nieciecza	9	6	2	1	15	6	1.67	0.67	77.8	22.2	11.1	44.4	2025-10-24	X (1-1) | 1 (2-0) | 1 (2-1) | 1 (4-2) | X (1-1)
3113	7295	Zagłębie Lubin	Radomiak Radom	9	5	0	4	16	13	1.78	1.44	55.6	44.4	44.4	44.4	2025-10-04	2 (1-3) | 1 (1-0) | 1 (1-0) | 1 (4-3) | 2 (2-3)
7918	36851	Piast Gliwice	Bruk-Bet Termalica Nieciecza	9	6	1	2	20	11	2.22	1.22	77.8	66.7	33.3	66.7	2025-09-27	1 (4-2) | 1 (1-0) | 1 (2-1) | 1 (4-0) | X (1-1)
7295	7918	Radomiak Radom	Piast Gliwice	9	3	5	1	11	9	1.22	1.00	66.7	33.3	22.2	66.7	2025-09-20	1 (1-0) | X (0-0) | X (1-1) | 1 (3-2) | X (1-1)
3106	7295	Legia Warszawa	Radomiak Radom	9	5	0	4	14	14	1.56	1.56	77.8	66.7	44.4	44.4	2025-09-14	1 (4-1) | 2 (1-3) | 1 (4-1) | 2 (0-3) | 1 (1-0)
5065	36851	MKS Korona Kielce	Bruk-Bet Termalica Nieciecza	9	6	1	2	14	5	1.56	0.56	55.6	44.4	22.2	33.3	2025-08-30	1 (3-1) | 1 (3-0) | 1 (2-1) | 1 (2-0) | 2 (0-1)
3115	3117	Widzew Łódź	Pogoń Szczecin	9	1	2	6	9	19	1.00	2.11	88.9	66.7	33.3	66.7	2025-08-22	2 (1-2) | 2 (0-4) | 2 (0-2) | 2 (1-2) | X (3-3)
7295	7691	Radomiak Radom	Jagiellonia Białystok	9	1	3	5	10	19	1.11	2.11	88.9	66.7	44.4	66.7	2025-08-17	2 (1-2) | 2 (0-5) | 2 (2-3) | 2 (0-2) | 2 (2-3)
7295	35268	Radomiak Radom	Raków Częstochowa	9	2	2	5	8	15	0.89	1.67	77.8	66.7	22.2	44.4	2025-08-03	1 (3-1) | 2 (1-2) | 2 (0-2) | 1 (2-1) | 2 (0-3)
4901	38732	Cracovia	Stal Mielec	9	2	6	1	12	12	1.33	1.33	88.9	44.4	22.2	77.8	2025-04-04	X (1-1) | X (1-1) | X (2-2) | 1 (2-1) | 2 (0-2)
3121	38732	Lech Poznań	Stal Mielec	9	4	4	1	12	6	1.33	0.67	66.7	44.4	22.2	55.6	2025-03-08	1 (3-1) | 1 (2-0) | X (0-0) | 1 (2-1) | X (0-0)
3110	3123	Górnik Zabrze	ŁKS Łódź	9	5	3	1	17	6	1.89	0.67	77.8	33.3	33.3	44.4	2024-04-27	1 (4-1) | 1 (5-0) | 1 (3-1) | 1 (1-0) | X (1-1)
3125	7691	Górnik Łęczna	Jagiellonia Białystok	9	2	1	6	6	16	0.67	1.78	66.7	44.4	22.2	33.3	2022-05-21	2 (0-1) | 1 (2-1) | 2 (0-5) | 2 (0-2) | 2 (0-2)
3111	3125	Wisła Kraków	Górnik Łęczna	9	4	3	2	14	9	1.56	1.00	77.8	44.4	33.3	55.6	2022-02-21	X (0-0) | 1 (3-1) | 2 (1-3) | 1 (3-2) | 1 (3-0)
3125	4901	Górnik Łęczna	Cracovia	9	4	3	2	10	7	1.11	0.78	66.7	44.4	0.0	33.3	2021-12-12	1 (2-0) | 1 (3-0) | X (1-1) | X (0-0) | X (0-0)
3105	5064	Ruch Chorzów	MZKS Arka Gdynia	9	4	3	2	10	7	1.11	0.78	66.7	44.4	0.0	33.3	2017-05-27	X (1-1) | 2 (1-2) | 2 (0-3) | 1 (2-0) | X (0-0)
3128	7918	GKS Bełchatów	Piast Gliwice	9	2	2	5	10	17	1.11	1.89	55.6	55.6	44.4	55.6	2015-05-19	2 (3-6) | 2 (1-3) | X (0-0) | 1 (3-2) | 2 (1-3)
3110	7295	Górnik Zabrze	Radomiak Radom	8	3	3	2	9	9	1.13	1.13	62.5	50.0	25.0	37.5	2025-11-28	2 (0-4) | 1 (3-2) | 1 (2-1) | X (1-1) | X (0-0)
3110	36851	Górnik Zabrze	Bruk-Bet Termalica Nieciecza	8	2	3	3	8	10	1.00	1.25	75.0	50.0	12.5	50.0	2025-08-08	2 (0-1) | X (1-1) | 2 (1-3) | 1 (3-0) | 1 (2-1)
7295	38732	Radomiak Radom	Stal Mielec	8	2	3	3	8	10	1.00	1.25	75.0	37.5	12.5	62.5	2025-05-16	X (2-2) | 2 (1-2) | 1 (2-1) | 2 (0-2) | 1 (1-0)
7913	38732	KS Lechia Gdańsk	Stal Mielec	8	5	2	1	16	11	2.00	1.38	62.5	62.5	50.0	62.5	2025-04-14	1 (3-2) | 2 (1-2) | X (0-0) | 1 (1-0) | 1 (3-2)
7918	38732	Piast Gliwice	Stal Mielec	8	4	2	2	16	9	2.00	1.13	100.0	62.5	37.5	50.0	2025-02-21	X (2-2) | 2 (0-2) | 1 (3-0) | 1 (2-0) | 1 (4-0)
3108	7295	Śląsk Wrocław	Radomiak Radom	8	2	3	3	6	7	0.75	0.88	62.5	12.5	0.0	37.5	2025-02-08	X (1-1) | 2 (1-2) | 1 (2-0) | 1 (1-0) | 2 (0-1)
7691	7922	Jagiellonia Białystok	Warta Poznań	8	4	2	2	14	11	1.75	1.38	100.0	50.0	25.0	62.5	2024-05-25	1 (3-0) | 1 (2-1) | 1 (3-1) | 2 (0-2) | X (1-1)
3106	7922	Legia Warszawa	Warta Poznań	8	5	1	2	12	6	1.50	0.75	50.0	37.5	25.0	25.0	2024-05-19	1 (1-0) | X (2-2) | 2 (0-1) | 1 (1-0) | 2 (0-1)
3108	3123	Śląsk Wrocław	ŁKS Łódź	8	7	1	0	18	3	2.25	0.38	75.0	75.0	25.0	37.5	2024-05-04	1 (2-1) | 1 (2-1) | 1 (4-0) | 1 (1-0) | 1 (2-1)
7918	7922	Piast Gliwice	Warta Poznań	8	2	3	3	7	8	0.88	1.00	62.5	12.5	12.5	37.5	2024-04-26	1 (2-0) | X (1-1) | X (1-1) | 2 (0-2) | 1 (3-2)
7922	38732	Warta Poznań	Stal Mielec	8	4	3	1	9	4	1.13	0.50	25.0	12.5	12.5	25.0	2024-04-22	1 (5-2) | 1 (1-0) | 2 (0-1) | X (1-1) | 1 (1-0)
3121	3123	Lech Poznań	ŁKS Łódź	8	7	1	0	23	5	2.88	0.63	100.0	75.0	50.0	50.0	2024-04-21	1 (3-2) | 1 (3-1) | 1 (2-0) | 1 (2-1) | 1 (4-0)
3123	4901	ŁKS Łódź	Cracovia	8	4	2	2	12	12	1.50	1.50	75.0	50.0	37.5	50.0	2024-04-05	X (2-2) | 2 (0-2) | 1 (1-0) | 1 (2-1) | X (2-2)
3113	7922	Zagłębie Lubin	Warta Poznań	8	3	3	2	7	8	0.88	1.00	50.0	25.0	25.0	25.0	2024-04-02	X (1-1) | 1 (1-0) | X (0-0) | X (2-2) | 2 (0-4)
3123	7691	ŁKS Łódź	Jagiellonia Białystok	8	1	2	5	5	20	0.63	2.50	87.5	62.5	37.5	37.5	2024-03-30	2 (0-6) | X (2-2) | 2 (0-3) | 2 (0-2) | 2 (1-2)
3121	7922	Lech Poznań	Warta Poznań	8	8	0	0	14	2	1.75	0.25	75.0	25.0	0.0	25.0	2024-03-15	1 (2-0) | 1 (2-0) | 1 (2-0) | 1 (1-0) | 1 (2-1)
4901	7922	Cracovia	Warta Poznań	8	1	2	5	2	6	0.25	0.75	25.0	0.0	0.0	0.0	2024-03-01	2 (0-1) | X (0-0) | X (0-0) | 2 (0-2) | 2 (0-1)
3121	3125	Lech Poznań	Górnik Łęczna	8	5	3	0	12	4	1.50	0.50	62.5	37.5	12.5	50.0	2022-04-20	1 (3-0) | X (1-1) | X (0-0) | 1 (2-1) | 1 (1-0)
3117	3125	Pogoń Szczecin	Górnik Łęczna	8	3	3	2	16	11	2.00	1.38	75.0	62.5	62.5	62.5	2022-04-02	1 (4-0) | 1 (4-1) | X (2-2) | X (1-1) | 1 (3-2)
3125	7913	Górnik Łęczna	KS Lechia Gdańsk	8	1	1	6	6	18	0.75	2.25	100.0	62.5	37.5	50.0	2022-03-19	2 (0-2) | 2 (0-4) | 2 (0-3) | 2 (1-2) | 1 (3-1)
3106	3125	Legia Warszawa	Górnik Łęczna	8	6	0	2	19	6	2.38	0.75	75.0	62.5	50.0	37.5	2022-03-11	1 (1-0) | 1 (3-1) | 1 (5-0) | 2 (0-1) | 1 (2-1)
3125	5065	Górnik Łęczna	MKS Korona Kielce	8	5	1	2	15	8	1.88	1.00	87.5	50.0	37.5	50.0	2017-03-03	2 (1-2) | 1 (4-0) | X (1-1) | 1 (3-2) | 1 (2-0)
3111	3115	Wisła Kraków	Widzew Łódź	8	6	1	1	12	4	1.50	0.50	62.5	37.5	0.0	37.5	2014-04-05	2 (1-2) | 1 (3-0) | 1 (1-0) | 1 (2-1) | 1 (1-0)
3113	3119	Zagłębie Lubin	Polonia Warszawa	8	6	1	1	11	2	1.38	0.25	37.5	25.0	12.5	12.5	2013-05-27	X (0-0) | 1 (1-0) | 1 (4-0) | 1 (1-0) | 1 (1-0)
3113	3128	Zagłębie Lubin	GKS Bełchatów	8	3	3	2	12	9	1.50	1.13	87.5	37.5	25.0	75.0	2013-05-19	2 (2-3) | 1 (1-0) | X (1-1) | 2 (1-2) | 1 (2-0)
3110	3119	Górnik Zabrze	Polonia Warszawa	8	1	3	4	3	11	0.38	1.38	62.5	12.5	12.5	25.0	2013-05-18	2 (0-4) | X (1-1) | 1 (1-0) | X (1-1) | X (0-0)
3119	5065	Polonia Warszawa	MKS Korona Kielce	8	2	3	3	8	13	1.00	1.63	87.5	50.0	37.5	50.0	2013-05-03	X (1-1) | 1 (2-0) | 2 (0-3) | X (0-0) | 1 (3-1)
3119	4901	Polonia Warszawa	Cracovia	8	3	2	3	9	8	1.13	1.00	62.5	50.0	12.5	50.0	2012-04-16	1 (2-1) | X (0-0) | 2 (1-3) | 1 (3-0) | 1 (2-1)
3121	7295	Lech Poznań	Radomiak Radom	7	3	3	1	13	9	1.86	1.29	85.7	71.4	42.9	85.7	2025-11-23	1 (4-1) | X (2-2) | 1 (2-1) | X (2-2) | X (1-1)
7295	7913	Radomiak Radom	KS Lechia Gdańsk	7	5	1	1	15	7	2.14	1.00	85.7	71.4	42.9	71.4	2025-11-03	1 (2-1) | 1 (2-1) | 2 (0-1) | 1 (3-1) | 1 (4-1)
3122	36851	Wisła Płock	Bruk-Bet Termalica Nieciecza	7	4	2	1	8	4	1.14	0.57	42.9	28.6	14.3	42.9	2025-10-20	1 (3-1) | 2 (0-1) | X (1-1) | 1 (2-1) | 1 (1-0)
3115	7295	Widzew Łódź	Radomiak Radom	7	3	1	3	12	15	1.71	2.14	100.0	85.7	71.4	85.7	2025-10-17	1 (3-2) | X (1-1) | 1 (3-2) | 1 (3-1) | 2 (0-3)
3115	35268	Widzew Łódź	Raków Częstochowa	7	0	2	5	4	10	0.57	1.43	57.1	28.6	14.3	42.9	2025-09-28	2 (0-1) | 2 (1-2) | 2 (2-3) | 2 (0-1) | X (1-1)
5065	7295	MKS Korona Kielce	Radomiak Radom	7	4	1	2	13	9	1.86	1.29	100.0	71.4	42.9	42.9	2025-08-08	1 (3-0) | 2 (1-3) | 2 (0-4) | 1 (4-0) | X (1-1)
3113	3123	Zagłębie Lubin	ŁKS Łódź	7	6	0	1	14	7	2.00	1.00	85.7	71.4	28.6	71.4	2024-05-20	1 (2-1) | 1 (2-0) | 1 (1-0) | 2 (2-3) | 1 (3-1)
3108	7922	Śląsk Wrocław	Warta Poznań	7	4	0	3	10	11	1.43	1.57	85.7	71.4	28.6	71.4	2024-04-06	1 (2-1) | 1 (1-0) | 2 (1-3) | 2 (0-2) | 2 (1-2)
3123	5065	ŁKS Łódź	MKS Korona Kielce	7	3	0	4	9	9	1.29	1.29	85.7	42.9	14.3	42.9	2024-02-12	2 (1-2) | 1 (2-1) | 2 (0-2) | 2 (0-1) | 1 (4-1)
7922	35268	Warta Poznań	Raków Częstochowa	7	1	2	4	5	12	0.71	1.71	85.7	42.9	14.3	42.9	2024-02-11	1 (2-1) | X (2-2) | X (1-1) | 2 (0-2) | 2 (0-3)
3110	7922	Górnik Zabrze	Warta Poznań	7	4	1	2	9	4	1.29	0.57	57.1	42.9	0.0	28.6	2023-12-15	1 (3-0) | 1 (2-0) | X (0-0) | 2 (1-2) | 1 (1-0)
3106	3123	Legia Warszawa	ŁKS Łódź	7	5	2	0	13	5	1.86	0.71	71.4	42.9	42.9	57.1	2023-12-10	X (1-1) | 1 (3-1) | 1 (3-2) | 1 (2-0) | 1 (3-1)
3117	7922	Pogoń Szczecin	Warta Poznań	7	3	4	0	13	9	1.86	1.29	100.0	57.1	28.6	100.0	2023-12-08	X (3-3) | 1 (3-1) | 1 (2-1) | X (1-1) | X (1-1)
3110	3125	Górnik Zabrze	Górnik Łęczna	7	4	2	1	11	6	1.57	0.86	71.4	42.9	14.3	57.1	2022-05-15	1 (4-2) | 1 (2-1) | X (0-0) | X (1-1) | 2 (1-2)
3125	36851	Górnik Łęczna	Bruk-Bet Termalica Nieciecza	7	2	3	2	10	7	1.43	1.00	100.0	42.9	0.0	71.4	2022-05-09	X (1-1) | X (1-1) | 1 (3-0) | 2 (1-2) | 1 (2-0)
3111	35268	Wisła Kraków	Raków Częstochowa	7	1	1	5	6	12	0.86	1.71	71.4	57.1	28.6	57.1	2022-02-06	2 (0-2) | 2 (1-2) | 2 (1-2) | X (0-0) | 2 (1-3)
3111	3123	Wisła Kraków	ŁKS Łódź	7	6	1	0	19	6	2.71	0.86	85.7	85.7	57.1	57.1	2020-07-03	1 (2-1) | 1 (4-2) | 1 (4-0) | 1 (3-2) | 1 (2-1)
3105	3125	Ruch Chorzów	Górnik Łęczna	7	4	1	2	13	8	1.86	1.14	85.7	85.7	28.6	42.9	2017-06-02	X (2-2) | 1 (4-0) | 1 (2-1) | 1 (3-0) | 1 (1-0)
3128	7919	GKS Bełchatów	Podbeskidzie Bielsko-Biała	7	2	2	3	11	8	1.57	1.14	85.7	42.9	14.3	57.1	2015-05-16	2 (0-2) | 2 (1-2) | X (1-1) | X (1-1) | 1 (2-1)
3115	7919	Widzew Łódź	Podbeskidzie Bielsko-Biała	7	0	3	4	4	10	0.57	1.43	57.1	42.9	14.3	42.9	2014-05-22	2 (0-3) | 2 (0-1) | X (1-1) | 2 (1-2) | X (2-2)
5064	36851	MZKS Arka Gdynia	Bruk-Bet Termalica Nieciecza	6	1	1	4	7	10	1.17	1.67	100.0	50.0	33.3	50.0	2025-11-21	2 (0-2) | 2 (1-2) | 1 (4-0) | X (1-1) | 2 (1-3)
5065	38732	MKS Korona Kielce	Stal Mielec	6	4	0	2	8	7	1.33	1.17	66.7	50.0	16.7	50.0	2025-03-01	1 (1-0) | 1 (2-1) | 1 (1-0) | 1 (3-2) | 2 (1-2)
3123	7918	ŁKS Łódź	Piast Gliwice	6	0	1	5	5	13	0.83	2.17	66.7	66.7	33.3	50.0	2024-05-10	2 (0-4) | X (3-3) | 2 (1-2) | 2 (0-1) | 2 (0-1)
7295	7922	Radomiak Radom	Warta Poznań	6	3	1	2	9	9	1.50	1.50	66.7	66.7	50.0	66.7	2024-02-26	X (0-0) | 1 (3-2) | 1 (2-1) | 2 (2-3) | 2 (1-3)
3122	38732	Wisła Płock	Stal Mielec	6	1	4	1	8	6	1.33	1.00	83.3	50.0	16.7	66.7	2023-05-07	X (0-0) | X (1-1) | 1 (3-0) | 2 (1-2) | X (2-2)
7913	7922	KS Lechia Gdańsk	Warta Poznań	6	3	2	1	6	3	1.00	0.50	66.7	0.0	0.0	16.7	2023-03-19	2 (0-2) | X (0-0) | 1 (2-0) | 1 (2-0) | X (1-1)
3113	3125	Zagłębie Lubin	Górnik Łęczna	6	3	2	1	7	3	1.17	0.50	50.0	33.3	16.7	33.3	2021-12-19	2 (1-2) | 1 (3-1) | 1 (1-0) | X (0-0) | 1 (2-0)
3123	7913	ŁKS Łódź	KS Lechia Gdańsk	6	1	3	2	4	6	0.67	1.00	50.0	50.0	16.7	50.0	2019-11-23	2 (1-3) | X (0-0) | X (0-0) | X (0-0) | 1 (2-1)
3125	7919	Górnik Łęczna	Podbeskidzie Bielsko-Biała	6	1	1	4	6	7	1.00	1.17	50.0	33.3	16.7	33.3	2016-05-10	1 (5-1) | 2 (0-2) | 2 (1-2) | 2 (0-1) | X (0-0)
3105	35329	Ruch Chorzów	Zawisza Bydgoszcz	6	4	1	1	12	6	2.00	1.00	83.3	66.7	33.3	66.7	2015-06-05	1 (3-2) | 2 (1-2) | X (1-1) | 1 (3-1) | 1 (3-0)
3119	7918	Polonia Warszawa	Piast Gliwice	6	3	2	1	7	4	1.17	0.67	83.3	0.0	0.0	33.3	2013-05-30	X (1-1) | X (1-1) | 1 (2-0) | 2 (0-2) | 1 (2-0)
3115	3119	Widzew Łódź	Polonia Warszawa	6	4	1	1	8	6	1.33	1.00	50.0	50.0	33.3	50.0	2013-04-08	1 (3-2) | 2 (1-3) | 1 (2-1) | 1 (1-0) | 1 (1-0)
3115	3128	Widzew Łódź	GKS Bełchatów	6	2	3	1	3	2	0.50	0.33	16.7	0.0	0.0	16.7	2013-03-09	X (0-0) | 1 (1-0) | 1 (1-0) | X (0-0) | X (1-1)
3106	7692	Legia Warszawa	Polonia Bytom	6	4	0	2	9	3	1.50	0.50	33.3	33.3	33.3	16.7	2011-05-29	1 (4-0) | 1 (1-0) | 2 (0-1) | 1 (1-0) | 1 (3-1)
3121	7692	Lech Poznań	Polonia Bytom	6	4	2	0	11	3	1.83	0.50	83.3	50.0	0.0	50.0	2011-05-25	1 (2-1) | 1 (1-0) | 1 (3-0) | X (1-1) | 1 (3-0)
5064	7692	MZKS Arka Gdynia	Polonia Bytom	6	1	1	4	7	13	1.17	2.17	100.0	83.3	50.0	83.3	2011-05-21	1 (2-1) | 2 (0-2) | X (2-2) | 2 (1-3) | 2 (1-2)
4901	7692	Cracovia	Polonia Bytom	6	2	0	4	5	7	0.83	1.17	50.0	50.0	0.0	50.0	2011-05-10	1 (2-1) | 2 (0-1) | 1 (2-1) | 2 (1-2) | 2 (0-1)
3128	5064	GKS Bełchatów	MZKS Arka Gdynia	6	1	2	3	4	7	0.67	1.17	66.7	16.7	0.0	50.0	2011-05-08	X (1-1) | 2 (0-1) | 2 (1-2) | 1 (1-0) | X (1-1)
3108	7692	Śląsk Wrocław	Polonia Bytom	6	2	4	0	6	2	1.00	0.33	50.0	33.3	0.0	33.3	2011-05-07	X (0-0) | X (0-0) | X (0-0) | 1 (2-1) | 1 (3-0)
7691	7692	Jagiellonia Białystok	Polonia Bytom	6	1	3	2	8	7	1.33	1.17	66.7	50.0	33.3	50.0	2011-04-30	2 (2-3) | 1 (3-0) | X (0-0) | X (1-1) | 2 (0-1)
3119	5064	Polonia Warszawa	MZKS Arka Gdynia	6	3	3	0	7	1	1.17	0.17	33.3	33.3	16.7	16.7	2011-04-23	1 (4-0) | X (0-0) | 1 (2-1) | X (0-0) | X (0-0)
3119	7692	Polonia Warszawa	Polonia Bytom	6	4	1	1	10	3	1.67	0.50	50.0	33.3	33.3	16.7	2011-04-16	1 (2-0) | X (2-2) | 2 (0-1) | 1 (1-0) | 1 (1-0)
3105	7692	Ruch Chorzów	Polonia Bytom	6	4	0	2	8	5	1.33	0.83	66.7	50.0	0.0	33.3	2011-04-09	2 (0-2) | 2 (0-1) | 1 (2-1) | 1 (1-0) | 1 (3-0)
3111	7692	Wisła Kraków	Polonia Bytom	6	3	3	0	10	6	1.67	1.00	83.3	50.0	33.3	83.3	2011-03-20	X (2-2) | 1 (2-1) | 1 (3-1) | X (1-1) | X (1-1)
7692	7913	Polonia Bytom	KS Lechia Gdańsk	6	2	3	1	7	5	1.17	0.83	66.7	16.7	16.7	50.0	2011-03-06	2 (0-2) | X (1-1) | X (0-0) | X (1-1) | 1 (1-0)
3128	7692	GKS Bełchatów	Polonia Bytom	6	3	2	1	10	6	1.67	1.00	83.3	50.0	33.3	66.7	2011-02-26	X (1-1) | 1 (2-0) | X (2-2) | 2 (0-1) | 1 (3-1)
3122	7295	Wisła Płock	Radomiak Radom	5	1	3	1	4	5	0.80	1.00	80.0	0.0	0.0	60.0	2025-10-27	X (1-1) | X (1-1) | 2 (0-2) | X (1-1) | 1 (1-0)
3115	38732	Widzew Łódź	Stal Mielec	5	3	1	1	6	3	1.20	0.60	60.0	40.0	0.0	20.0	2024-12-07	1 (2-1) | X (0-0) | 1 (1-0) | 2 (0-2) | 1 (3-0)
3123	35268	ŁKS Łódź	Raków Częstochowa	5	2	2	1	7	5	1.40	1.00	80.0	20.0	20.0	60.0	2024-03-17	X (1-1) | 2 (0-1) | 1 (3-2) | X (1-1) | 1 (2-0)
3105	3123	Ruch Chorzów	ŁKS Łódź	5	3	2	0	10	3	2.00	0.60	80.0	40.0	40.0	40.0	2023-12-17	X (1-1) | X (2-2) | 1 (4-0) | 1 (2-0) | 1 (1-0)
3110	35330	Górnik Zabrze	Miedź Legnica	5	2	1	2	5	7	1.00	1.40	60.0	60.0	40.0	40.0	2023-05-27	X (0-0) | 2 (0-3) | 1 (1-0) | 2 (1-3) | 1 (3-1)
3108	35330	Śląsk Wrocław	Miedź Legnica	5	3	1	1	11	3	2.20	0.60	60.0	40.0	40.0	20.0	2023-05-21	1 (4-2) | 2 (0-1) | 1 (2-0) | X (0-0) | 1 (5-0)
5065	35330	MKS Korona Kielce	Miedź Legnica	5	1	4	0	4	3	0.80	0.60	40.0	20.0	20.0	40.0	2023-04-01	1 (1-0) | X (2-2) | X (0-0) | X (0-0) | X (1-1)
3122	7922	Wisła Płock	Warta Poznań	5	2	0	3	4	9	0.80	1.80	80.0	60.0	20.0	40.0	2023-03-08	1 (1-0) | 2 (0-3) | 1 (2-1) | 2 (0-2) | 2 (1-3)
3122	35330	Wisła Płock	Miedź Legnica	5	1	1	3	10	10	2.00	2.00	100.0	100.0	60.0	100.0	2023-02-19	2 (1-2) | 1 (4-1) | 2 (2-3) | 2 (1-2) | X (2-2)
3122	3125	Wisła Płock	Górnik Łęczna	5	3	0	2	12	10	2.40	2.00	100.0	100.0	80.0	100.0	2022-03-06	1 (3-1) | 2 (2-3) | 1 (3-2) | 1 (3-2) | 2 (1-2)
3123	5064	ŁKS Łódź	MZKS Arka Gdynia	5	1	1	3	7	12	1.40	2.40	100.0	80.0	60.0	60.0	2020-07-11	2 (2-3) | X (1-1) | 2 (1-4) | 1 (3-0) | 2 (0-4)
7918	35329	Piast Gliwice	Zawisza Bydgoszcz	5	1	2	2	4	9	0.80	1.80	80.0	40.0	20.0	20.0	2015-06-02	X (0-0) | 2 (0-2) | 1 (3-0) | 2 (0-6) | X (1-1)
4901	35329	Cracovia	Zawisza Bydgoszcz	5	3	0	2	7	5	1.40	1.00	80.0	40.0	20.0	20.0	2015-05-19	1 (3-1) | 1 (3-0) | 1 (1-0) | 2 (0-2) | 2 (0-2)
5065	35329	MKS Korona Kielce	Zawisza Bydgoszcz	5	1	2	2	5	8	1.00	1.60	80.0	40.0	40.0	60.0	2015-05-15	2 (1-3) | X (2-2) | 2 (0-2) | X (1-1) | 1 (1-0)
7919	35329	Podbeskidzie Bielsko-Biała	Zawisza Bydgoszcz	5	2	3	0	8	6	1.60	1.20	80.0	80.0	40.0	80.0	2015-05-10	X (2-2) | 1 (2-1) | 1 (2-1) | X (0-0) | X (2-2)
3110	35329	Górnik Zabrze	Zawisza Bydgoszcz	5	4	0	1	9	7	1.80	1.40	80.0	80.0	40.0	80.0	2015-04-29	1 (2-1) | 1 (2-1) | 1 (1-0) | 2 (1-3) | 1 (3-2)
3106	35329	Legia Warszawa	Zawisza Bydgoszcz	5	4	0	1	10	4	2.00	0.80	100.0	60.0	20.0	40.0	2015-04-19	1 (2-0) | 1 (2-1) | 1 (2-0) | 1 (3-0) | 2 (1-3)
3117	35329	Pogoń Szczecin	Zawisza Bydgoszcz	5	1	2	2	7	6	1.40	1.20	100.0	60.0	0.0	80.0	2015-04-07	2 (1-2) | 1 (3-0) | 2 (1-2) | X (1-1) | X (1-1)
3121	35329	Lech Poznań	Zawisza Bydgoszcz	5	3	1	1	13	8	2.60	1.60	80.0	80.0	60.0	80.0	2015-03-14	2 (0-1) | 1 (6-2) | 1 (2-1) | X (2-2) | 1 (3-2)
3111	35329	Wisła Kraków	Zawisza Bydgoszcz	5	2	0	3	7	8	1.40	1.60	60.0	60.0	40.0	60.0	2015-03-07	2 (0-1) | 1 (4-2) | 1 (2-1) | 2 (0-1) | 2 (1-3)
7913	35329	KS Lechia Gdańsk	Zawisza Bydgoszcz	5	2	3	0	6	1	1.20	0.20	60.0	20.0	0.0	20.0	2015-02-21	X (0-0) | 1 (2-0) | X (0-0) | 1 (3-0) | X (1-1)
3112	35268	GKS Katowice	Raków Częstochowa	4	1	0	3	2	4	0.50	1.00	25.0	25.0	0.0	25.0	2025-12-07	2 (0-1) | 2 (0-1) | 1 (2-1) | 2 (0-1)
5064	35268	MZKS Arka Gdynia	Raków Częstochowa	4	1	0	3	6	11	1.50	2.75	100.0	75.0	75.0	75.0	2025-11-30	2 (1-4) | 2 (2-3) | 1 (3-2) | 2 (0-2)
3108	38729	Śląsk Wrocław	Puszcza Niepołomice	4	1	2	1	4	3	1.00	0.75	50.0	25.0	25.0	50.0	2025-05-24	X (1-1) | 2 (0-1) | X (0-0) | 1 (3-1)
38729	38732	Puszcza Niepołomice	Stal Mielec	4	1	0	3	4	7	1.00	1.75	75.0	50.0	25.0	50.0	2025-05-12	2 (2-3) | 2 (0-2) | 2 (1-2) | 1 (1-0)
3121	38729	Lech Poznań	Puszcza Niepołomice	4	2	0	2	13	6	3.25	1.50	100.0	75.0	50.0	75.0	2025-05-03	1 (8-1) | 2 (0-2) | 2 (1-2) | 1 (4-1)
3117	38729	Pogoń Szczecin	Puszcza Niepołomice	4	4	0	0	10	5	2.50	1.25	75.0	50.0	25.0	50.0	2025-04-25	1 (5-4) | 1 (2-1) | 1 (1-0) | 1 (2-0)
7295	38729	Radomiak Radom	Puszcza Niepołomice	4	1	3	0	6	4	1.50	1.00	100.0	25.0	25.0	75.0	2025-04-21	X (2-2) | 1 (2-0) | X (1-1) | X (1-1)
35268	38729	Raków Częstochowa	Puszcza Niepołomice	4	2	2	0	6	2	1.50	0.50	100.0	0.0	0.0	50.0	2025-04-07	X (1-1) | 1 (2-0) | X (1-1) | 1 (2-0)
4901	38729	Cracovia	Puszcza Niepołomice	4	2	1	1	6	4	1.50	1.00	75.0	50.0	25.0	75.0	2025-03-29	1 (3-1) | 1 (2-1) | 2 (0-1) | X (1-1)
7918	38729	Piast Gliwice	Puszcza Niepołomice	4	1	1	2	3	4	0.75	1.00	50.0	25.0	0.0	50.0	2025-03-16	2 (1-2) | X (1-1) | 2 (0-1) | 1 (1-0)
5065	38729	MKS Korona Kielce	Puszcza Niepołomice	4	2	2	0	8	5	2.00	1.25	75.0	50.0	25.0	75.0	2025-03-07	1 (2-1) | X (0-0) | X (1-1) | 1 (5-3)
3106	38729	Legia Warszawa	Puszcza Niepołomice	4	1	3	0	6	4	1.50	1.00	100.0	25.0	25.0	75.0	2025-02-15	1 (2-0) | X (2-2) | X (1-1) | X (1-1)
3113	38729	Zagłębie Lubin	Puszcza Niepołomice	4	3	1	0	6	3	1.50	0.75	50.0	50.0	25.0	50.0	2025-02-10	1 (2-1) | 1 (1-0) | X (2-2) | 1 (1-0)
3115	7922	Widzew Łódź	Warta Poznań	4	1	0	3	2	5	0.50	1.25	50.0	25.0	0.0	25.0	2024-05-05	2 (1-2) | 2 (0-1) | 2 (0-2) | 1 (1-0)
5065	7922	MKS Korona Kielce	Warta Poznań	4	0	1	3	2	8	0.50	2.00	50.0	25.0	25.0	50.0	2024-04-12	2 (0-1) | X (1-1) | 2 (1-5) | 2 (0-1)
3117	3123	Pogoń Szczecin	ŁKS Łódź	4	2	1	1	5	3	1.25	0.75	25.0	25.0	25.0	25.0	2024-02-23	1 (4-2) | 2 (0-1) | X (0-0) | 1 (1-0)
3115	3123	Widzew Łódź	ŁKS Łódź	4	2	1	1	4	2	1.00	0.50	50.0	0.0	0.0	25.0	2024-02-18	1 (2-0) | 1 (1-0) | X (1-1) | 2 (0-1)
3117	35330	Pogoń Szczecin	Miedź Legnica	4	3	0	1	9	5	2.25	1.25	75.0	50.0	50.0	50.0	2023-05-14	1 (3-2) | 1 (4-2) | 1 (2-0) | 2 (0-1)
4901	35330	Cracovia	Miedź Legnica	4	0	3	1	3	4	0.75	1.00	75.0	25.0	0.0	75.0	2023-05-01	X (1-1) | X (1-1) | 2 (1-2) | X (0-0)
3106	35330	Legia Warszawa	Miedź Legnica	4	3	1	0	11	5	2.75	1.25	100.0	75.0	75.0	75.0	2023-04-10	X (2-2) | 1 (3-2) | 1 (2-0) | 1 (4-1)
7918	35330	Piast Gliwice	Miedź Legnica	4	3	1	0	7	4	1.75	1.00	75.0	75.0	25.0	75.0	2023-03-19	1 (1-0) | 1 (2-1) | 1 (2-1) | X (2-2)
7913	35330	KS Lechia Gdańsk	Miedź Legnica	4	2	1	1	7	2	1.75	0.50	75.0	50.0	25.0	25.0	2023-03-10	1 (4-0) | 2 (1-2) | X (0-0) | 1 (2-0)
7691	35330	Jagiellonia Białystok	Miedź Legnica	4	2	1	1	8	5	2.00	1.25	100.0	75.0	25.0	75.0	2023-03-05	X (1-1) | 1 (2-1) | 1 (3-0) | 2 (2-3)
3113	35330	Zagłębie Lubin	Miedź Legnica	4	3	0	1	6	3	1.50	0.75	75.0	50.0	0.0	25.0	2023-02-27	1 (2-1) | 1 (1-0) | 1 (3-0) | 2 (0-2)
3121	35330	Lech Poznań	Miedź Legnica	4	2	1	1	7	6	1.75	1.50	75.0	75.0	50.0	75.0	2023-02-05	1 (1-0) | X (2-2) | 2 (2-3) | 1 (2-1)
3111	7922	Wisła Kraków	Warta Poznań	4	0	1	3	2	5	0.50	1.25	50.0	25.0	0.0	50.0	2022-05-21	2 (0-1) | X (1-1) | 2 (0-1) | 2 (1-2)
3111	38732	Wisła Kraków	Stal Mielec	4	2	0	2	10	4	2.50	1.00	75.0	75.0	50.0	50.0	2022-02-12	2 (0-1) | 2 (1-2) | 1 (3-1) | 1 (6-0)
3105	36851	Ruch Chorzów	Bruk-Bet Termalica Nieciecza	4	2	1	1	5	2	1.25	0.50	25.0	25.0	25.0	25.0	2017-03-04	X (0-0) | 2 (0-1) | 1 (1-0) | 1 (4-1)
3117	3128	Pogoń Szczecin	GKS Bełchatów	4	2	0	2	4	2	1.00	0.50	25.0	25.0	0.0	0.0	2015-03-20	1 (3-0) | 2 (0-1) | 2 (0-1) | 1 (1-0)
3108	35329	Śląsk Wrocław	Zawisza Bydgoszcz	4	2	0	2	4	4	1.00	1.00	50.0	50.0	0.0	50.0	2014-12-05	1 (1-0) | 1 (2-1) | 2 (0-1) | 2 (1-2)
7691	35329	Jagiellonia Białystok	Zawisza Bydgoszcz	4	2	2	0	5	2	1.25	0.50	50.0	25.0	25.0	50.0	2014-11-29	X (0-0) | 1 (3-1) | X (1-1) | 1 (1-0)
3119	7919	Polonia Warszawa	Podbeskidzie Bielsko-Biała	4	3	1	0	6	3	1.50	0.75	75.0	50.0	0.0	75.0	2013-05-10	1 (2-1) | 1 (1-0) | X (1-1) | 1 (2-1)
3123	3128	ŁKS Łódź	GKS Bełchatów	4	1	1	2	3	6	0.75	1.50	100.0	25.0	0.0	25.0	2012-05-03	X (1-1) | 2 (0-3) | 2 (0-2) | 1 (2-0)
3119	3123	Polonia Warszawa	ŁKS Łódź	4	3	0	1	7	4	1.75	1.00	100.0	50.0	25.0	50.0	2012-02-17	1 (2-0) | 1 (2-0) | 2 (1-3) | 1 (2-1)
3110	7692	Górnik Zabrze	Polonia Bytom	4	2	1	1	5	4	1.25	1.00	100.0	25.0	0.0	50.0	2011-05-13	1 (2-1) | X (1-1) | 1 (2-0) | 2 (0-2)
3113	7692	Zagłębie Lubin	Polonia Bytom	4	2	0	2	5	4	1.25	1.00	100.0	25.0	0.0	25.0	2011-04-02	1 (2-0) | 2 (0-2) | 2 (1-2) | 1 (2-0)
5065	7692	MKS Korona Kielce	Polonia Bytom	4	2	1	1	5	4	1.25	1.00	25.0	25.0	25.0	25.0	2011-03-12	X (3-3) | 1 (1-0) | 1 (1-0) | 2 (0-1)
3111	3114	Wisła Kraków	MKS Odra Wodzisław Śląski	4	3	1	0	9	3	2.25	0.75	100.0	50.0	50.0	75.0	2010-05-15	X (1-1) | 1 (3-1) | 1 (3-1) | 1 (2-0)
3108	3114	Śląsk Wrocław	MKS Odra Wodzisław Śląski	4	3	1	0	12	2	3.00	0.50	75.0	75.0	75.0	25.0	2010-05-11	1 (4-2) | 1 (4-0) | X (0-0) | 1 (4-0)
3114	5064	MKS Odra Wodzisław Śląski	MZKS Arka Gdynia	4	1	1	2	3	5	0.75	1.25	75.0	50.0	0.0	50.0	2010-05-01	1 (2-1) | 2 (0-2) | 2 (1-2) | X (0-0)
3114	4901	MKS Odra Wodzisław Śląski	Cracovia	4	2	1	1	3	2	0.75	0.50	25.0	25.0	0.0	25.0	2010-04-27	2 (0-1) | 1 (1-0) | 1 (2-1) | X (0-0)
3114	3119	MKS Odra Wodzisław Śląski	Polonia Warszawa	4	1	1	2	4	6	1.00	1.50	100.0	50.0	0.0	75.0	2010-04-24	1 (2-1) | 2 (1-2) | X (1-1) | 2 (0-2)
3105	3114	Ruch Chorzów	MKS Odra Wodzisław Śląski	4	2	0	2	6	7	1.50	1.75	75.0	75.0	50.0	50.0	2010-04-20	1 (3-2) | 1 (3-1) | 2 (0-1) | 2 (0-3)
3114	3128	MKS Odra Wodzisław Śląski	GKS Bełchatów	4	0	0	4	0	9	0.00	2.25	75.0	50.0	0.0	0.0	2010-04-01	2 (0-3) | 2 (0-1) | 2 (0-3) | 2 (0-2)
3114	3121	MKS Odra Wodzisław Śląski	Lech Poznań	4	0	1	3	1	5	0.25	1.25	25.0	25.0	25.0	25.0	2010-03-28	X (0-0) | 2 (0-1) | 2 (0-1) | 2 (1-3)
7692	7918	Polonia Bytom	Piast Gliwice	4	2	0	2	5	2	1.25	0.50	25.0	25.0	25.0	0.0	2010-03-21	2 (0-1) | 1 (4-0) | 1 (1-0) | 2 (0-1)
3114	7918	MKS Odra Wodzisław Śląski	Piast Gliwice	4	2	0	2	4	4	1.00	1.00	75.0	25.0	0.0	25.0	2010-03-12	1 (2-0) | 2 (1-2) | 2 (0-2) | 1 (1-0)
3106	3114	Legia Warszawa	MKS Odra Wodzisław Śląski	4	1	0	3	4	4	1.00	1.00	50.0	25.0	25.0	0.0	2010-03-07	2 (0-1) | 2 (0-1) | 1 (4-0) | 2 (0-2)
3114	7913	MKS Odra Wodzisław Śląski	KS Lechia Gdańsk	4	2	1	1	4	3	1.00	0.75	50.0	25.0	25.0	25.0	2010-02-26	X (0-0) | 1 (2-0) | 1 (1-0) | 2 (1-3)
3114	7692	MKS Odra Wodzisław Śląski	Polonia Bytom	4	1	2	1	6	4	1.50	1.00	75.0	25.0	25.0	75.0	2009-12-12	X (1-1) | 2 (0-1) | X (1-1) | 1 (4-1)
3114	7691	MKS Odra Wodzisław Śląski	Jagiellonia Białystok	4	1	2	1	6	6	1.50	1.50	100.0	75.0	25.0	100.0	2009-12-05	X (2-2) | 2 (1-2) | 1 (2-1) | X (1-1)
7691	7915	Jagiellonia Białystok	Motor Lublin	3	2	1	0	6	1	2.00	0.33	100.0	33.3	0.0	33.3	2025-12-14	X (1-1) | 1 (3-0) | 1 (2-0)
3106	7915	Legia Warszawa	Motor Lublin	3	1	2	0	9	6	3.00	2.00	100.0	66.7	66.7	100.0	2025-12-01	X (1-1) | X (3-3) | 1 (5-2)
3112	3117	GKS Katowice	Pogoń Szczecin	3	2	0	1	5	5	1.67	1.67	100.0	66.7	66.7	33.3	2025-11-29	1 (2-0) | 2 (0-4) | 1 (3-1)
4901	7915	Cracovia	Motor Lublin	3	2	0	1	8	4	2.67	1.33	66.7	66.7	33.3	66.7	2025-11-22	2 (1-2) | 1 (1-0) | 1 (6-2)
3112	7918	GKS Katowice	Piast Gliwice	3	0	2	1	3	5	1.00	1.67	66.7	66.7	66.7	66.7	2025-11-08	2 (1-3) | X (0-0) | X (2-2)
3121	7915	Lech Poznań	Motor Lublin	3	1	1	1	5	5	1.67	1.67	100.0	100.0	33.3	100.0	2025-11-02	X (2-2) | 1 (2-1) | 2 (1-2)
3112	5065	GKS Katowice	MKS Korona Kielce	3	1	0	2	3	4	1.00	1.33	66.7	66.7	0.0	66.7	2025-10-25	1 (1-0) | 2 (1-2) | 2 (1-2)
3115	7915	Widzew Łódź	Motor Lublin	3	1	0	2	5	8	1.67	2.67	100.0	100.0	33.3	66.7	2025-10-24	2 (0-3) | 2 (1-2) | 1 (4-3)
3112	7915	GKS Katowice	Motor Lublin	3	1	1	1	7	5	2.33	1.67	66.7	66.7	66.7	66.7	2025-10-17	1 (5-2) | 2 (2-3) | X (0-0)
3112	3121	GKS Katowice	Lech Poznań	3	0	1	2	2	5	0.67	1.67	66.7	33.3	33.3	33.3	2025-10-05	2 (0-1) | X (2-2) | 2 (0-2)
7295	7915	Radomiak Radom	Motor Lublin	3	0	1	2	4	6	1.33	2.00	66.7	66.7	66.7	66.7	2025-09-29	X (2-2) | 2 (2-3) | 2 (0-1)
3113	7915	Zagłębie Lubin	Motor Lublin	3	0	1	2	3	5	1.00	1.67	66.7	66.7	33.3	66.7	2025-09-21	X (2-2) | 2 (0-1) | 2 (1-2)
3112	4901	GKS Katowice	Cracovia	3	2	0	1	6	7	2.00	2.33	100.0	100.0	33.3	66.7	2025-09-19	2 (0-3) | 1 (2-1) | 1 (4-3)
3115	5064	Widzew Łódź	MZKS Arka Gdynia	3	1	2	0	3	1	1.00	0.33	66.7	0.0	0.0	33.3	2025-09-14	1 (2-0) | X (0-0) | X (1-1)
3112	7913	GKS Katowice	KS Lechia Gdańsk	3	2	0	1	5	4	1.67	1.33	100.0	33.3	33.3	33.3	2025-09-12	2 (0-2) | 1 (3-2) | 1 (2-0)
3110	7915	Górnik Zabrze	Motor Lublin	3	1	0	2	4	2	1.33	0.67	33.3	33.3	33.3	0.0	2025-08-30	2 (0-1) | 1 (4-0) | 2 (0-1)
5065	7915	MKS Korona Kielce	Motor Lublin	3	2	1	0	4	1	1.33	0.33	66.7	0.0	0.0	33.3	2025-08-23	1 (2-0) | 1 (1-0) | X (1-1)
3110	3112	Górnik Zabrze	GKS Katowice	3	2	0	1	7	2	2.33	0.67	100.0	100.0	0.0	33.3	2025-08-23	1 (3-0) | 2 (1-2) | 1 (3-0)
7295	36851	Radomiak Radom	Bruk-Bet Termalica Nieciecza	3	0	3	0	3	3	1.00	1.00	100.0	0.0	0.0	100.0	2025-08-22	X (1-1) | X (1-1) | X (1-1)
35268	36851	Raków Częstochowa	Bruk-Bet Termalica Nieciecza	3	3	0	0	9	4	3.00	1.33	100.0	100.0	66.7	66.7	2025-08-17	1 (3-2) | 1 (3-0) | 1 (3-2)
7915	7918	Motor Lublin	Piast Gliwice	3	1	1	1	4	6	1.33	2.00	66.7	66.7	66.7	66.7	2025-08-16	X (0-0) | 2 (1-4) | 1 (3-2)
3106	3112	Legia Warszawa	GKS Katowice	3	3	0	0	10	3	3.33	1.00	100.0	100.0	100.0	100.0	2025-08-10	1 (3-1) | 1 (3-1) | 1 (4-1)
3115	3122	Widzew Łódź	Wisła Płock	3	1	2	0	4	3	1.33	1.00	100.0	33.3	0.0	100.0	2025-08-09	X (1-1) | X (1-1) | 1 (2-1)
3112	3115	GKS Katowice	Widzew Łódź	3	0	1	2	2	6	0.67	2.00	66.7	66.7	33.3	33.3	2025-08-02	2 (0-3) | 2 (0-1) | X (2-2)
3112	3113	GKS Katowice	Zagłębie Lubin	3	1	1	1	3	3	1.00	1.00	33.3	33.3	33.3	33.3	2025-07-28	X (2-2) | 1 (1-0) | 2 (0-1)
3117	7915	Pogoń Szczecin	Motor Lublin	3	2	0	1	9	5	3.00	1.67	100.0	100.0	66.7	66.7	2025-07-26	1 (4-1) | 1 (3-0) | 2 (2-4)
3115	38729	Widzew Łódź	Puszcza Niepołomice	3	1	0	2	2	3	0.67	1.00	66.7	0.0	0.0	0.0	2025-05-19	1 (2-0) | 2 (0-2) | 2 (0-1)
3110	38729	Górnik Zabrze	Puszcza Niepołomice	3	0	2	1	3	4	1.00	1.33	100.0	33.3	0.0	100.0	2025-02-02	X (1-1) | X (1-1) | 2 (1-2)
3122	3123	Wisła Płock	ŁKS Łódź	3	2	1	0	4	1	1.33	0.33	66.7	33.3	0.0	33.3	2020-06-27	1 (2-0) | X (0-0) | 1 (2-1)
3122	7693	Wisła Płock	Zagłębie Sosnowiec	3	2	1	0	5	1	1.67	0.33	66.7	33.3	33.3	33.3	2019-05-18	X (0-0) | 1 (3-1) | 1 (2-0)
3111	35330	Wisła Kraków	Miedź Legnica	3	1	0	2	6	8	2.00	2.67	100.0	66.7	33.3	66.7	2019-05-18	2 (4-5) | 2 (0-2) | 1 (2-1)
5065	7693	MKS Korona Kielce	Zagłębie Sosnowiec	3	2	0	1	8	7	2.67	2.33	100.0	100.0	100.0	100.0	2019-05-14	1 (4-2) | 2 (1-4) | 1 (3-1)
5064	7693	MZKS Arka Gdynia	Zagłębie Sosnowiec	3	1	1	1	6	5	2.00	1.67	100.0	66.7	66.7	66.7	2019-05-10	1 (2-0) | 2 (2-3) | X (2-2)
3108	7693	Śląsk Wrocław	Zagłębie Sosnowiec	3	2	1	0	9	5	3.00	1.67	100.0	66.7	66.7	66.7	2019-05-05	1 (4-2) | 1 (2-0) | X (3-3)
3110	7693	Górnik Zabrze	Zagłębie Sosnowiec	3	2	1	0	7	2	2.33	0.67	100.0	66.7	33.3	66.7	2019-04-29	1 (4-0) | 1 (2-1) | X (1-1)
3111	7693	Wisła Kraków	Zagłębie Sosnowiec	3	0	1	2	6	8	2.00	2.67	100.0	100.0	66.7	100.0	2019-04-25	2 (1-2) | 2 (3-4) | X (2-2)
5064	35330	MZKS Arka Gdynia	Miedź Legnica	3	2	1	0	7	1	2.33	0.33	100.0	33.3	33.3	33.3	2019-04-25	1 (2-0) | X (1-1) | 1 (4-0)
7693	35330	Zagłębie Sosnowiec	Miedź Legnica	3	2	1	0	7	3	2.33	1.00	100.0	66.7	66.7	66.7	2019-04-22	X (2-2) | 1 (2-0) | 1 (3-1)
7913	36766	KS Lechia Gdańsk	Sandecja Nowy Sącz	3	0	2	1	5	6	1.67	2.00	100.0	66.7	66.7	100.0	2018-05-19	X (1-1) | X (2-2) | 2 (2-3)
4901	36766	Cracovia	Sandecja Nowy Sącz	3	2	1	0	4	2	1.33	0.67	66.7	33.3	0.0	66.7	2018-05-12	1 (1-0) | 1 (2-1) | X (1-1)
36766	36851	Sandecja Nowy Sącz	Bruk-Bet Termalica Nieciecza	3	1	1	1	2	2	0.67	0.67	33.3	0.0	0.0	33.3	2018-05-08	X (1-1) | 2 (0-1) | 1 (1-0)
7918	36766	Piast Gliwice	Sandecja Nowy Sącz	3	1	1	1	6	4	2.00	1.33	100.0	100.0	33.3	66.7	2018-05-05	2 (1-2) | 1 (3-0) | X (2-2)
3117	36766	Pogoń Szczecin	Sandecja Nowy Sącz	3	2	0	1	7	3	2.33	1.00	100.0	66.7	33.3	66.7	2018-04-28	1 (2-0) | 1 (4-1) | 2 (1-2)
5064	36766	MZKS Arka Gdynia	Sandecja Nowy Sącz	3	1	1	1	6	3	2.00	1.00	66.7	66.7	66.7	33.3	2018-04-22	2 (1-3) | 1 (5-0) | X (0-0)
3108	36766	Śląsk Wrocław	Sandecja Nowy Sącz	3	1	2	0	2	1	0.67	0.33	33.3	0.0	0.0	33.3	2018-04-15	1 (1-0) | X (0-0) | X (1-1)
3125	5064	Górnik Łęczna	MZKS Arka Gdynia	3	1	1	1	4	3	1.33	1.00	33.3	33.3	33.3	33.3	2017-05-12	2 (0-1) | 1 (4-2) | X (0-0)
3105	3122	Ruch Chorzów	Wisła Płock	3	0	2	1	6	7	2.00	2.33	100.0	66.7	66.7	100.0	2017-04-29	X (1-1) | 2 (3-4) | X (2-2)
7919	36851	Podbeskidzie Bielsko-Biała	Bruk-Bet Termalica Nieciecza	3	2	0	1	4	1	1.33	0.33	66.7	0.0	0.0	0.0	2016-04-17	2 (0-1) | 1 (2-0) | 1 (2-0)
3125	3128	Górnik Łęczna	GKS Bełchatów	3	1	2	0	3	2	1.00	0.67	66.7	0.0	0.0	66.7	2015-06-05	1 (1-0) | X (1-1) | X (1-1)
3128	35329	GKS Bełchatów	Zawisza Bydgoszcz	3	0	0	3	3	10	1.00	3.33	100.0	100.0	66.7	100.0	2015-05-30	2 (1-4) | 2 (1-4) | 2 (1-2)
3125	35329	Górnik Łęczna	Zawisza Bydgoszcz	3	1	2	0	6	3	2.00	1.00	66.7	33.3	33.3	66.7	2015-05-22	X (1-1) | X (0-0) | 1 (5-2)
5064	7915	MZKS Arka Gdynia	Motor Lublin	2	1	0	1	1	1	0.50	0.50	0.0	0.0	0.0	0.0	2025-12-06	1 (1-0) | 2 (0-1)
7915	35268	Motor Lublin	Raków Częstochowa	2	0	1	1	2	4	1.00	2.00	100.0	50.0	50.0	50.0	2025-10-05	2 (0-2) | X (2-2)
3112	7295	GKS Katowice	Radomiak Radom	2	1	1	0	4	3	2.00	1.50	100.0	50.0	50.0	100.0	2025-08-29	1 (3-2) | X (1-1)
7913	7915	KS Lechia Gdańsk	Motor Lublin	2	0	2	0	4	4	2.00	2.00	100.0	50.0	50.0	100.0	2025-08-11	X (3-3) | X (1-1)
3108	3112	Śląsk Wrocław	GKS Katowice	2	0	1	1	0	2	0.00	1.00	50.0	0.0	0.0	0.0	2025-04-19	2 (0-2) | X (0-0)
3112	38729	GKS Katowice	Puszcza Niepołomice	2	2	0	0	9	1	4.50	0.50	100.0	100.0	100.0	50.0	2025-04-12	1 (3-1) | 1 (6-0)
3108	7915	Śląsk Wrocław	Motor Lublin	2	0	1	1	2	3	1.00	1.50	100.0	50.0	0.0	100.0	2025-04-05	X (1-1) | 2 (1-2)
7915	38732	Motor Lublin	Stal Mielec	2	1	0	1	4	2	2.00	1.00	50.0	50.0	50.0	50.0	2025-03-30	1 (4-1) | 2 (0-1)
3112	7691	GKS Katowice	Jagiellonia Białystok	2	1	0	1	3	2	1.50	1.00	50.0	50.0	50.0	50.0	2025-03-02	2 (0-1) | 1 (3-1)
7915	38729	Motor Lublin	Puszcza Niepołomice	2	1	1	0	1	0	0.50	0.00	0.0	0.0	0.0	0.0	2025-03-02	1 (1-0) | X (0-0)
7913	38729	KS Lechia Gdańsk	Puszcza Niepołomice	2	0	0	2	1	6	0.50	3.00	100.0	50.0	50.0	50.0	2025-02-23	2 (0-2) | 2 (1-4)
3112	38732	GKS Katowice	Stal Mielec	2	2	0	0	2	0	1.00	0.00	0.0	0.0	0.0	0.0	2025-01-31	1 (1-0) | 1 (1-0)
7691	38729	Jagiellonia Białystok	Puszcza Niepołomice	2	0	2	0	4	4	2.00	2.00	100.0	50.0	50.0	100.0	2024-12-08	X (1-1) | X (3-3)
3123	38732	ŁKS Łódź	Stal Mielec	2	1	0	1	3	3	1.50	1.50	50.0	50.0	50.0	50.0	2024-05-25	1 (3-2) | 2 (0-1)
3105	7295	Ruch Chorzów	Radomiak Radom	2	1	1	0	2	0	1.00	0.00	50.0	0.0	0.0	0.0	2024-05-13	1 (2-0) | X (0-0)
7922	38729	Warta Poznań	Puszcza Niepołomice	2	0	0	2	0	3	0.00	1.50	50.0	0.0	0.0	0.0	2024-05-12	2 (0-1) | 2 (0-2)
3123	7295	ŁKS Łódź	Radomiak Radom	2	1	0	1	3	5	1.50	2.50	100.0	100.0	50.0	50.0	2024-04-14	1 (3-2) | 2 (0-3)
3105	38729	Ruch Chorzów	Puszcza Niepołomice	2	0	2	0	2	2	1.00	1.00	50.0	50.0	50.0	50.0	2024-04-06	X (0-0) | X (2-2)
3105	35268	Ruch Chorzów	Raków Częstochowa	2	0	1	1	4	6	2.00	3.00	100.0	50.0	50.0	100.0	2024-03-30	X (1-1) | 2 (3-5)
3123	7922	ŁKS Łódź	Warta Poznań	2	1	0	1	1	2	0.50	1.00	50.0	0.0	0.0	0.0	2024-03-11	1 (1-0) | 2 (0-2)
3105	38732	Ruch Chorzów	Stal Mielec	2	0	1	1	2	4	1.00	2.00	100.0	50.0	50.0	100.0	2024-03-10	2 (1-3) | X (1-1)
3123	38729	ŁKS Łódź	Puszcza Niepołomice	2	1	0	1	4	4	2.00	2.00	100.0	100.0	50.0	100.0	2024-03-03	1 (3-2) | 2 (1-2)
3105	7922	Ruch Chorzów	Warta Poznań	2	0	2	0	2	2	1.00	1.00	50.0	50.0	50.0	50.0	2024-02-17	X (0-0) | X (2-2)
3115	35330	Widzew Łódź	Miedź Legnica	2	2	0	0	2	0	1.00	0.00	0.0	0.0	0.0	0.0	2023-05-08	1 (1-0) | 1 (1-0)
35268	35330	Raków Częstochowa	Miedź Legnica	2	2	0	0	3	0	1.50	0.00	50.0	0.0	0.0	0.0	2023-04-22	1 (2-0) | 1 (1-0)
35330	38732	Miedź Legnica	Stal Mielec	2	0	1	1	1	3	0.50	1.50	100.0	0.0	0.0	50.0	2023-04-17	X (1-1) | 2 (0-2)
7922	35330	Warta Poznań	Miedź Legnica	2	1	1	0	3	2	1.50	1.00	100.0	50.0	0.0	100.0	2023-02-13	X (1-1) | 1 (2-1)
3111	7295	Wisła Kraków	Radomiak Radom	2	0	0	2	2	5	1.00	2.50	50.0	50.0	50.0	50.0	2022-05-15	2 (2-4) | 2 (0-1)
3125	35268	Górnik Łęczna	Raków Częstochowa	2	0	1	1	1	2	0.50	1.00	50.0	50.0	0.0	50.0	2022-04-24	2 (1-2) | X (0-0)
3125	7295	Górnik Łęczna	Radomiak Radom	2	1	0	1	2	3	1.00	1.50	50.0	50.0	50.0	50.0	2022-04-16	1 (1-0) | 2 (1-3)
7922	36851	Warta Poznań	Bruk-Bet Termalica Nieciecza	2	0	1	1	0	1	0.00	0.50	0.0	0.0	0.0	0.0	2022-03-05	2 (0-1) | X (0-0)
3125	38732	Górnik Łęczna	Stal Mielec	2	1	0	1	2	2	1.00	1.00	100.0	0.0	0.0	0.0	2022-02-26	1 (2-0) | 2 (0-2)
3125	7922	Górnik Łęczna	Warta Poznań	2	0	1	1	1	5	0.50	2.50	100.0	50.0	50.0	50.0	2022-02-06	X (1-1) | 2 (0-4)
3122	7919	Wisła Płock	Podbeskidzie Bielsko-Biała	2	1	1	0	5	2	2.50	1.00	100.0	50.0	50.0	100.0	2021-05-08	X (1-1) | 1 (4-1)
7919	7922	Podbeskidzie Bielsko-Biała	Warta Poznań	2	0	0	2	1	4	0.50	2.00	100.0	50.0	0.0	50.0	2021-03-21	2 (0-2) | 2 (1-2)
7919	38732	Podbeskidzie Bielsko-Biała	Stal Mielec	2	1	0	1	2	2	1.00	1.00	50.0	50.0	0.0	50.0	2021-03-15	2 (1-2) | 1 (1-0)
7919	35268	Podbeskidzie Bielsko-Biała	Raków Częstochowa	2	0	0	2	1	5	0.50	2.50	50.0	50.0	50.0	50.0	2021-02-26	2 (0-1) | 2 (1-4)
7691	7693	Jagiellonia Białystok	Zagłębie Sosnowiec	2	2	0	0	6	2	3.00	1.00	100.0	100.0	50.0	100.0	2019-04-06	1 (2-1) | 1 (4-1)
7693	7913	Zagłębie Sosnowiec	KS Lechia Gdańsk	2	0	0	2	1	5	0.50	2.50	50.0	50.0	50.0	50.0	2019-03-16	2 (0-1) | 2 (1-4)
4901	7693	Cracovia	Zagłębie Sosnowiec	2	1	1	0	3	2	1.50	1.00	100.0	50.0	0.0	100.0	2019-03-09	1 (2-1) | X (1-1)
3106	7693	Legia Warszawa	Zagłębie Sosnowiec	2	2	0	0	5	3	2.50	1.50	100.0	100.0	50.0	100.0	2018-12-20	1 (3-2) | 1 (2-1)
3121	7693	Lech Poznań	Zagłębie Sosnowiec	2	2	0	0	10	0	5.00	0.00	100.0	100.0	100.0	0.0	2018-12-16	1 (6-0) | 1 (4-0)
3117	7693	Pogoń Szczecin	Zagłębie Sosnowiec	2	1	0	1	1	3	0.50	1.50	50.0	50.0	0.0	0.0	2018-12-08	1 (1-0) | 2 (0-3)
3113	7693	Zagłębie Lubin	Zagłębie Sosnowiec	2	2	0	0	4	2	2.00	1.00	100.0	100.0	0.0	100.0	2018-12-02	1 (2-1) | 1 (2-1)
7693	7918	Zagłębie Sosnowiec	Piast Gliwice	2	0	1	1	1	2	0.50	1.00	50.0	50.0	0.0	50.0	2018-11-23	X (0-0) | 2 (1-2)
3111	36766	Wisła Kraków	Sandecja Nowy Sącz	2	1	1	0	3	0	1.50	0.00	50.0	50.0	0.0	0.0	2018-04-07	X (0-0) | 1 (3-0)
3110	36766	Górnik Zabrze	Sandecja Nowy Sącz	2	1	1	0	4	3	2.00	1.50	100.0	100.0	50.0	100.0	2018-03-31	X (2-2) | 1 (2-1)
3113	36766	Zagłębie Lubin	Sandecja Nowy Sącz	2	2	0	0	2	0	1.00	0.00	0.0	0.0	0.0	0.0	2018-02-27	1 (1-0) | 1 (1-0)
5065	36766	MKS Korona Kielce	Sandecja Nowy Sącz	2	1	1	0	4	3	2.00	1.50	50.0	50.0	50.0	50.0	2018-02-16	X (3-3) | 1 (1-0)
3122	36766	Wisła Płock	Sandecja Nowy Sącz	2	1	1	0	3	2	1.50	1.00	50.0	50.0	50.0	50.0	2017-12-13	X (2-2) | 1 (1-0)
7691	36766	Jagiellonia Białystok	Sandecja Nowy Sącz	2	1	0	1	2	3	1.00	1.50	50.0	50.0	50.0	50.0	2017-12-08	1 (1-0) | 2 (1-3)
3106	36766	Legia Warszawa	Sandecja Nowy Sącz	2	1	1	0	4	2	2.00	1.00	100.0	50.0	50.0	50.0	2017-12-02	X (2-2) | 1 (2-0)
3121	36766	Lech Poznań	Sandecja Nowy Sącz	2	0	2	0	0	0	0.00	0.00	0.0	0.0	0.0	0.0	2017-11-18	X (0-0) | X (0-0)
3113	35329	Zagłębie Lubin	Zawisza Bydgoszcz	2	1	0	1	3	3	1.50	1.50	100.0	50.0	50.0	50.0	2014-03-02	1 (3-1) | 2 (0-2)
3115	35329	Widzew Łódź	Zawisza Bydgoszcz	2	1	0	1	2	3	1.00	1.50	100.0	50.0	0.0	50.0	2013-11-23	2 (0-2) | 1 (2-1)
3117	3119	Pogoń Szczecin	Polonia Warszawa	2	1	0	1	3	3	1.50	1.50	100.0	50.0	50.0	50.0	2013-06-02	1 (3-1) | 2 (0-2)
3123	7919	ŁKS Łódź	Podbeskidzie Bielsko-Biała	2	2	0	0	3	1	1.50	0.50	50.0	50.0	0.0	50.0	2012-03-31	1 (1-0) | 1 (2-1)
3115	7692	Widzew Łódź	Polonia Bytom	2	1	1	0	5	3	2.50	1.50	100.0	100.0	100.0	100.0	2011-04-23	1 (3-1) | X (2-2)
3113	3114	Zagłębie Lubin	MKS Odra Wodzisław Śląski	2	2	0	0	4	2	2.00	1.00	100.0	100.0	0.0	100.0	2010-05-08	1 (2-1) | 1 (2-1)
3114	5065	MKS Odra Wodzisław Śląski	MKS Korona Kielce	2	0	1	1	1	3	0.50	1.50	100.0	0.0	0.0	50.0	2010-03-20	X (1-1) | 2 (0-2)
3123	7692	ŁKS Łódź	Polonia Bytom	2	2	0	0	5	2	2.50	1.00	100.0	50.0	50.0	50.0	2009-05-30	1 (2-0) | 1 (3-2)
3110	3114	Górnik Zabrze	MKS Odra Wodzisław Śląski	2	1	1	0	2	0	1.00	0.00	50.0	0.0	0.0	0.0	2009-05-16	1 (2-0) | X (0-0)
3114	3123	MKS Odra Wodzisław Śląski	ŁKS Łódź	2	0	1	1	0	1	0.00	0.50	0.0	0.0	0.0	0.0	2009-03-01	2 (0-1) | X (0-0)
3122	7915	Wisła Płock	Motor Lublin	1	0	1	0	1	1	1.00	1.00	100.0	0.0	0.0	100.0	2025-11-08	X (1-1)
3112	36851	GKS Katowice	Bruk-Bet Termalica Nieciecza	1	1	0	0	3	0	3.00	0.00	100.0	100.0	0.0	0.0	2025-10-31	1 (3-0)
3115	36851	Widzew Łódź	Bruk-Bet Termalica Nieciecza	1	1	0	0	4	2	4.00	2.00	100.0	100.0	100.0	100.0	2025-10-04	1 (4-2)
3112	3122	GKS Katowice	Wisła Płock	1	0	1	0	1	1	1.00	1.00	100.0	0.0	0.0	100.0	2025-09-26	X (1-1)
7915	36851	Motor Lublin	Bruk-Bet Termalica Nieciecza	1	0	1	0	1	1	1.00	1.00	100.0	0.0	0.0	100.0	2025-09-14	X (1-1)
3112	5064	GKS Katowice	MZKS Arka Gdynia	1	1	0	0	4	1	4.00	1.00	100.0	100.0	100.0	100.0	2025-08-16	1 (4-1)
5064	7295	MZKS Arka Gdynia	Radomiak Radom	1	0	1	0	1	1	1.00	1.00	100.0	0.0	0.0	100.0	2025-07-25	X (1-1)
7295	35330	Radomiak Radom	Miedź Legnica	1	0	1	0	0	0	0.00	0.00	0.0	0.0	0.0	0.0	2023-01-27	X (0-0)
36851	38732	Bruk-Bet Termalica Nieciecza	Stal Mielec	1	0	0	1	0	1	0.00	1.00	0.0	0.0	0.0	0.0	2021-12-10	2 (0-1)
\.


--
-- Data for Name: mart_league_averages; Type: TABLE DATA; Schema: gold; Owner: airflow
--

COPY gold.mart_league_averages (season_id, season_name, season_year, tournament_id, tournament_name, total_matches, teams_count, avg_goals_per_match, avg_home_goals, avg_away_goals, home_win_pct, away_win_pct, draw_pct, btts_pct, clean_sheet_pct, avg_goals_per_game_per_team, avg_xg_per_game, avg_xg_difference, avg_xg_diff_per_game, avg_big_chances_created_per_game, avg_big_chances_missed_per_game, avg_big_chances_scored_per_game, avg_shots_per_game, avg_shots_on_target_per_game, avg_shots_off_target_per_game, avg_blocked_shots_per_game, avg_shots_inside_box_per_game, avg_shots_outside_box_per_game, avg_corners_per_game, avg_dribbles_success_pct, avg_touches_in_box_per_game, avg_goals_conceded_per_game, avg_xga_per_game, avg_xga_difference, avg_xga_difference_per_game, avg_clean_sheet_pct, avg_saves_per_game, avg_tackles_per_game, avg_tackles_won_pct, avg_interceptions_per_game, avg_clearances_per_game, avg_blocked_shots_per_game_def, avg_ball_recoveries_per_game, avg_aerial_duels_pct, avg_ground_duels_pct, avg_duels_won_pct, avg_possession_pct, avg_pass_accuracy_pct, avg_accurate_passes_per_game, avg_total_passes_per_game, avg_accurate_long_balls_per_game, avg_accurate_crosses_per_game, avg_final_third_entries_per_game, avg_touches_in_box_per_game_poss, avg_dispossessed_per_game, avg_throw_ins_per_game, avg_goal_kicks_per_game, avg_yellow_cards_per_game, avg_fouls_per_game, avg_offsides_per_game, avg_free_kicks_per_game, total_goals_in_season, total_xg_in_season, total_shots_in_season, total_shots_on_target_in_season, total_hit_woodwork_in_season, total_big_chances_created, total_big_chances_missed, total_big_chances_scored, total_corners_in_season, total_xga_in_season, total_saves_in_season, total_tackles_in_season, total_interceptions_in_season, total_errors_lead_to_goal_in_season, total_errors_lead_to_shot_in_season, total_accurate_passes_in_season, total_passes_in_season, total_accurate_long_balls_in_season, total_accurate_crosses_in_season, total_final_third_entries_in_season, total_yellow_cards_in_season, total_red_cards_in_season, total_fouls_in_season, total_offsides_in_season, total_free_kicks_in_season) FROM stdin;
76477	Ekstraklasa 25/26	25/26	64	Ekstraklasa	160	18	2.88	1.69	1.18	46.9	25.0	28.1	59.4	40.6	1.44	1.37	1.24	0.07	2.02	1.19	0.83	13.12	4.20	5.05	3.87	8.36	4.76	4.68	6.5	22.56	1.44	1.37	1.24	0.07	23.8	2.79	13.41	8.6	7.41	26.94	3.87	42.25	15.5	32.1	50.0	50.1	80.7	306.6	378.7	20.98	4.48	48.73	22.56	6.77	16.81	7.17	2.03	11.98	1.43	11.84	460	437.62	4196	1344	107	648	383	265	1494	437.62	892	4294	2373	48	129	97891	120946	6711	1433	15576	650	19	3836	455	3787
61236	Ekstraklasa 24/25	24/25	64	Ekstraklasa	295	18	2.77	1.55	1.22	45.1	30.2	24.7	56.3	43.7	1.38	1.51	-4.22	-0.13	2.05	1.24	0.81	13.88	4.41	5.46	4.01	8.85	5.03	5.05	7.1	24.10	1.39	1.52	-4.22	-0.13	24.9	3.01	14.73	9.0	8.83	24.89	4.01	47.61	15.5	32.8	50.0	50.0	79.8	326.3	406.5	23.19	4.74	51.84	24.10	7.57	18.56	7.93	2.02	12.01	1.52	11.76	817	892.89	8190	2601	204	1209	730	479	2982	892.89	1773	8689	5207	81	161	192522	239886	13671	2801	30586	1190	51	7086	896	6940
52176	Ekstraklasa 23/24	23/24	64	Ekstraklasa	290	18	2.69	1.53	1.16	42.8	26.2	31.0	54.1	45.9	1.35	1.42	-2.54	-0.08	1.82	1.06	0.77	12.97	4.14	5.10	3.72	7.91	5.05	4.92	7.1	2.04	1.35	1.43	-2.54	-0.08	27.1	2.77	14.03	8.9	9.07	19.85	3.72	52.98	15.8	33.1	50.0	50.0	78.7	326.6	412.1	26.41	4.52	55.35	2.04	7.18	20.28	8.00	2.22	12.80	1.47	12.25	780	825.64	7525	2403	172	1059	614	445	2854	825.64	1607	8136	5258	6	12	189456	239003	15320	2624	32117	1290	69	7428	850	7107
42004	Ekstraklasa 22/23	22/23	64	Ekstraklasa	294	18	2.49	1.38	1.11	42.2	31.3	26.5	49.3	50.7	1.24	1.36	-3.87	-0.12	1.75	1.06	0.70	13.01	4.14	5.41	3.46	7.88	5.13	4.88	7.8	0.00	1.24	1.36	-3.87	-0.12	29.1	2.88	14.64	8.9	10.68	18.65	3.46	1.94	14.7	34.5	50.0	50.0	77.8	323.4	413.4	26.98	4.46	55.80	0.00	7.72	21.04	8.17	2.22	12.71	1.70	12.13	731	800.65	7652	2436	205	1032	621	411	2870	800.65	1694	8610	6279	0	0	190367	243271	15876	2620	32824	1308	47	7474	1000	7136
37062	Ekstraklasa 21/22	21/22	64	Ekstraklasa	294	18	2.68	1.50	1.17	44.6	28.6	26.9	54.1	45.9	1.34	0.00	43.72	1.34	1.82	1.07	0.75	13.20	4.27	5.43	3.50	8.10	5.10	5.26	7.5	0.00	1.34	0.00	43.72	1.34	26.0	2.93	15.18	9.1	11.60	19.13	3.50	0.00	16.2	35.7	50.0	50.0	76.6	314.0	409.0	26.88	4.53	55.95	0.00	8.06	21.50	8.23	2.20	13.82	1.74	13.28	787	0	7760	2509	201	1071	629	442	3097	0	1724	8928	6821	0	0	184633	240458	15800	2668	32899	1296	51	8128	1022	7811
29222	Ekstraklasa 20/21	20/21	64	Ekstraklasa	240	16	2.45	1.30	1.15	40.8	31.7	27.5	48.3	51.7	1.23	0.00	36.81	1.23	0.00	0.00	0.00	8.41	4.11	4.30	0.00	0.00	0.00	5.19	0.0	0.00	1.23	0.00	36.81	1.23	30.8	2.96	0.00	0.0	0.00	0.00	0.00	0.00	0.0	0.0	0.0	50.0	0.0	0.0	0.0	0.00	0.00	0.00	0.00	0.00	21.64	8.23	2.01	13.84	1.52	15.36	589	0	4039	1973	0	0	0	0	2491	0	1422	0	0	0	0	0	0	0	0	0	964	34	6642	731	7374
23666	Ekstraklasa 19/20	19/20	64	Ekstraklasa	296	16	2.59	1.52	1.07	48.0	28.7	23.3	52.0	48.0	1.30	0.00	47.94	1.30	0.00	0.00	0.00	9.61	4.63	4.98	0.00	0.00	0.00	5.22	0.0	0.00	1.30	0.00	47.94	1.30	27.7	3.41	0.00	0.0	0.00	0.00	0.00	0.00	0.0	0.0	0.0	50.0	0.0	0.0	0.0	0.00	0.00	0.00	0.00	0.00	21.62	8.80	2.06	15.14	1.47	16.61	767	0	5689	2742	0	0	0	0	3088	0	2016	0	0	0	0	0	0	0	0	0	1218	55	8963	870	9836
17361	Ekstraklasa 18/19	18/19	64	Ekstraklasa	296	16	2.78	1.50	1.28	44.9	30.7	24.3	52.7	47.3	1.39	0.00	51.44	1.39	0.00	0.00	0.00	9.18	4.36	4.82	0.00	0.00	0.00	5.01	0.0	0.00	1.39	0.00	51.44	1.39	26.8	2.88	0.00	0.0	0.00	0.00	0.00	0.00	0.0	0.0	0.0	49.9	0.0	0.0	0.0	0.00	0.00	0.00	0.00	0.00	22.48	8.81	2.07	14.82	1.76	16.59	823	0	5433	2581	0	0	0	0	2967	0	1703	0	0	0	0	0	0	0	0	0	1225	52	8777	1044	9821
13350	Ekstraklasa 17/18	17/18	64	Ekstraklasa	295	16	2.64	1.48	1.15	44.1	27.5	28.5	51.9	48.1	1.32	0.00	48.63	1.32	0.00	0.00	0.00	8.64	4.15	4.49	0.00	0.00	0.00	4.95	0.0	0.00	1.32	0.00	48.63	1.32	28.6	2.84	0.00	0.0	0.00	0.00	0.00	0.00	0.0	0.0	0.0	50.0	0.0	0.0	0.0	0.00	0.00	0.00	0.00	0.00	24.86	9.07	2.12	15.01	1.68	16.69	778	0	5099	2449	0	0	0	0	2922	0	1676	0	0	0	0	0	0	0	0	0	1251	54	8854	992	9847
11734	Ekstraklasa 16/17	16/17	64	Ekstraklasa	296	16	2.74	1.58	1.17	44.9	29.7	25.3	52.7	47.3	1.37	0.00	50.75	1.37	0.00	0.00	0.00	9.45	4.49	4.97	0.00	0.00	0.00	5.10	0.0	0.00	1.37	0.00	50.75	1.37	28.4	3.12	0.00	0.0	0.00	0.00	0.00	0.00	0.0	0.0	0.0	50.0	0.0	0.0	0.0	0.00	0.00	0.00	0.00	0.00	24.52	9.37	1.94	14.32	1.33	15.65	812	0	5597	2658	0	0	0	0	3018	0	1847	0	0	0	0	0	0	0	0	0	1146	50	8475	788	9264
10361	Ekstraklasa 15/16	15/16	64	Ekstraklasa	283	16	2.64	1.47	1.17	40.6	29.0	30.4	53.7	46.3	1.32	0.00	46.63	1.32	0.00	0.00	0.00	9.68	4.80	4.89	0.00	0.00	0.00	5.13	0.0	0.00	1.32	0.00	46.63	1.32	27.9	3.25	0.00	0.0	0.00	0.00	0.00	0.00	0.0	0.0	0.0	50.0	0.0	0.0	0.0	0.00	0.00	0.00	0.00	0.00	24.85	9.22	1.97	13.78	1.62	15.42	746	0	5477	2713	0	0	0	0	2903	0	1839	0	0	0	0	0	0	0	0	0	1113	46	7803	919	8722
8206	Ekstraklasa 14/15	14/15	64	Ekstraklasa	296	16	2.67	1.49	1.18	45.9	27.0	27.0	53.7	46.3	1.33	0.00	49.38	1.33	0.00	0.00	0.00	9.47	4.52	4.95	0.00	0.00	0.00	4.85	0.0	0.00	1.33	0.00	49.38	1.33	26.5	3.07	0.00	0.0	0.00	0.00	0.00	0.00	0.0	0.0	0.0	50.0	0.0	0.0	0.0	0.00	0.00	0.00	0.00	0.00	25.34	9.49	1.83	13.89	1.56	15.44	790	0	5606	2678	0	0	0	0	2869	0	1817	0	0	0	0	0	0	0	0	0	1086	60	8221	922	9143
6261	Ekstraklasa 13/14	13/14	64	Ekstraklasa	295	16	2.65	1.55	1.11	45.1	24.4	30.5	52.9	47.1	1.33	0.00	48.94	1.33	0.00	0.00	0.00	6.87	3.29	3.59	0.00	0.00	0.00	3.63	0.0	0.00	1.33	0.00	48.94	1.33	28.3	2.33	0.00	0.0	0.00	0.00	0.00	0.00	0.0	0.0	0.0	49.9	0.0	0.0	0.0	0.00	0.00	0.00	0.00	0.00	16.94	6.53	1.36	9.92	1.16	10.92	783	0	4052	1936	0	0	0	0	2141	0	1373	0	0	0	0	0	0	0	0	0	803	62	5850	687	6439
4634	Ekstraklasa 12/13	12/13	64	Ekstraklasa	240	16	2.49	1.34	1.15	40.4	33.3	26.3	50.8	49.2	1.25	0.00	37.38	1.25	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.0	0.00	1.25	0.00	37.38	1.25	28.1	0.00	0.00	0.0	0.00	0.00	0.00	0.00	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	598	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
3411	Ekstraklasa 11/12	11/12	64	Ekstraklasa	240	16	2.20	1.24	0.95	44.6	28.3	27.1	41.7	58.3	1.10	0.00	32.94	1.10	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.0	0.00	1.10	0.00	32.94	1.10	34.8	0.00	0.00	0.0	0.00	0.00	0.00	0.00	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	527	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2737	Ekstraklasa 10/11	10/11	64	Ekstraklasa	240	16	2.41	1.50	0.90	51.7	23.3	25.0	42.1	57.9	1.20	0.00	36.13	1.20	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.0	0.00	1.21	0.00	36.13	1.21	34.2	0.00	0.00	0.0	0.00	0.00	0.00	0.00	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	578	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2275	Ekstraklasa 09/10	09/10	64	Ekstraklasa	240	16	2.22	1.25	0.97	45.0	27.9	27.1	43.3	56.7	1.11	0.00	33.25	1.11	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.0	0.00	1.11	0.00	33.25	1.11	33.3	0.00	0.00	0.0	0.00	0.00	0.00	0.00	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	532	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
1691	Ekstraklasa 08/09	08/09	64	Ekstraklasa	241	16	2.18	1.34	0.85	49.4	25.7	24.5	36.5	63.1	1.09	0.00	32.75	1.09	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.0	0.00	1.09	0.00	32.75	1.09	36.9	0.00	0.00	0.0	0.00	0.00	0.00	0.00	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	524	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
\.


--
-- Data for Name: mart_match_predictions; Type: TABLE DATA; Schema: gold; Owner: airflow
--

COPY gold.mart_match_predictions (match_id, match_date, season_id, season_name, season_year, home_team_id, home_team_name, away_team_id, away_team_name, tournament_name, home_avg_goals_scored_home, home_avg_goals_conceded_home, home_avg_xg_home, home_avg_shots_on_target_home, home_avg_possession_home, home_win_rate_home, home_points_last_5, home_wins_last_5, home_goals_for_last_5, home_goals_against_last_5, away_avg_goals_scored_away, away_avg_goals_conceded_away, away_avg_xg_away, away_avg_shots_on_target_away, away_avg_possession_away, away_win_rate_away, away_points_last_5, away_wins_last_5, away_goals_for_last_5, away_goals_against_last_5, predicted_home_goals, predicted_away_goals, predicted_total_xg, match_outlook, home_win_probability, draw_probability, away_win_probability, home_win_fair_odds, draw_fair_odds, away_win_fair_odds, actual_home_score, actual_away_score, actual_result, prediction_correct, home_goals_error, away_goals_error, created_at) FROM stdin;
15028170	2025-12-14	76477	Ekstraklasa 25/26	25/26	7915	Motor Lublin	7691	Jagiellonia Białystok	Ekstraklasa	1.3333333333333333	1.2222222222222222	1.8244444444444444	3.2222222222222222	51.8888888888888889	0.22222222222222222222	1	1	5	5	1.1000000000000000	1.00000000000000000000	1.1760000000000000	5.0000000000000000	57.7000000000000000	0.50000000000000000000	8	1	5	6	1.29	1.18	1.50	BALANCED	26.3	34.5	39.2	3.80	2.90	2.55	1	1	DRAW	f	0.29	0.18	2025-12-16 09:06:11.953014+00
14079318	2025-12-14	76477	Ekstraklasa 25/26	25/26	3106	Legia Warszawa	7918	Piast Gliwice	Ekstraklasa	1.2222222222222222	0.77777777777777777778	1.3433333333333333	4.7777777777777778	50.3333333333333333	0.33333333333333333333	5	0	4	8	1.2222222222222222	1.2222222222222222	0.84222222222222222222	3.0000000000000000	51.8888888888888889	0.22222222222222222222	7	4	9	4	1.25	0.90	1.09	BALANCED	33.7	40.8	25.6	2.97	2.45	3.91	0	1	AWAY_WIN	f	1.25	0.10	2025-12-16 09:06:11.953014+00
15028166	2025-12-14	76477	Ekstraklasa 25/26	25/26	35268	Raków Częstochowa	3113	Zagłębie Lubin	Ekstraklasa	1.1111111111111111	1.2222222222222222	0.99111111111111111111	3.4444444444444444	48.1111111111111111	0.33333333333333333333	7	3	10	6	1.00000000000000000000	1.6666666666666667	1.2844444444444444	4.2222222222222222	43.3333333333333333	0.33333333333333333333	7	3	6	6	1.36	1.18	1.14	BALANCED	26.2	44.0	29.8	3.82	2.27	3.36	0	1	AWAY_WIN	f	1.36	0.18	2025-12-16 09:06:11.953014+00
13981901	2025-12-08	76477	Ekstraklasa 25/26	25/26	5065	MKS Korona Kielce	3122	Wisła Płock	Ekstraklasa	1.3333333333333333	1.00000000000000000000	1.6866666666666667	4.3333333333333333	46.3333333333333333	0.44444444444444444444	6	1	5	7	1.00000000000000000000	1.00000000000000000000	0.87125000000000000000	2.5000000000000000	37.0000000000000000	0.75000000000000000000	9	0	3	3	1.26	0.97	1.28	BALANCED	34.6	30.2	35.2	2.89	3.31	2.84	1	1	DRAW	f	0.26	0.03	2025-12-16 09:06:11.953014+00
13981905	2025-12-07	76477	Ekstraklasa 25/26	25/26	4901	Cracovia	3121	Lech Poznań	Ekstraklasa	1.4444444444444444	0.88888888888888888889	1.2377777777777778	3.3333333333333333	48.6666666666666667	0.44444444444444444444	5	1	4	7	1.5000000000000000	1.2500000000000000	1.8537500000000000	5.2500000000000000	51.6250000000000000	0.50000000000000000000	9	1	9	8	1.30	1.28	1.55	AWAY_FAVORITE	26.4	31.7	42.0	3.79	3.16	2.38	2	2	DRAW	f	0.70	0.72	2025-12-16 09:06:11.953014+00
13981902	2025-12-07	76477	Ekstraklasa 25/26	25/26	36851	Bruk-Bet Termalica Nieciecza	7691	Jagiellonia Białystok	Ekstraklasa	1.2222222222222222	2.0000000000000000	1.03888888888888888889	3.6666666666666667	43.2222222222222222	0.22222222222222222222	8	3	7	10	1.1000000000000000	1.00000000000000000000	1.1760000000000000	5.0000000000000000	57.7000000000000000	0.50000000000000000000	8	1	5	6	1.07	1.57	1.11	BALANCED	21.8	46.0	32.1	4.58	2.17	3.11	2	1	HOME_WIN	f	0.93	0.57	2025-12-16 09:06:11.953014+00
13981899	2025-12-07	76477	Ekstraklasa 25/26	25/26	35268	Raków Częstochowa	3112	GKS Katowice	Ekstraklasa	1.1111111111111111	1.2222222222222222	0.99111111111111111111	3.4444444444444444	48.1111111111111111	0.33333333333333333333	7	3	10	6	1.2500000000000000	1.8750000000000000	1.1587500000000000	3.6250000000000000	49.3750000000000000	0.12500000000000000000	8	3	7	4	1.46	1.21	1.07	BALANCED	28.0	47.4	24.7	3.58	2.11	4.06	1	0	HOME_WIN	f	0.46	1.21	2025-12-16 09:06:11.953014+00
13981900	2025-12-06	76477	Ekstraklasa 25/26	25/26	5064	MZKS Arka Gdynia	7915	Motor Lublin	Ekstraklasa	1.4444444444444444	1.00000000000000000000	0.94111111111111111111	3.8888888888888889	43.1111111111111111	0.66666666666666666667	7	2	6	12	1.2222222222222222	1.8888888888888889	1.04666666666666666667	3.2222222222222222	46.2222222222222222	0.33333333333333333333	1	1	5	5	1.54	1.07	0.99	HOME_FAVORITE	40.2	34.8	25.0	2.49	2.87	4.00	1	0	HOME_WIN	t	0.54	1.07	2025-12-16 09:06:11.953014+00
13981903	2025-12-06	76477	Ekstraklasa 25/26	25/26	7918	Piast Gliwice	3106	Legia Warszawa	Ekstraklasa	1.00000000000000000000	1.00000000000000000000	0.98250000000000000000	3.1250000000000000	56.5000000000000000	0.25000000000000000000	7	4	9	4	0.88888888888888888889	1.5555555555555556	1.4866666666666667	3.7777777777777778	55.8888888888888889	0.33333333333333333333	5	0	4	8	1.27	1.09	1.23	BALANCED	27.7	39.6	32.7	3.61	2.52	3.06	2	0	HOME_WIN	f	0.73	1.09	2025-12-16 09:06:11.953014+00
13981906	2025-12-06	76477	Ekstraklasa 25/26	25/26	3113	Zagłębie Lubin	3115	Widzew Łódź	Ekstraklasa	2.4444444444444444	1.00000000000000000000	1.7133333333333333	4.7777777777777778	38.2222222222222222	0.55555555555555555556	7	3	6	6	1.4444444444444444	2.0000000000000000	1.4888888888888889	5.1111111111111111	47.4444444444444444	0.00000000000000000000	2	1	6	8	2.04	1.23	1.60	HOME_FAVORITE	43.3	37.0	19.7	2.31	2.70	5.08	2	1	HOME_WIN	t	0.04	0.23	2025-12-16 09:06:11.953014+00
13981904	2025-12-06	76477	Ekstraklasa 25/26	25/26	3117	Pogoń Szczecin	7295	Radomiak Radom	Ekstraklasa	2.3333333333333333	1.6666666666666667	2.5100000000000000	6.0000000000000000	48.6666666666666667	0.55555555555555555556	4	1	8	9	1.4444444444444444	2.5555555555555556	0.98444444444444444444	4.0000000000000000	45.7777777777777778	0.33333333333333333333	10	3	12	7	2.49	1.44	1.75	BALANCED	42.4	28.7	29.0	2.36	3.49	3.45	2	2	DRAW	f	0.49	0.56	2025-12-16 09:06:11.953014+00
13981897	2025-12-05	76477	Ekstraklasa 25/26	25/26	7913	KS Lechia Gdańsk	3110	Górnik Zabrze	Ekstraklasa	2.5555555555555556	1.5555555555555556	1.4844444444444444	5.4444444444444444	48.6666666666666667	0.55555555555555555556	13	3	15	8	1.1111111111111111	1.6666666666666667	0.74333333333333333333	3.3333333333333333	48.5555555555555556	0.22222222222222222222	3	1	8	13	1.84	1.24	1.11	HOME_FAVORITE	52.5	26.7	20.8	1.90	3.75	4.80	5	2	HOME_WIN	t	3.16	0.76	2025-12-16 09:06:11.953014+00
15161024	2025-12-04	76477	Ekstraklasa 25/26	25/26	3122	Wisła Płock	4901	Cracovia	Ekstraklasa	1.3000000000000000	0.40000000000000000000	1.3680000000000000	4.6000000000000000	43.6000000000000000	0.60000000000000000000	9	0	3	3	1.3333333333333333	1.4444444444444444	1.2166666666666667	3.4444444444444444	44.7777777777777778	0.22222222222222222222	5	1	4	7	1.39	0.84	1.29	HOME_FAVORITE	42.2	35.1	22.7	2.37	2.85	4.40	0	0	DRAW	f	1.39	0.84	2025-12-16 09:06:11.953014+00
13981890	2025-12-01	76477	Ekstraklasa 25/26	25/26	7915	Motor Lublin	3106	Legia Warszawa	Ekstraklasa	1.3333333333333333	1.2222222222222222	1.8244444444444444	3.2222222222222222	51.8888888888888889	0.22222222222222222222	1	1	5	5	0.88888888888888888889	1.5555555555555556	1.4866666666666667	3.7777777777777778	55.8888888888888889	0.33333333333333333333	5	0	4	8	1.57	1.20	1.66	BALANCED	26.8	41.1	32.1	3.73	2.43	3.11	1	1	DRAW	t	0.57	0.20	2025-12-16 09:06:11.953014+00
13981891	2025-11-30	76477	Ekstraklasa 25/26	25/26	3122	Wisła Płock	3121	Lech Poznań	Ekstraklasa	1.3000000000000000	0.40000000000000000000	1.3680000000000000	4.6000000000000000	43.6000000000000000	0.60000000000000000000	9	0	3	3	1.5000000000000000	1.2500000000000000	1.8537500000000000	5.2500000000000000	51.6250000000000000	0.50000000000000000000	9	1	9	8	1.29	1.04	1.61	BALANCED	31.5	35.1	33.4	3.18	2.85	2.99	0	0	DRAW	t	1.29	1.04	2025-12-16 09:06:11.953014+00
13981888	2025-11-30	76477	Ekstraklasa 25/26	25/26	5064	MZKS Arka Gdynia	35268	Raków Częstochowa	Ekstraklasa	1.4444444444444444	1.00000000000000000000	0.94111111111111111111	3.8888888888888889	43.1111111111111111	0.66666666666666666667	7	2	6	12	1.7777777777777778	1.3333333333333333	1.7466666666666667	5.0000000000000000	54.4444444444444444	0.00000000000000000000	7	3	10	6	1.26	1.38	1.34	BALANCED	32.9	42.6	24.5	3.04	2.35	4.07	1	4	AWAY_WIN	f	0.26	2.62	2025-12-16 09:06:11.953014+00
13981892	2025-11-30	76477	Ekstraklasa 25/26	25/26	3113	Zagłębie Lubin	7691	Jagiellonia Białystok	Ekstraklasa	2.4444444444444444	1.00000000000000000000	1.7133333333333333	4.7777777777777778	38.2222222222222222	0.55555555555555555556	7	3	6	6	1.1000000000000000	1.00000000000000000000	1.1760000000000000	5.0000000000000000	57.7000000000000000	0.50000000000000000000	8	1	5	6	1.54	1.07	1.44	BALANCED	34.3	35.2	30.6	2.92	2.84	3.27	0	0	DRAW	t	1.54	1.07	2025-12-16 09:06:11.953014+00
13981893	2025-11-29	76477	Ekstraklasa 25/26	25/26	7913	KS Lechia Gdańsk	36851	Bruk-Bet Termalica Nieciecza	Ekstraklasa	2.5555555555555556	1.5555555555555556	1.4844444444444444	5.4444444444444444	48.6666666666666667	0.55555555555555555556	13	3	15	8	1.4444444444444444	1.8888888888888889	1.7644444444444444	4.3333333333333333	42.8888888888888889	0.22222222222222222222	8	3	7	10	1.95	1.58	1.62	BALANCED	40.3	34.3	25.4	2.48	2.91	3.94	5	1	HOME_WIN	t	3.05	0.58	2025-12-16 09:06:11.953014+00
13981894	2025-11-29	76477	Ekstraklasa 25/26	25/26	5065	MKS Korona Kielce	4901	Cracovia	Ekstraklasa	1.3333333333333333	1.00000000000000000000	1.6866666666666667	4.3333333333333333	46.3333333333333333	0.44444444444444444444	6	1	5	7	1.3333333333333333	1.4444444444444444	1.2166666666666667	3.4444444444444444	44.7777777777777778	0.22222222222222222222	5	1	4	7	1.48	1.14	1.45	BALANCED	36.0	41.8	22.2	2.78	2.39	4.51	0	1	AWAY_WIN	f	1.48	0.14	2025-12-16 09:06:11.953014+00
13981896	2025-11-29	76477	Ekstraklasa 25/26	25/26	3112	GKS Katowice	3117	Pogoń Szczecin	Ekstraklasa	1.4444444444444444	1.4444444444444444	1.8133333333333333	5.3333333333333333	45.6666666666666667	0.44444444444444444444	8	3	7	4	0.77777777777777777778	1.8888888888888889	1.3588888888888889	4.3333333333333333	55.1111111111111111	0.22222222222222222222	4	1	8	9	1.76	1.26	1.59	BALANCED	36.0	40.6	23.4	2.78	2.46	4.28	2	0	HOME_WIN	f	0.24	1.26	2025-12-16 09:06:11.953014+00
13981898	2025-11-28	76477	Ekstraklasa 25/26	25/26	7295	Radomiak Radom	3110	Górnik Zabrze	Ekstraklasa	2.4444444444444444	0.77777777777777777778	1.5722222222222222	5.6666666666666667	47.3333333333333333	0.66666666666666666667	10	3	12	7	1.1111111111111111	1.6666666666666667	0.74333333333333333333	3.3333333333333333	48.5555555555555556	0.22222222222222222222	3	1	8	13	1.84	0.85	1.16	HOME_FAVORITE	51.3	28.5	20.2	1.95	3.50	4.96	4	0	HOME_WIN	t	2.16	0.85	2025-12-16 09:06:11.953014+00
13981895	2025-11-28	76477	Ekstraklasa 25/26	25/26	7918	Piast Gliwice	3115	Widzew Łódź	Ekstraklasa	1.00000000000000000000	1.00000000000000000000	0.98250000000000000000	3.1250000000000000	56.5000000000000000	0.25000000000000000000	7	4	9	4	1.4444444444444444	2.0000000000000000	1.4888888888888889	5.1111111111111111	47.4444444444444444	0.00000000000000000000	2	1	6	8	1.50	1.23	1.24	BALANCED	31.5	43.2	25.3	3.17	2.31	3.95	0	2	AWAY_WIN	f	1.50	0.77	2025-12-16 09:06:11.953014+00
13981882	2025-11-24	76477	Ekstraklasa 25/26	25/26	3117	Pogoń Szczecin	3113	Zagłębie Lubin	Ekstraklasa	2.3333333333333333	1.6666666666666667	2.5100000000000000	6.0000000000000000	48.6666666666666667	0.55555555555555555556	4	1	8	9	1.00000000000000000000	1.6666666666666667	1.2844444444444444	4.2222222222222222	43.3333333333333333	0.33333333333333333333	7	3	6	6	2.04	1.40	1.90	BALANCED	38.0	36.2	25.8	2.63	2.76	3.88	5	1	HOME_WIN	t	2.96	0.40	2025-12-16 09:06:11.953014+00
13981885	2025-11-23	76477	Ekstraklasa 25/26	25/26	3121	Lech Poznań	7295	Radomiak Radom	Ekstraklasa	1.8888888888888889	1.7777777777777778	1.6566666666666667	5.2222222222222222	54.4444444444444444	0.33333333333333333333	9	1	9	8	1.4444444444444444	2.5555555555555556	0.98444444444444444444	4.0000000000000000	45.7777777777777778	0.33333333333333333333	10	3	12	7	2.16	1.50	1.32	BALANCED	36.4	35.9	27.8	2.75	2.79	3.60	4	1	HOME_WIN	t	1.84	0.50	2025-12-16 09:06:11.953014+00
13981886	2025-11-23	76477	Ekstraklasa 25/26	25/26	3115	Widzew Łódź	5065	MKS Korona Kielce	Ekstraklasa	1.4444444444444444	1.1111111111111111	1.4022222222222222	4.0000000000000000	43.1111111111111111	0.44444444444444444444	2	1	6	8	1.00000000000000000000	1.1111111111111111	1.3144444444444444	3.1111111111111111	41.3333333333333333	0.44444444444444444444	6	1	5	7	1.27	1.13	1.36	BALANCED	27.9	39.7	32.5	3.59	2.52	3.08	1	3	AWAY_WIN	f	0.27	1.87	2025-12-16 09:06:11.953014+00
13981889	2025-11-22	76477	Ekstraklasa 25/26	25/26	35268	Raków Częstochowa	7918	Piast Gliwice	Ekstraklasa	1.1111111111111111	1.2222222222222222	0.99111111111111111111	3.4444444444444444	48.1111111111111111	0.33333333333333333333	7	3	10	6	1.2222222222222222	1.2222222222222222	0.84222222222222222222	3.0000000000000000	51.8888888888888889	0.22222222222222222222	7	4	9	4	1.14	1.13	0.92	BALANCED	29.1	46.9	24.1	3.44	2.13	4.15	1	3	AWAY_WIN	f	0.14	1.87	2025-12-16 09:06:11.953014+00
13981880	2025-11-22	76477	Ekstraklasa 25/26	25/26	3106	Legia Warszawa	7913	KS Lechia Gdańsk	Ekstraklasa	1.2222222222222222	0.77777777777777777778	1.3433333333333333	4.7777777777777778	50.3333333333333333	0.33333333333333333333	5	0	4	8	1.5555555555555556	2.5555555555555556	0.90555555555555555556	3.7777777777777778	43.3333333333333333	0.22222222222222222222	13	3	15	8	1.92	1.00	1.12	BALANCED	35.2	31.1	33.7	2.84	3.21	2.97	2	2	DRAW	f	0.08	1.00	2025-12-16 09:06:11.953014+00
13981883	2025-11-22	76477	Ekstraklasa 25/26	25/26	4901	Cracovia	7915	Motor Lublin	Ekstraklasa	1.4444444444444444	0.88888888888888888889	1.2377777777777778	3.3333333333333333	48.6666666666666667	0.44444444444444444444	5	1	4	7	1.2222222222222222	1.8888888888888889	1.04666666666666666667	3.2222222222222222	46.2222222222222222	0.33333333333333333333	1	1	5	5	1.62	1.01	1.14	BALANCED	33.8	40.9	25.4	2.96	2.45	3.94	1	2	AWAY_WIN	f	0.62	0.99	2025-12-16 09:06:11.953014+00
13981881	2025-11-21	76477	Ekstraklasa 25/26	25/26	3110	Górnik Zabrze	3122	Wisła Płock	Ekstraklasa	2.1111111111111111	1.00000000000000000000	1.8188888888888889	5.5555555555555556	45.2222222222222222	0.66666666666666666667	3	1	8	13	1.00000000000000000000	1.00000000000000000000	0.87125000000000000000	2.5000000000000000	37.0000000000000000	0.75000000000000000000	9	0	3	3	1.48	0.97	1.35	BALANCED	39.1	24.6	36.2	2.56	4.06	2.76	1	1	DRAW	f	0.48	0.03	2025-12-16 09:06:11.953014+00
13981878	2025-11-21	76477	Ekstraklasa 25/26	25/26	36851	Bruk-Bet Termalica Nieciecza	5064	MZKS Arka Gdynia	Ekstraklasa	1.2222222222222222	2.0000000000000000	1.03888888888888888889	3.6666666666666667	43.2222222222222222	0.22222222222222222222	8	3	7	10	0.22222222222222222222	2.5555555555555556	0.79111111111111111111	1.7777777777777778	42.7777777777777778	0.11111111111111111111	7	2	6	12	1.84	1.25	0.92	BALANCED	31.8	47.0	21.1	3.14	2.13	4.73	2	0	HOME_WIN	f	0.16	1.25	2025-12-16 09:06:11.953014+00
13981877	2025-11-09	76477	Ekstraklasa 25/26	25/26	5065	MKS Korona Kielce	35268	Raków Częstochowa	Ekstraklasa	1.3333333333333333	1.00000000000000000000	1.6866666666666667	4.3333333333333333	46.3333333333333333	0.44444444444444444444	6	1	5	7	1.7777777777777778	1.3333333333333333	1.7466666666666667	5.0000000000000000	54.4444444444444444	0.00000000000000000000	7	3	10	6	1.42	1.38	1.72	BALANCED	28.9	51.2	19.9	3.46	1.95	5.04	1	4	AWAY_WIN	f	0.42	2.62	2025-12-16 09:06:11.953014+00
13981873	2025-11-09	76477	Ekstraklasa 25/26	25/26	5064	MZKS Arka Gdynia	3121	Lech Poznań	Ekstraklasa	1.4444444444444444	1.00000000000000000000	0.94111111111111111111	3.8888888888888889	43.1111111111111111	0.66666666666666666667	7	2	6	12	1.5000000000000000	1.2500000000000000	1.8537500000000000	5.2500000000000000	51.6250000000000000	0.50000000000000000000	9	1	9	8	1.22	1.34	1.40	BALANCED	30.6	30.3	39.1	3.26	3.30	2.56	3	1	HOME_WIN	f	1.78	0.34	2025-12-16 09:06:11.953014+00
13981868	2025-11-09	76477	Ekstraklasa 25/26	25/26	3106	Legia Warszawa	36851	Bruk-Bet Termalica Nieciecza	Ekstraklasa	1.2222222222222222	0.77777777777777777778	1.3433333333333333	4.7777777777777778	50.3333333333333333	0.33333333333333333333	5	0	4	8	1.4444444444444444	1.8888888888888889	1.7644444444444444	4.3333333333333333	42.8888888888888889	0.22222222222222222222	8	3	7	10	1.59	1.19	1.55	BALANCED	27.8	42.5	29.8	3.60	2.35	3.36	1	2	AWAY_WIN	f	0.59	0.81	2025-12-16 09:06:11.953014+00
13981876	2025-11-09	76477	Ekstraklasa 25/26	25/26	3117	Pogoń Szczecin	7691	Jagiellonia Białystok	Ekstraklasa	2.3333333333333333	1.6666666666666667	2.5100000000000000	6.0000000000000000	48.6666666666666667	0.55555555555555555556	4	1	8	9	1.1000000000000000	1.00000000000000000000	1.1760000000000000	5.0000000000000000	57.7000000000000000	0.50000000000000000000	8	1	5	6	1.71	1.40	1.84	BALANCED	35.7	34.7	29.7	2.80	2.89	3.37	1	2	AWAY_WIN	f	0.71	0.60	2025-12-16 09:06:11.953014+00
13981879	2025-11-08	76477	Ekstraklasa 25/26	25/26	3112	GKS Katowice	7918	Piast Gliwice	Ekstraklasa	1.4444444444444444	1.4444444444444444	1.8133333333333333	5.3333333333333333	45.6666666666666667	0.44444444444444444444	8	3	7	4	1.2222222222222222	1.2222222222222222	0.84222222222222222222	3.0000000000000000	51.8888888888888889	0.22222222222222222222	7	4	9	4	1.43	1.24	1.33	HOME_FAVORITE	37.4	41.8	20.8	2.67	2.39	4.81	1	3	AWAY_WIN	f	0.43	1.76	2025-12-16 09:06:11.953014+00
13981870	2025-11-08	76477	Ekstraklasa 25/26	25/26	7913	KS Lechia Gdańsk	3115	Widzew Łódź	Ekstraklasa	2.5555555555555556	1.5555555555555556	1.4844444444444444	5.4444444444444444	48.6666666666666667	0.55555555555555555556	13	3	15	8	1.4444444444444444	2.0000000000000000	1.4888888888888889	5.1111111111111111	47.4444444444444444	0.00000000000000000000	2	1	6	8	2.01	1.51	1.49	HOME_FAVORITE	49.5	31.6	19.0	2.02	3.17	5.28	2	1	HOME_WIN	t	0.01	0.51	2025-12-16 09:06:11.953014+00
13981871	2025-11-08	76477	Ekstraklasa 25/26	25/26	7915	Motor Lublin	3122	Wisła Płock	Ekstraklasa	1.3333333333333333	1.2222222222222222	1.8244444444444444	3.2222222222222222	51.8888888888888889	0.22222222222222222222	1	1	5	5	1.00000000000000000000	1.00000000000000000000	0.87125000000000000000	2.5000000000000000	37.0000000000000000	0.75000000000000000000	9	0	3	3	1.29	1.08	1.35	AWAY_FAVORITE	30.8	22.2	46.9	3.24	4.49	2.13	1	1	DRAW	f	0.29	0.08	2025-12-16 09:06:11.953014+00
13981875	2025-11-07	76477	Ekstraklasa 25/26	25/26	7295	Radomiak Radom	4901	Cracovia	Ekstraklasa	2.4444444444444444	0.77777777777777777778	1.5722222222222222	5.6666666666666667	47.3333333333333333	0.66666666666666666667	10	3	12	7	1.3333333333333333	1.4444444444444444	1.2166666666666667	3.4444444444444444	44.7777777777777778	0.22222222222222222222	5	1	4	7	1.73	1.03	1.39	HOME_FAVORITE	45.7	32.9	21.4	2.19	3.04	4.68	3	0	HOME_WIN	t	1.27	1.03	2025-12-16 09:06:11.953014+00
13981874	2025-11-07	76477	Ekstraklasa 25/26	25/26	3113	Zagłębie Lubin	3110	Górnik Zabrze	Ekstraklasa	2.4444444444444444	1.00000000000000000000	1.7133333333333333	4.7777777777777778	38.2222222222222222	0.55555555555555555556	7	3	6	6	1.1111111111111111	1.6666666666666667	0.74333333333333333333	3.3333333333333333	48.5555555555555556	0.22222222222222222222	3	1	8	13	1.87	0.96	1.23	HOME_FAVORITE	45.7	32.7	21.6	2.19	3.06	4.63	2	0	HOME_WIN	t	0.13	0.96	2025-12-16 09:06:11.953014+00
13981862	2025-11-03	76477	Ekstraklasa 25/26	25/26	7913	KS Lechia Gdańsk	7295	Radomiak Radom	Ekstraklasa	2.5555555555555556	1.5555555555555556	1.4844444444444444	5.4444444444444444	48.6666666666666667	0.55555555555555555556	13	3	15	8	1.4444444444444444	2.5555555555555556	0.98444444444444444444	4.0000000000000000	45.7777777777777778	0.33333333333333333333	10	3	12	7	2.29	1.39	1.23	HOME_FAVORITE	42.8	30.6	26.6	2.33	3.27	3.76	1	2	AWAY_WIN	f	1.29	0.61	2025-12-16 09:06:11.953014+00
13981861	2025-11-03	76477	Ekstraklasa 25/26	25/26	3122	Wisła Płock	3117	Pogoń Szczecin	Ekstraklasa	1.3000000000000000	0.40000000000000000000	1.3680000000000000	4.6000000000000000	43.6000000000000000	0.60000000000000000000	9	0	3	3	0.77777777777777777778	1.8888888888888889	1.3588888888888889	4.3333333333333333	55.1111111111111111	0.22222222222222222222	4	1	8	9	1.61	0.73	1.36	HOME_FAVORITE	41.5	33.4	25.1	2.41	2.99	3.99	2	0	HOME_WIN	t	0.39	0.73	2025-12-16 09:06:11.953014+00
13981865	2025-11-03	76477	Ekstraklasa 25/26	25/26	4901	Cracovia	3113	Zagłębie Lubin	Ekstraklasa	1.4444444444444444	0.88888888888888888889	1.2377777777777778	3.3333333333333333	48.6666666666666667	0.44444444444444444444	5	1	4	7	1.00000000000000000000	1.6666666666666667	1.2844444444444444	4.2222222222222222	43.3333333333333333	0.33333333333333333333	7	3	6	6	1.50	1.02	1.26	BALANCED	29.3	39.8	30.9	3.42	2.51	3.24	0	0	DRAW	t	1.50	1.02	2025-12-16 09:06:11.953014+00
13981867	2025-11-02	76477	Ekstraklasa 25/26	25/26	7691	Jagiellonia Białystok	35268	Raków Częstochowa	Ekstraklasa	2.5714285714285714	1.5714285714285714	1.8814285714285714	6.0000000000000000	61.4285714285714286	0.71428571428571428571	8	1	5	6	1.7777777777777778	1.3333333333333333	1.7466666666666667	5.0000000000000000	54.4444444444444444	0.00000000000000000000	7	3	10	6	1.78	1.67	1.81	HOME_FAVORITE	35.7	46.9	17.4	2.80	2.13	5.75	1	2	AWAY_WIN	f	0.78	0.33	2025-12-16 09:06:11.953014+00
13981869	2025-11-02	76477	Ekstraklasa 25/26	25/26	3115	Widzew Łódź	3106	Legia Warszawa	Ekstraklasa	1.4444444444444444	1.1111111111111111	1.4022222222222222	4.0000000000000000	43.1111111111111111	0.44444444444444444444	2	1	6	8	0.88888888888888888889	1.5555555555555556	1.4866666666666667	3.7777777777777778	55.8888888888888889	0.33333333333333333333	5	0	4	8	1.49	1.15	1.44	BALANCED	27.4	43.4	29.2	3.65	2.30	3.42	1	1	DRAW	t	0.49	0.15	2025-12-16 09:06:11.953014+00
13981866	2025-11-02	76477	Ekstraklasa 25/26	25/26	3121	Lech Poznań	7915	Motor Lublin	Ekstraklasa	1.8888888888888889	1.7777777777777778	1.6566666666666667	5.2222222222222222	54.4444444444444444	0.33333333333333333333	9	1	9	8	1.2222222222222222	1.8888888888888889	1.04666666666666666667	3.2222222222222222	46.2222222222222222	0.33333333333333333333	1	1	5	5	1.83	1.46	1.35	HOME_FAVORITE	45.1	30.3	24.6	2.22	3.30	4.06	2	2	DRAW	f	0.17	0.54	2025-12-16 09:06:11.953014+00
13981863	2025-11-02	76477	Ekstraklasa 25/26	25/26	3110	Górnik Zabrze	5064	MZKS Arka Gdynia	Ekstraklasa	2.1111111111111111	1.00000000000000000000	1.8188888888888889	5.5555555555555556	45.2222222222222222	0.66666666666666666667	3	1	8	13	0.22222222222222222222	2.5555555555555556	0.79111111111111111111	1.7777777777777778	42.7777777777777778	0.11111111111111111111	7	2	6	12	2.26	0.75	1.31	HOME_FAVORITE	49.1	31.9	19.0	2.04	3.13	5.27	5	1	HOME_WIN	t	2.74	0.25	2025-12-16 09:06:11.953014+00
13981872	2025-10-31	76477	Ekstraklasa 25/26	25/26	7918	Piast Gliwice	5065	MKS Korona Kielce	Ekstraklasa	1.00000000000000000000	1.00000000000000000000	0.98250000000000000000	3.1250000000000000	56.5000000000000000	0.25000000000000000000	7	4	9	4	1.00000000000000000000	1.1111111111111111	1.3144444444444444	3.1111111111111111	41.3333333333333333	0.44444444444444444444	6	1	5	7	1.05	1.08	1.15	BALANCED	25.2	42.6	32.2	3.96	2.35	3.11	0	0	DRAW	t	1.05	1.08	2025-12-16 09:06:11.953014+00
13981864	2025-10-31	76477	Ekstraklasa 25/26	25/26	36851	Bruk-Bet Termalica Nieciecza	3112	GKS Katowice	Ekstraklasa	1.2222222222222222	2.0000000000000000	1.03888888888888888889	3.6666666666666667	43.2222222222222222	0.22222222222222222222	8	3	7	10	1.2500000000000000	1.8750000000000000	1.1587500000000000	3.6250000000000000	49.3750000000000000	0.12500000000000000000	8	3	7	4	1.50	1.60	1.10	BALANCED	25.2	50.4	24.3	3.96	1.98	4.11	0	3	AWAY_WIN	f	1.50	1.40	2025-12-16 09:06:11.953014+00
14912737	2025-10-27	76477	Ekstraklasa 25/26	25/26	7295	Radomiak Radom	3122	Wisła Płock	Ekstraklasa	2.4444444444444444	0.77777777777777777778	1.5722222222222222	5.6666666666666667	47.3333333333333333	0.66666666666666666667	10	3	12	7	1.00000000000000000000	1.00000000000000000000	0.87125000000000000000	2.5000000000000000	37.0000000000000000	0.75000000000000000000	9	0	3	3	1.50	0.86	1.22	BALANCED	40.2	28.3	31.5	2.49	3.53	3.18	1	1	DRAW	f	0.50	0.14	2025-12-16 09:06:11.953014+00
13981860	2025-10-26	76477	Ekstraklasa 25/26	25/26	35268	Raków Częstochowa	7913	KS Lechia Gdańsk	Ekstraklasa	1.1111111111111111	1.2222222222222222	0.99111111111111111111	3.4444444444444444	48.1111111111111111	0.33333333333333333333	7	3	10	6	1.5555555555555556	2.5555555555555556	0.90555555555555555556	3.7777777777777778	43.3333333333333333	0.22222222222222222222	13	3	15	8	1.80	1.23	0.95	BALANCED	29.7	39.3	31.1	3.37	2.55	3.22	2	1	HOME_WIN	f	0.20	0.23	2025-12-16 09:06:11.953014+00
13981855	2025-10-26	76477	Ekstraklasa 25/26	25/26	3110	Górnik Zabrze	7691	Jagiellonia Białystok	Ekstraklasa	2.1111111111111111	1.00000000000000000000	1.8188888888888889	5.5555555555555556	45.2222222222222222	0.66666666666666666667	3	1	8	13	1.1000000000000000	1.00000000000000000000	1.1760000000000000	5.0000000000000000	57.7000000000000000	0.50000000000000000000	8	1	5	6	1.48	1.07	1.50	BALANCED	35.0	34.6	30.4	2.86	2.89	3.29	2	1	HOME_WIN	t	0.52	0.07	2025-12-16 09:06:11.953014+00
13981848	2025-10-26	76477	Ekstraklasa 25/26	25/26	3106	Legia Warszawa	3121	Lech Poznań	Ekstraklasa	1.2222222222222222	0.77777777777777777778	1.3433333333333333	4.7777777777777778	50.3333333333333333	0.33333333333333333333	5	0	4	8	1.5000000000000000	1.2500000000000000	1.8537500000000000	5.2500000000000000	51.6250000000000000	0.50000000000000000000	9	1	9	8	1.27	1.23	1.60	AWAY_FAVORITE	25.0	34.8	40.2	3.99	2.88	2.49	0	0	DRAW	f	1.27	1.23	2025-12-16 09:06:11.953014+00
13981858	2025-10-25	76477	Ekstraklasa 25/26	25/26	3112	GKS Katowice	5065	MKS Korona Kielce	Ekstraklasa	1.4444444444444444	1.4444444444444444	1.8133333333333333	5.3333333333333333	45.6666666666666667	0.44444444444444444444	8	3	7	4	1.00000000000000000000	1.1111111111111111	1.3144444444444444	3.1111111111111111	41.3333333333333333	0.44444444444444444444	6	1	5	7	1.37	1.30	1.56	BALANCED	32.5	41.3	26.2	3.08	2.42	3.82	1	0	HOME_WIN	f	0.37	1.30	2025-12-16 09:06:11.953014+00
13981856	2025-10-25	76477	Ekstraklasa 25/26	25/26	3117	Pogoń Szczecin	4901	Cracovia	Ekstraklasa	2.3333333333333333	1.6666666666666667	2.5100000000000000	6.0000000000000000	48.6666666666666667	0.55555555555555555556	4	1	8	9	1.3333333333333333	1.4444444444444444	1.2166666666666667	3.4444444444444444	44.7777777777777778	0.22222222222222222222	5	1	4	7	1.93	1.47	1.86	HOME_FAVORITE	38.2	42.3	19.5	2.61	2.36	5.14	2	1	HOME_WIN	f	0.07	0.47	2025-12-16 09:06:11.953014+00
13981852	2025-10-25	76477	Ekstraklasa 25/26	25/26	5064	MZKS Arka Gdynia	7918	Piast Gliwice	Ekstraklasa	1.4444444444444444	1.00000000000000000000	0.94111111111111111111	3.8888888888888889	43.1111111111111111	0.66666666666666666667	7	2	6	12	1.2222222222222222	1.2222222222222222	0.84222222222222222222	3.0000000000000000	51.8888888888888889	0.22222222222222222222	7	4	9	4	1.21	1.02	0.89	BALANCED	36.0	40.6	23.4	2.77	2.46	4.28	2	1	HOME_WIN	f	0.79	0.02	2025-12-16 09:06:11.953014+00
13981854	2025-10-24	76477	Ekstraklasa 25/26	25/26	36851	Bruk-Bet Termalica Nieciecza	3113	Zagłębie Lubin	Ekstraklasa	1.2222222222222222	2.0000000000000000	1.03888888888888888889	3.6666666666666667	43.2222222222222222	0.22222222222222222222	8	3	7	10	1.00000000000000000000	1.6666666666666667	1.2844444444444444	4.2222222222222222	43.3333333333333333	0.33333333333333333333	7	3	6	6	1.40	1.57	1.16	BALANCED	23.6	46.9	29.5	4.24	2.13	3.39	1	1	DRAW	t	0.40	0.57	2025-12-16 09:06:11.953014+00
13981857	2025-10-24	76477	Ekstraklasa 25/26	25/26	7915	Motor Lublin	3115	Widzew Łódź	Ekstraklasa	1.3333333333333333	1.2222222222222222	1.8244444444444444	3.2222222222222222	51.8888888888888889	0.22222222222222222222	1	1	5	5	1.4444444444444444	2.0000000000000000	1.4888888888888889	5.1111111111111111	47.4444444444444444	0.00000000000000000000	2	1	6	8	1.79	1.34	1.66	BALANCED	27.2	51.7	21.1	3.68	1.93	4.74	3	0	HOME_WIN	f	1.21	1.34	2025-12-16 09:06:11.953014+00
13981840	2025-10-20	76477	Ekstraklasa 25/26	25/26	3122	Wisła Płock	36851	Bruk-Bet Termalica Nieciecza	Ekstraklasa	1.3000000000000000	0.40000000000000000000	1.3680000000000000	4.6000000000000000	43.6000000000000000	0.60000000000000000000	9	0	3	3	1.4444444444444444	1.8888888888888889	1.7644444444444444	4.3333333333333333	42.8888888888888889	0.22222222222222222222	8	3	7	10	1.61	1.00	1.57	BALANCED	37.4	36.0	26.6	2.68	2.78	3.75	3	1	HOME_WIN	t	1.39	0.00	2025-12-16 09:06:11.953014+00
13981846	2025-10-19	76477	Ekstraklasa 25/26	25/26	3113	Zagłębie Lubin	3106	Legia Warszawa	Ekstraklasa	2.4444444444444444	1.00000000000000000000	1.7133333333333333	4.7777777777777778	38.2222222222222222	0.55555555555555555556	7	3	6	6	0.88888888888888888889	1.5555555555555556	1.4866666666666667	3.7777777777777778	55.8888888888888889	0.33333333333333333333	5	0	4	8	1.82	1.09	1.60	BALANCED	38.2	34.6	27.2	2.62	2.89	3.67	3	1	HOME_WIN	t	1.18	0.09	2025-12-16 09:06:11.953014+00
14715700	2025-10-19	76477	Ekstraklasa 25/26	25/26	7918	Piast Gliwice	7913	KS Lechia Gdańsk	Ekstraklasa	1.00000000000000000000	1.00000000000000000000	0.98250000000000000000	3.1250000000000000	56.5000000000000000	0.25000000000000000000	7	4	9	4	1.5555555555555556	2.5555555555555556	0.90555555555555555556	3.7777777777777778	43.3333333333333333	0.22222222222222222222	13	3	15	8	1.77	1.12	0.94	BALANCED	28.5	39.1	32.3	3.50	2.55	3.10	1	2	AWAY_WIN	f	0.77	0.88	2025-12-16 09:06:11.953014+00
13981849	2025-10-19	76477	Ekstraklasa 25/26	25/26	3121	Lech Poznań	3117	Pogoń Szczecin	Ekstraklasa	1.8888888888888889	1.7777777777777778	1.6566666666666667	5.2222222222222222	54.4444444444444444	0.33333333333333333333	9	1	9	8	0.77777777777777777778	1.8888888888888889	1.3588888888888889	4.3333333333333333	55.1111111111111111	0.22222222222222222222	4	1	8	9	1.83	1.42	1.51	BALANCED	39.1	35.2	25.7	2.56	2.84	3.89	2	2	DRAW	f	0.17	0.58	2025-12-16 09:06:11.953014+00
13981845	2025-10-18	76477	Ekstraklasa 25/26	25/26	5065	MKS Korona Kielce	3110	Górnik Zabrze	Ekstraklasa	1.3333333333333333	1.00000000000000000000	1.6866666666666667	4.3333333333333333	46.3333333333333333	0.44444444444444444444	6	1	5	7	1.1111111111111111	1.6666666666666667	0.74333333333333333333	3.3333333333333333	48.5555555555555556	0.22222222222222222222	3	1	8	13	1.59	0.96	1.22	HOME_FAVORITE	40.8	38.2	21.0	2.45	2.61	4.76	1	1	DRAW	f	0.59	0.04	2025-12-16 09:06:11.953014+00
13981850	2025-10-18	76477	Ekstraklasa 25/26	25/26	7691	Jagiellonia Białystok	5064	MZKS Arka Gdynia	Ekstraklasa	2.5714285714285714	1.5714285714285714	1.8814285714285714	6.0000000000000000	61.4285714285714286	0.71428571428571428571	8	1	5	6	0.22222222222222222222	2.5555555555555556	0.79111111111111111111	1.7777777777777778	42.7777777777777778	0.11111111111111111111	7	2	6	12	2.39	1.04	1.34	HOME_FAVORITE	50.3	33.6	16.1	1.99	2.98	6.20	4	0	HOME_WIN	t	1.61	1.04	2025-12-16 09:06:11.953014+00
13981847	2025-10-18	76477	Ekstraklasa 25/26	25/26	4901	Cracovia	35268	Raków Częstochowa	Ekstraklasa	1.4444444444444444	0.88888888888888888889	1.2377777777777778	3.3333333333333333	48.6666666666666667	0.44444444444444444444	5	1	4	7	1.7777777777777778	1.3333333333333333	1.7466666666666667	5.0000000000000000	54.4444444444444444	0.00000000000000000000	7	3	10	6	1.34	1.33	1.49	BALANCED	28.5	45.5	26.0	3.51	2.20	3.84	2	0	HOME_WIN	f	0.66	1.33	2025-12-16 09:06:11.953014+00
13981842	2025-10-17	76477	Ekstraklasa 25/26	25/26	7915	Motor Lublin	3112	GKS Katowice	Ekstraklasa	1.3333333333333333	1.2222222222222222	1.8244444444444444	3.2222222222222222	51.8888888888888889	0.22222222222222222222	1	1	5	5	1.2500000000000000	1.8750000000000000	1.1587500000000000	3.6250000000000000	49.3750000000000000	0.12500000000000000000	8	3	7	4	1.73	1.21	1.49	BALANCED	31.6	38.6	29.8	3.16	2.59	3.36	2	5	AWAY_WIN	f	0.27	3.79	2025-12-16 09:06:11.953014+00
13981853	2025-10-17	76477	Ekstraklasa 25/26	25/26	3115	Widzew Łódź	7295	Radomiak Radom	Ekstraklasa	1.4444444444444444	1.1111111111111111	1.4022222222222222	4.0000000000000000	43.1111111111111111	0.44444444444444444444	2	1	6	8	1.4444444444444444	2.5555555555555556	0.98444444444444444444	4.0000000000000000	45.7777777777777778	0.33333333333333333333	10	3	12	7	1.99	1.16	1.19	BALANCED	32.5	31.6	35.9	3.07	3.17	2.78	3	2	HOME_WIN	f	1.01	0.84	2025-12-16 09:06:11.953014+00
13981843	2025-10-05	76477	Ekstraklasa 25/26	25/26	3112	GKS Katowice	3121	Lech Poznań	Ekstraklasa	1.4444444444444444	1.4444444444444444	1.8133333333333333	5.3333333333333333	45.6666666666666667	0.44444444444444444444	8	3	7	4	1.5000000000000000	1.2500000000000000	1.8537500000000000	5.2500000000000000	51.6250000000000000	0.50000000000000000000	9	1	9	8	1.44	1.56	1.83	BALANCED	27.3	40.8	31.9	3.67	2.45	3.13	0	1	AWAY_WIN	f	1.44	0.56	2025-12-16 09:06:11.953014+00
13981841	2025-10-05	76477	Ekstraklasa 25/26	25/26	7691	Jagiellonia Białystok	5065	MKS Korona Kielce	Ekstraklasa	2.5714285714285714	1.5714285714285714	1.8814285714285714	6.0000000000000000	61.4285714285714286	0.71428571428571428571	8	1	5	6	1.00000000000000000000	1.1111111111111111	1.3144444444444444	3.1111111111111111	41.3333333333333333	0.44444444444444444444	6	1	5	7	1.67	1.36	1.60	BALANCED	38.9	36.5	24.6	2.57	2.74	4.06	3	1	HOME_WIN	t	1.33	0.36	2025-12-16 09:06:11.953014+00
13981839	2025-10-05	76477	Ekstraklasa 25/26	25/26	35268	Raków Częstochowa	7915	Motor Lublin	Ekstraklasa	1.1111111111111111	1.2222222222222222	0.99111111111111111111	3.4444444444444444	48.1111111111111111	0.33333333333333333333	7	3	10	6	1.2222222222222222	1.8888888888888889	1.04666666666666666667	3.2222222222222222	46.2222222222222222	0.33333333333333333333	1	1	5	5	1.47	1.18	1.02	BALANCED	31.6	43.0	25.4	3.16	2.32	3.94	2	0	HOME_WIN	f	0.53	1.18	2025-12-16 09:06:11.953014+00
13981837	2025-10-05	76477	Ekstraklasa 25/26	25/26	3110	Górnik Zabrze	3106	Legia Warszawa	Ekstraklasa	2.1111111111111111	1.00000000000000000000	1.8188888888888889	5.5555555555555556	45.2222222222222222	0.66666666666666666667	3	1	8	13	0.88888888888888888889	1.5555555555555556	1.4866666666666667	3.7777777777777778	55.8888888888888889	0.33333333333333333333	5	0	4	8	1.76	1.09	1.65	BALANCED	35.6	39.9	24.6	2.81	2.51	4.07	3	1	HOME_WIN	f	1.24	0.09	2025-12-16 09:06:11.953014+00
13981836	2025-10-04	76477	Ekstraklasa 25/26	25/26	36851	Bruk-Bet Termalica Nieciecza	3115	Widzew Łódź	Ekstraklasa	1.2222222222222222	2.0000000000000000	1.03888888888888888889	3.6666666666666667	43.2222222222222222	0.22222222222222222222	8	3	7	10	1.4444444444444444	2.0000000000000000	1.4888888888888889	5.1111111111111111	47.4444444444444444	0.00000000000000000000	2	1	6	8	1.57	1.73	1.26	BALANCED	29.2	47.0	23.7	3.42	2.13	4.21	2	4	AWAY_WIN	f	0.43	2.27	2025-12-16 09:06:11.953014+00
13981834	2025-10-04	76477	Ekstraklasa 25/26	25/26	5064	MZKS Arka Gdynia	4901	Cracovia	Ekstraklasa	1.4444444444444444	1.00000000000000000000	0.94111111111111111111	3.8888888888888889	43.1111111111111111	0.66666666666666666667	7	2	6	12	1.3333333333333333	1.4444444444444444	1.2166666666666667	3.4444444444444444	44.7777777777777778	0.22222222222222222222	5	1	4	7	1.32	1.14	1.08	BALANCED	37.3	37.7	25.0	2.68	2.65	4.00	2	1	HOME_WIN	f	0.68	0.14	2025-12-16 09:06:11.953014+00
13981838	2025-10-04	76477	Ekstraklasa 25/26	25/26	7295	Radomiak Radom	3113	Zagłębie Lubin	Ekstraklasa	2.4444444444444444	0.77777777777777777778	1.5722222222222222	5.6666666666666667	47.3333333333333333	0.66666666666666666667	10	3	12	7	1.00000000000000000000	1.6666666666666667	1.2844444444444444	4.2222222222222222	43.3333333333333333	0.33333333333333333333	7	3	6	6	1.84	0.96	1.43	HOME_FAVORITE	41.2	33.5	25.3	2.43	2.99	3.95	3	1	HOME_WIN	t	1.16	0.04	2025-12-16 09:06:11.953014+00
13981835	2025-10-03	76477	Ekstraklasa 25/26	25/26	7913	KS Lechia Gdańsk	3122	Wisła Płock	Ekstraklasa	2.5555555555555556	1.5555555555555556	1.4844444444444444	5.4444444444444444	48.6666666666666667	0.55555555555555555556	13	3	15	8	1.00000000000000000000	1.00000000000000000000	0.87125000000000000000	2.5000000000000000	37.0000000000000000	0.75000000000000000000	9	0	3	3	1.51	1.25	1.18	BALANCED	41.0	26.9	32.1	2.44	3.72	3.11	1	1	DRAW	f	0.51	0.25	2025-12-16 09:06:11.953014+00
13981844	2025-10-03	76477	Ekstraklasa 25/26	25/26	3117	Pogoń Szczecin	7918	Piast Gliwice	Ekstraklasa	2.3333333333333333	1.6666666666666667	2.5100000000000000	6.0000000000000000	48.6666666666666667	0.55555555555555555556	4	1	8	9	1.2222222222222222	1.2222222222222222	0.84222222222222222222	3.0000000000000000	51.8888888888888889	0.22222222222222222222	7	4	9	4	1.82	1.35	1.68	HOME_FAVORITE	42.4	36.4	21.2	2.36	2.75	4.72	2	1	HOME_WIN	t	0.18	0.35	2025-12-16 09:06:11.953014+00
13981827	2025-09-29	76477	Ekstraklasa 25/26	25/26	3113	Zagłębie Lubin	5064	MZKS Arka Gdynia	Ekstraklasa	2.4444444444444444	1.00000000000000000000	1.7133333333333333	4.7777777777777778	38.2222222222222222	0.55555555555555555556	7	3	6	6	0.22222222222222222222	2.5555555555555556	0.79111111111111111111	1.7777777777777778	42.7777777777777778	0.11111111111111111111	7	2	6	12	2.32	0.75	1.25	HOME_FAVORITE	48.4	32.3	19.2	2.06	3.09	5.20	4	0	HOME_WIN	t	1.68	0.75	2025-12-16 09:06:11.953014+00
13981828	2025-09-29	76477	Ekstraklasa 25/26	25/26	7915	Motor Lublin	7295	Radomiak Radom	Ekstraklasa	1.3333333333333333	1.2222222222222222	1.8244444444444444	3.2222222222222222	51.8888888888888889	0.22222222222222222222	1	1	5	5	1.4444444444444444	2.5555555555555556	0.98444444444444444444	4.0000000000000000	45.7777777777777778	0.33333333333333333333	10	3	12	7	2.07	1.22	1.40	BALANCED	32.9	26.6	40.5	3.04	3.76	2.47	2	2	DRAW	f	0.07	0.78	2025-12-16 09:06:11.953014+00
13981826	2025-09-28	76477	Ekstraklasa 25/26	25/26	3106	Legia Warszawa	3117	Pogoń Szczecin	Ekstraklasa	1.2222222222222222	0.77777777777777777778	1.3433333333333333	4.7777777777777778	50.3333333333333333	0.33333333333333333333	5	0	4	8	0.77777777777777777778	1.8888888888888889	1.3588888888888889	4.3333333333333333	55.1111111111111111	0.22222222222222222222	4	1	8	9	1.59	0.92	1.35	BALANCED	28.3	46.2	25.5	3.53	2.16	3.93	1	0	HOME_WIN	f	0.59	0.92	2025-12-16 09:06:11.953014+00
13981832	2025-09-28	76477	Ekstraklasa 25/26	25/26	3115	Widzew Łódź	35268	Raków Częstochowa	Ekstraklasa	1.4444444444444444	1.1111111111111111	1.4022222222222222	4.0000000000000000	43.1111111111111111	0.44444444444444444444	2	1	6	8	1.7777777777777778	1.3333333333333333	1.7466666666666667	5.0000000000000000	54.4444444444444444	0.00000000000000000000	7	3	10	6	1.38	1.44	1.57	BALANCED	26.6	48.0	25.4	3.76	2.08	3.94	0	1	AWAY_WIN	f	1.38	0.44	2025-12-16 09:06:11.953014+00
13981830	2025-09-28	76477	Ekstraklasa 25/26	25/26	3121	Lech Poznań	7691	Jagiellonia Białystok	Ekstraklasa	1.8888888888888889	1.7777777777777778	1.6566666666666667	5.2222222222222222	54.4444444444444444	0.33333333333333333333	9	1	9	8	1.1000000000000000	1.00000000000000000000	1.1760000000000000	5.0000000000000000	57.7000000000000000	0.50000000000000000000	8	1	5	6	1.39	1.46	1.42	BALANCED	33.5	35.6	30.9	2.99	2.81	3.23	2	2	DRAW	t	0.61	0.54	2025-12-16 09:06:11.953014+00
13981829	2025-09-27	76477	Ekstraklasa 25/26	25/26	5065	MKS Korona Kielce	7913	KS Lechia Gdańsk	Ekstraklasa	1.3333333333333333	1.00000000000000000000	1.6866666666666667	4.3333333333333333	46.3333333333333333	0.44444444444444444444	6	1	5	7	1.5555555555555556	2.5555555555555556	0.90555555555555555556	3.7777777777777778	43.3333333333333333	0.22222222222222222222	13	3	15	8	2.03	1.12	1.30	BALANCED	38.8	32.4	28.8	2.58	3.09	3.47	3	0	HOME_WIN	t	0.97	1.12	2025-12-16 09:06:11.953014+00
13981831	2025-09-27	76477	Ekstraklasa 25/26	25/26	4901	Cracovia	3110	Górnik Zabrze	Ekstraklasa	1.4444444444444444	0.88888888888888888889	1.2377777777777778	3.3333333333333333	48.6666666666666667	0.44444444444444444444	5	1	4	7	1.1111111111111111	1.6666666666666667	0.74333333333333333333	3.3333333333333333	48.5555555555555556	0.22222222222222222222	3	1	8	13	1.50	0.91	0.99	BALANCED	34.6	42.1	23.3	2.89	2.37	4.30	1	1	DRAW	t	0.50	0.09	2025-12-16 09:06:11.953014+00
13981833	2025-09-27	76477	Ekstraklasa 25/26	25/26	7918	Piast Gliwice	36851	Bruk-Bet Termalica Nieciecza	Ekstraklasa	1.00000000000000000000	1.00000000000000000000	0.98250000000000000000	3.1250000000000000	56.5000000000000000	0.25000000000000000000	7	4	9	4	1.4444444444444444	1.8888888888888889	1.7644444444444444	4.3333333333333333	42.8888888888888889	0.22222222222222222222	8	3	7	10	1.44	1.30	1.37	BALANCED	24.5	44.2	31.3	4.08	2.26	3.20	4	2	HOME_WIN	f	2.56	0.70	2025-12-16 09:06:11.953014+00
13981825	2025-09-26	76477	Ekstraklasa 25/26	25/26	3122	Wisła Płock	3112	GKS Katowice	Ekstraklasa	1.3000000000000000	0.40000000000000000000	1.3680000000000000	4.6000000000000000	43.6000000000000000	0.60000000000000000000	9	0	3	3	1.2500000000000000	1.8750000000000000	1.1587500000000000	3.6250000000000000	49.3750000000000000	0.12500000000000000000	8	3	7	4	1.60	0.80	1.26	HOME_FAVORITE	41.2	36.5	22.3	2.42	2.74	4.49	1	1	DRAW	f	0.60	0.20	2025-12-16 09:06:11.953014+00
14682952	2025-09-24	76477	Ekstraklasa 25/26	25/26	3106	Legia Warszawa	7691	Jagiellonia Białystok	Ekstraklasa	1.2222222222222222	0.77777777777777777778	1.3433333333333333	4.7777777777777778	50.3333333333333333	0.33333333333333333333	5	0	4	8	1.1000000000000000	1.00000000000000000000	1.1760000000000000	5.0000000000000000	57.7000000000000000	0.50000000000000000000	8	1	5	6	1.14	0.96	1.26	BALANCED	26.8	39.9	33.4	3.74	2.51	3.00	0	0	DRAW	t	1.14	0.96	2025-12-16 09:06:11.953014+00
14570884	2025-09-24	76477	Ekstraklasa 25/26	25/26	35268	Raków Częstochowa	3121	Lech Poznań	Ekstraklasa	1.1111111111111111	1.2222222222222222	0.99111111111111111111	3.4444444444444444	48.1111111111111111	0.33333333333333333333	7	3	10	6	1.5000000000000000	1.2500000000000000	1.8537500000000000	5.2500000000000000	51.6250000000000000	0.50000000000000000000	9	1	9	8	1.15	1.45	1.42	AWAY_FAVORITE	23.2	37.1	39.8	4.32	2.70	2.52	2	2	DRAW	f	0.85	0.55	2025-12-16 09:06:11.953014+00
13981819	2025-09-21	76477	Ekstraklasa 25/26	25/26	3110	Górnik Zabrze	3115	Widzew Łódź	Ekstraklasa	2.1111111111111111	1.00000000000000000000	1.8188888888888889	5.5555555555555556	45.2222222222222222	0.66666666666666666667	3	1	8	13	1.4444444444444444	2.0000000000000000	1.4888888888888889	5.1111111111111111	47.4444444444444444	0.00000000000000000000	2	1	6	8	1.98	1.23	1.65	HOME_FAVORITE	39.9	42.8	17.3	2.51	2.34	5.78	3	2	HOME_WIN	f	1.02	0.77	2025-12-16 09:06:11.953014+00
13981821	2025-09-21	76477	Ekstraklasa 25/26	25/26	3117	Pogoń Szczecin	7913	KS Lechia Gdańsk	Ekstraklasa	2.3333333333333333	1.6666666666666667	2.5100000000000000	6.0000000000000000	48.6666666666666667	0.55555555555555555556	4	1	8	9	1.5555555555555556	2.5555555555555556	0.90555555555555555556	3.7777777777777778	43.3333333333333333	0.22222222222222222222	13	3	15	8	2.49	1.45	1.71	HOME_FAVORITE	45.4	26.5	28.2	2.20	3.78	3.55	3	4	AWAY_WIN	f	0.51	2.55	2025-12-16 09:06:11.953014+00
13981815	2025-09-21	76477	Ekstraklasa 25/26	25/26	3113	Zagłębie Lubin	7915	Motor Lublin	Ekstraklasa	2.4444444444444444	1.00000000000000000000	1.7133333333333333	4.7777777777777778	38.2222222222222222	0.55555555555555555556	7	3	6	6	1.2222222222222222	1.8888888888888889	1.04666666666666666667	3.2222222222222222	46.2222222222222222	0.33333333333333333333	1	1	5	5	1.98	1.07	1.38	HOME_FAVORITE	45.8	30.0	24.3	2.19	3.33	4.12	2	2	DRAW	f	0.02	0.93	2025-12-16 09:06:11.953014+00
13981820	2025-09-20	76477	Ekstraklasa 25/26	25/26	7295	Radomiak Radom	7918	Piast Gliwice	Ekstraklasa	2.4444444444444444	0.77777777777777777778	1.5722222222222222	5.6666666666666667	47.3333333333333333	0.66666666666666666667	10	3	12	7	1.2222222222222222	1.2222222222222222	0.84222222222222222222	3.0000000000000000	51.8888888888888889	0.22222222222222222222	7	4	9	4	1.62	0.90	1.21	HOME_FAVORITE	46.8	32.0	21.2	2.14	3.12	4.72	1	0	HOME_WIN	t	0.62	0.90	2025-12-16 09:06:11.953014+00
13981823	2025-09-20	76477	Ekstraklasa 25/26	25/26	35268	Raków Częstochowa	3106	Legia Warszawa	Ekstraklasa	1.1111111111111111	1.2222222222222222	0.99111111111111111111	3.4444444444444444	48.1111111111111111	0.33333333333333333333	7	3	10	6	0.88888888888888888889	1.5555555555555556	1.4866666666666667	3.7777777777777778	55.8888888888888889	0.33333333333333333333	5	0	4	8	1.30	1.20	1.24	BALANCED	28.8	39.8	31.4	3.47	2.51	3.19	1	1	DRAW	t	0.30	0.20	2025-12-16 09:06:11.953014+00
13981813	2025-09-20	76477	Ekstraklasa 25/26	25/26	36851	Bruk-Bet Termalica Nieciecza	3121	Lech Poznań	Ekstraklasa	1.2222222222222222	2.0000000000000000	1.03888888888888888889	3.6666666666666667	43.2222222222222222	0.22222222222222222222	8	3	7	10	1.5000000000000000	1.2500000000000000	1.8537500000000000	5.2500000000000000	51.6250000000000000	0.50000000000000000000	9	1	9	8	1.19	1.84	1.45	AWAY_FAVORITE	20.6	39.8	39.6	4.85	2.51	2.52	0	2	AWAY_WIN	f	1.19	0.16	2025-12-16 09:06:11.953014+00
13981817	2025-09-20	76477	Ekstraklasa 25/26	25/26	5064	MZKS Arka Gdynia	5065	MKS Korona Kielce	Ekstraklasa	1.4444444444444444	1.00000000000000000000	0.94111111111111111111	3.8888888888888889	43.1111111111111111	0.66666666666666666667	7	2	6	12	1.00000000000000000000	1.1111111111111111	1.3144444444444444	3.1111111111111111	41.3333333333333333	0.44444444444444444444	6	1	5	7	1.15	1.08	1.13	BALANCED	33.8	35.7	30.5	2.96	2.80	3.27	0	0	DRAW	t	1.15	1.08	2025-12-16 09:06:11.953014+00
13981970	2025-09-19	76477	Ekstraklasa 25/26	25/26	3122	Wisła Płock	7691	Jagiellonia Białystok	Ekstraklasa	1.3000000000000000	0.40000000000000000000	1.3680000000000000	4.6000000000000000	43.6000000000000000	0.60000000000000000000	9	0	3	3	1.1000000000000000	1.00000000000000000000	1.1760000000000000	5.0000000000000000	57.7000000000000000	0.50000000000000000000	8	1	5	6	1.17	0.77	1.27	BALANCED	36.0	33.8	30.2	2.78	2.96	3.31	0	1	AWAY_WIN	f	1.17	0.23	2025-12-16 09:06:11.953014+00
13981822	2025-09-19	76477	Ekstraklasa 25/26	25/26	3112	GKS Katowice	4901	Cracovia	Ekstraklasa	1.4444444444444444	1.4444444444444444	1.8133333333333333	5.3333333333333333	45.6666666666666667	0.44444444444444444444	8	3	7	4	1.3333333333333333	1.4444444444444444	1.2166666666666667	3.4444444444444444	44.7777777777777778	0.22222222222222222222	5	1	4	7	1.54	1.36	1.52	HOME_FAVORITE	36.5	42.5	21.0	2.74	2.35	4.76	0	3	AWAY_WIN	f	1.54	1.64	2025-12-16 09:06:11.953014+00
\.


--
-- Data for Name: mart_team_attack; Type: TABLE DATA; Schema: gold; Owner: airflow
--

COPY gold.mart_team_attack (team_id, team_name, season_id, season_name, season_year, matches_played, total_goals, goals_per_game, total_xg, xg_per_game, xg_difference, xg_diff_per_game, total_big_chances_created, big_chances_created_per_game, total_big_chances_missed, big_chances_missed_per_game, total_big_chances_scored, big_chances_scored_per_game, total_shots_on_target, shots_on_target_per_game, total_shots_off_target, shots_off_target_per_game, total_blocked_shots, blocked_shots_per_game, total_shots, shots_per_game, total_shots_inside_box, shots_inside_box_per_game, total_shots_outside_box, shots_outside_box_per_game, total_hit_woodwork, total_corners, corners_per_game, avg_dribbles_success_pct, total_touches_in_box, touches_in_box_per_game) FROM stdin;
3117	Pogoń Szczecin	76477	Ekstraklasa 25/26	25/26	18	28	1.56	34.82	1.93	-6.82	-0.38	62	3.44	44	2.44	18	1.00	93	5.17	115	6.39	87	4.83	295	16.39	195	10.83	100	5.56	14	99	5.50	5.6	515	28.61
3121	Lech Poznań	76477	Ekstraklasa 25/26	25/26	17	29	1.71	29.74	1.75	-0.74	-0.04	28	1.65	15	0.88	13	0.76	89	5.24	82	4.82	83	4.88	254	14.94	152	8.94	102	6.00	5	101	5.94	7.4	426	25.06
3112	GKS Katowice	76477	Ekstraklasa 25/26	25/26	17	23	1.35	25.59	1.51	-2.59	-0.15	33	1.94	17	1.00	16	0.94	77	4.53	74	4.35	56	3.29	207	12.18	128	7.53	79	4.65	8	87	5.12	5.8	368	21.65
5065	MKS Korona Kielce	76477	Ekstraklasa 25/26	25/26	18	21	1.17	27.01	1.50	-6.01	-0.33	36	2.00	26	1.44	10	0.56	67	3.72	108	6.00	84	4.67	259	14.39	180	10.00	79	4.39	9	96	5.33	7.9	466	25.89
3113	Zagłębie Lubin	76477	Ekstraklasa 25/26	25/26	18	31	1.72	26.98	1.50	4.02	0.22	41	2.28	23	1.28	18	1.00	81	4.50	91	5.06	55	3.06	227	12.61	153	8.50	74	4.11	4	70	3.89	4.8	371	20.61
7691	Jagiellonia Białystok	76477	Ekstraklasa 25/26	25/26	17	29	1.71	24.93	1.47	4.07	0.24	32	1.88	15	0.88	17	1.00	92	5.41	92	5.41	71	4.18	255	15.00	164	9.65	91	5.35	7	86	5.06	6.9	447	26.29
3115	Widzew Łódź	76477	Ekstraklasa 25/26	25/26	18	26	1.44	26.02	1.45	-0.02	0.00	38	2.11	22	1.22	16	0.89	82	4.56	84	4.67	64	3.56	230	12.78	136	7.56	94	5.22	7	71	3.94	8.4	373	20.72
7915	Motor Lublin	76477	Ekstraklasa 25/26	25/26	18	23	1.28	25.84	1.44	-2.84	-0.16	33	1.83	18	1.00	15	0.83	58	3.22	89	4.94	71	3.94	218	12.11	159	8.83	59	3.28	4	99	5.50	6.5	434	24.11
3106	Legia Warszawa	76477	Ekstraklasa 25/26	25/26	18	19	1.06	25.47	1.42	-6.47	-0.36	35	1.94	27	1.50	8	0.44	77	4.28	108	6.00	93	5.17	278	15.44	171	9.50	107	5.94	5	99	5.50	7.9	500	27.78
36851	Bruk-Bet Termalica Nieciecza	76477	Ekstraklasa 25/26	25/26	18	24	1.33	25.23	1.40	-1.23	-0.07	41	2.28	28	1.56	13	0.72	72	4.00	72	4.00	59	3.28	203	11.28	133	7.39	70	3.89	6	78	4.33	6.4	349	19.39
35268	Raków Częstochowa	76477	Ekstraklasa 25/26	25/26	18	26	1.44	24.64	1.37	1.36	0.08	44	2.44	27	1.50	17	0.94	76	4.22	87	4.83	67	3.72	230	12.78	158	8.78	72	4.00	4	72	4.00	8.2	444	24.67
7295	Radomiak Radom	76477	Ekstraklasa 25/26	25/26	18	35	1.94	23.01	1.28	11.99	0.67	41	2.28	21	1.17	20	1.11	87	4.83	90	5.00	66	3.67	243	13.50	146	8.11	97	5.39	2	70	3.89	6.5	354	19.67
3110	Górnik Zabrze	76477	Ekstraklasa 25/26	25/26	18	29	1.61	23.06	1.28	5.94	0.33	32	1.78	18	1.00	14	0.78	80	4.44	111	6.17	90	5.00	281	15.61	169	9.39	112	6.22	6	103	5.72	7.7	455	25.28
4901	Cracovia	76477	Ekstraklasa 25/26	25/26	18	25	1.39	22.09	1.23	2.91	0.16	38	2.11	20	1.11	18	1.00	61	3.39	80	4.44	55	3.06	196	10.89	127	7.06	69	3.83	5	67	3.72	6.1	324	18.00
7913	KS Lechia Gdańsk	76477	Ekstraklasa 25/26	25/26	18	37	2.06	21.51	1.20	15.49	0.86	49	2.72	24	1.33	25	1.39	83	4.61	75	4.17	57	3.17	215	11.94	142	7.89	73	4.06	8	76	4.22	4.9	393	21.83
3122	Wisła Płock	76477	Ekstraklasa 25/26	25/26	18	21	1.17	20.65	1.15	0.35	0.02	29	1.61	16	0.89	13	0.72	66	3.67	86	4.78	52	2.89	204	11.33	121	6.72	83	4.61	5	70	3.89	5.3	322	17.89
7918	Piast Gliwice	76477	Ekstraklasa 25/26	25/26	17	19	1.12	15.44	0.91	3.56	0.21	13	0.76	7	0.41	6	0.35	52	3.06	99	5.82	80	4.71	231	13.59	140	8.24	91	5.35	4	83	4.88	5.3	392	23.06
5064	MZKS Arka Gdynia	76477	Ekstraklasa 25/26	25/26	18	15	0.83	15.59	0.87	-0.59	-0.03	23	1.28	15	0.83	8	0.44	51	2.83	72	4.00	47	2.61	170	9.44	100	5.56	70	3.89	4	67	3.72	5.1	279	15.50
3106	Legia Warszawa	61236	Ekstraklasa 24/25	24/25	33	58	1.76	63.05	1.91	-5.05	-0.15	87	2.64	52	1.58	35	1.06	169	5.12	171	5.18	161	4.88	501	15.18	347	10.52	154	4.67	18	206	6.24	9.6	1045	31.67
3117	Pogoń Szczecin	61236	Ekstraklasa 24/25	24/25	33	56	1.70	60.84	1.84	-4.84	-0.15	83	2.52	50	1.52	33	1.00	176	5.33	172	5.21	149	4.52	497	15.06	331	10.03	166	5.03	11	201	6.09	5.7	897	27.18
7691	Jagiellonia Białystok	61236	Ekstraklasa 24/25	24/25	33	54	1.64	55.50	1.68	-1.50	-0.05	81	2.45	49	1.48	32	0.97	148	4.48	188	5.70	124	3.76	460	13.94	306	9.27	154	4.67	14	169	5.12	7.9	964	29.21
3121	Lech Poznań	61236	Ekstraklasa 24/25	24/25	33	66	2.00	55.47	1.68	10.53	0.32	80	2.42	43	1.30	37	1.12	178	5.39	155	4.70	179	5.42	512	15.52	342	10.36	170	5.15	10	167	5.06	6.8	932	28.24
38732	Stal Mielec	61236	Ekstraklasa 24/25	24/25	33	38	1.15	54.71	1.66	-16.71	-0.51	67	2.03	43	1.30	24	0.73	136	4.12	183	5.55	127	3.85	446	13.52	305	9.24	141	4.27	15	158	4.79	6.1	757	22.94
3112	GKS Katowice	61236	Ekstraklasa 24/25	24/25	33	48	1.45	53.43	1.62	-5.43	-0.16	71	2.15	44	1.33	27	0.82	150	4.55	206	6.24	123	3.73	479	14.52	301	9.12	178	5.39	10	147	4.45	6.2	814	24.67
7915	Motor Lublin	61236	Ekstraklasa 24/25	24/25	32	46	1.44	51.51	1.61	-5.51	-0.17	76	2.38	51	1.59	25	0.78	130	4.06	174	5.44	115	3.59	419	13.09	277	8.66	142	4.44	20	162	5.06	6.4	722	22.56
7913	KS Lechia Gdańsk	61236	Ekstraklasa 24/25	24/25	32	43	1.34	47.59	1.49	-4.59	-0.14	59	1.84	33	1.03	26	0.81	139	4.34	154	4.81	123	3.84	416	13.00	255	7.97	161	5.03	10	147	4.59	7.5	760	23.75
35268	Raków Częstochowa	61236	Ekstraklasa 24/25	24/25	33	49	1.48	48.86	1.48	0.14	0.00	65	1.97	34	1.03	31	0.94	158	4.79	174	5.27	125	3.79	457	13.85	277	8.39	180	5.45	8	167	5.06	8.9	799	24.21
7295	Radomiak Radom	61236	Ekstraklasa 24/25	24/25	33	46	1.39	48.47	1.47	-2.47	-0.07	66	2.00	37	1.12	29	0.88	139	4.21	199	6.03	121	3.67	459	13.91	324	9.82	135	4.09	11	179	5.42	7.2	768	23.27
4901	Cracovia	61236	Ekstraklasa 24/25	24/25	33	57	1.73	47.78	1.45	9.22	0.28	72	2.18	36	1.09	36	1.09	144	4.36	204	6.18	120	3.64	468	14.18	269	8.15	199	6.03	9	161	4.88	6.5	705	21.36
3113	Zagłębie Lubin	61236	Ekstraklasa 24/25	24/25	33	33	1.00	47.74	1.45	-14.74	-0.45	50	1.52	31	0.94	19	0.58	147	4.45	209	6.33	130	3.94	486	14.73	291	8.82	195	5.91	11	183	5.55	7.0	789	23.91
3108	Śląsk Wrocław	61236	Ekstraklasa 24/25	24/25	33	37	1.12	47.40	1.44	-10.40	-0.32	66	2.00	44	1.33	22	0.67	136	4.12	188	5.70	145	4.39	469	14.21	294	8.91	175	5.30	15	150	4.55	7.8	779	23.61
3110	Górnik Zabrze	61236	Ekstraklasa 24/25	24/25	32	41	1.28	45.86	1.43	-4.86	-0.15	69	2.16	48	1.50	21	0.66	151	4.72	178	5.56	148	4.63	477	14.91	280	8.75	197	6.16	10	172	5.38	7.7	725	22.66
5065	MKS Korona Kielce	61236	Ekstraklasa 24/25	24/25	33	37	1.12	44.32	1.34	-7.32	-0.22	47	1.42	24	0.73	23	0.70	132	4.00	178	5.39	128	3.88	438	13.27	266	8.06	172	5.21	4	174	5.27	7.1	688	20.85
3115	Widzew Łódź	61236	Ekstraklasa 24/25	24/25	33	37	1.12	41.75	1.27	-4.75	-0.14	59	1.79	40	1.21	19	0.58	117	3.55	173	5.24	123	3.73	413	12.52	243	7.36	170	5.15	11	153	4.64	6.8	653	19.79
38729	Puszcza Niepołomice	61236	Ekstraklasa 24/25	24/25	32	35	1.09	39.65	1.24	-4.65	-0.15	54	1.69	32	1.00	22	0.69	112	3.50	139	4.34	109	3.41	360	11.25	240	7.50	120	3.75	9	132	4.13	6.1	700	21.88
7918	Piast Gliwice	61236	Ekstraklasa 24/25	24/25	33	36	1.09	38.96	1.18	-2.96	-0.09	57	1.73	39	1.18	18	0.55	139	4.21	179	5.42	115	3.48	433	13.12	276	8.36	157	4.76	8	154	4.67	5.8	726	22.00
7691	Jagiellonia Białystok	52176	Ekstraklasa 23/24	23/24	32	73	2.28	60.76	1.90	12.24	0.38	88	2.75	44	1.38	44	1.38	162	5.06	173	5.41	118	3.69	453	14.16	305	9.53	148	4.63	9	163	5.09	8.1	133	4.16
35268	Raków Częstochowa	52176	Ekstraklasa 23/24	23/24	33	51	1.55	60.07	1.82	-9.07	-0.27	77	2.33	49	1.48	28	0.85	162	4.91	188	5.70	124	3.76	474	14.36	311	9.42	163	4.94	10	196	5.94	9.8	78	2.36
3117	Pogoń Szczecin	52176	Ekstraklasa 23/24	23/24	32	56	1.75	57.61	1.80	-1.61	-0.05	83	2.59	52	1.63	31	0.97	159	4.97	204	6.38	153	4.78	516	16.13	327	10.22	189	5.91	8	191	5.97	5.9	81	2.53
3106	Legia Warszawa	52176	Ekstraklasa 23/24	23/24	33	48	1.45	53.49	1.62	-5.49	-0.17	68	2.06	41	1.24	27	0.82	143	4.33	199	6.03	149	4.52	491	14.88	307	9.30	184	5.58	18	195	5.91	7.2	63	1.91
7295	Radomiak Radom	52176	Ekstraklasa 23/24	23/24	32	39	1.22	50.39	1.57	-11.39	-0.36	65	2.03	47	1.47	18	0.56	133	4.16	199	6.22	125	3.91	457	14.28	308	9.63	149	4.66	15	169	5.28	7.1	38	1.19
7918	Piast Gliwice	52176	Ekstraklasa 23/24	23/24	32	37	1.16	49.20	1.54	-12.20	-0.38	61	1.91	37	1.16	24	0.75	124	3.88	157	4.91	114	3.56	395	12.34	257	8.03	138	4.31	7	162	5.06	6.1	36	1.13
3108	Śląsk Wrocław	52176	Ekstraklasa 23/24	23/24	32	48	1.50	46.90	1.47	1.10	0.03	67	2.09	36	1.13	31	0.97	146	4.56	137	4.28	106	3.31	389	12.16	227	7.09	162	5.06	6	117	3.66	8.8	81	2.53
3113	Zagłębie Lubin	52176	Ekstraklasa 23/24	23/24	32	39	1.22	45.82	1.43	-6.82	-0.21	59	1.84	33	1.03	26	0.81	152	4.75	189	5.91	130	4.06	471	14.72	280	8.75	191	5.97	6	170	5.31	6.8	55	1.72
5065	MKS Korona Kielce	52176	Ekstraklasa 23/24	23/24	33	39	1.18	46.20	1.40	-7.20	-0.22	55	1.67	30	0.91	25	0.76	133	4.03	180	5.45	141	4.27	454	13.76	251	7.61	203	6.15	6	160	4.85	8.0	78	2.36
4901	Cracovia	52176	Ekstraklasa 23/24	23/24	33	43	1.30	45.65	1.38	-2.65	-0.08	54	1.64	32	0.97	22	0.67	131	3.97	181	5.48	149	4.52	461	13.97	274	8.30	187	5.67	16	171	5.18	7.1	97	2.94
3105	Ruch Chorzów	52176	Ekstraklasa 23/24	23/24	32	37	1.16	43.20	1.35	-6.20	-0.19	50	1.56	30	0.94	20	0.63	117	3.66	169	5.28	125	3.91	411	12.84	244	7.63	167	5.22	10	145	4.53	6.4	53	1.66
3110	Górnik Zabrze	52176	Ekstraklasa 23/24	23/24	32	45	1.41	42.83	1.34	2.17	0.07	59	1.84	29	0.91	30	0.94	135	4.22	150	4.69	112	3.50	397	12.41	231	7.22	166	5.19	6	159	4.97	7.3	64	2.00
3121	Lech Poznań	52176	Ekstraklasa 23/24	23/24	32	43	1.34	42.09	1.32	0.91	0.03	55	1.72	32	1.00	23	0.72	140	4.38	140	4.38	112	3.50	392	12.25	232	7.25	160	5.00	10	187	5.84	7.8	41	1.28
3115	Widzew Łódź	52176	Ekstraklasa 23/24	23/24	32	41	1.28	42.02	1.31	-1.02	-0.03	56	1.75	36	1.13	20	0.63	137	4.28	166	5.19	120	3.75	423	13.22	243	7.59	180	5.63	11	181	5.66	6.2	48	1.50
38729	Puszcza Niepołomice	52176	Ekstraklasa 23/24	23/24	32	36	1.13	39.06	1.22	-3.06	-0.10	46	1.44	24	0.75	22	0.69	108	3.38	138	4.31	98	3.06	344	10.75	232	7.25	112	3.50	11	139	4.34	4.5	79	2.47
3123	ŁKS Łódź	52176	Ekstraklasa 23/24	23/24	32	34	1.06	37.54	1.17	-3.54	-0.11	40	1.25	21	0.66	19	0.59	108	3.38	145	4.53	109	3.41	362	11.31	193	6.03	169	5.28	5	127	3.97	8.5	35	1.09
7922	Warta Poznań	52176	Ekstraklasa 23/24	23/24	32	31	0.97	31.96	1.00	-0.96	-0.03	33	1.03	21	0.66	12	0.38	97	3.03	119	3.72	90	2.81	306	9.56	188	5.88	118	3.69	9	104	3.25	5.8	68	2.13
38732	Stal Mielec	52176	Ekstraklasa 23/24	23/24	32	40	1.25	30.85	0.96	9.15	0.29	43	1.34	20	0.63	23	0.72	116	3.63	128	4.00	85	2.66	329	10.28	182	5.69	147	4.59	9	118	3.69	6.7	54	1.69
35268	Raków Częstochowa	42004	Ekstraklasa 22/23	22/23	33	62	1.88	61.49	1.86	0.51	0.02	82	2.48	49	1.48	33	1.00	154	4.67	185	5.61	129	3.91	468	14.18	302	9.15	166	5.03	11	195	5.91	9.7	0	0.00
3117	Pogoń Szczecin	42004	Ekstraklasa 22/23	22/23	33	55	1.67	60.93	1.85	-5.93	-0.18	71	2.15	39	1.18	32	0.97	175	5.30	191	5.79	150	4.55	516	15.64	313	9.48	203	6.15	15	206	6.24	9.9	0	0.00
3121	Lech Poznań	42004	Ekstraklasa 22/23	22/23	33	51	1.55	55.85	1.69	-4.85	-0.15	81	2.45	53	1.61	28	0.85	193	5.85	194	5.88	140	4.24	527	15.97	305	9.24	222	6.73	15	189	5.73	9.5	0	0.00
3106	Legia Warszawa	42004	Ekstraklasa 22/23	22/23	33	56	1.70	51.48	1.56	4.52	0.14	71	2.15	42	1.27	29	0.88	161	4.88	206	6.24	122	3.70	489	14.82	276	8.36	213	6.45	15	184	5.58	7.3	0	0.00
3115	Widzew Łódź	42004	Ekstraklasa 22/23	22/23	32	35	1.09	47.95	1.50	-12.95	-0.40	63	1.97	39	1.22	24	0.75	124	3.88	190	5.94	121	3.78	435	13.59	270	8.44	165	5.16	18	173	5.41	8.9	0	0.00
3110	Górnik Zabrze	42004	Ekstraklasa 22/23	22/23	33	45	1.36	49.27	1.49	-4.27	-0.13	59	1.79	34	1.03	25	0.76	146	4.42	174	5.27	133	4.03	453	13.73	280	8.48	173	5.24	15	172	5.21	8.4	0	0.00
3113	Zagłębie Lubin	42004	Ekstraklasa 22/23	22/23	33	35	1.06	47.94	1.45	-12.94	-0.39	57	1.73	40	1.21	17	0.52	161	4.88	195	5.91	125	3.79	481	14.58	280	8.48	201	6.09	9	180	5.45	8.0	0	0.00
7691	Jagiellonia Białystok	42004	Ekstraklasa 22/23	22/23	32	46	1.44	45.16	1.41	0.84	0.03	58	1.81	34	1.06	24	0.75	132	4.13	157	4.91	99	3.09	388	12.13	248	7.75	140	4.38	11	120	3.75	7.2	0	0.00
5065	MKS Korona Kielce	42004	Ekstraklasa 22/23	22/23	32	38	1.19	45.13	1.41	-7.13	-0.22	53	1.66	31	0.97	22	0.69	149	4.66	188	5.88	109	3.41	446	13.94	257	8.03	189	5.91	13	179	5.59	6.0	0	0.00
4901	Cracovia	42004	Ekstraklasa 22/23	22/23	32	37	1.16	42.57	1.33	-5.57	-0.17	56	1.75	35	1.09	21	0.66	132	4.13	196	6.13	115	3.59	443	13.84	283	8.84	160	5.00	13	156	4.88	6.8	0	0.00
7295	Radomiak Radom	42004	Ekstraklasa 22/23	22/23	33	33	1.00	39.91	1.21	-6.91	-0.21	52	1.58	35	1.06	17	0.52	124	3.76	188	5.70	112	3.39	424	12.85	272	8.24	152	4.61	11	152	4.61	6.9	0	0.00
7918	Piast Gliwice	42004	Ekstraklasa 22/23	22/23	33	37	1.12	39.23	1.19	-2.23	-0.07	54	1.64	32	0.97	22	0.67	105	3.18	167	5.06	83	2.52	355	10.76	238	7.21	117	3.55	10	133	4.03	5.9	0	0.00
3122	Wisła Płock	42004	Ekstraklasa 22/23	22/23	32	34	1.06	37.08	1.16	-3.08	-0.10	47	1.47	28	0.88	19	0.59	117	3.66	157	4.91	110	3.44	384	12.00	225	7.03	159	4.97	10	145	4.53	6.8	0	0.00
7913	KS Lechia Gdańsk	42004	Ekstraklasa 22/23	22/23	33	29	0.88	36.90	1.12	-7.90	-0.24	38	1.15	17	0.52	21	0.64	109	3.30	163	4.94	107	3.24	379	11.48	232	7.03	147	4.45	9	154	4.67	6.8	0	0.00
7922	Warta Poznań	42004	Ekstraklasa 22/23	22/23	32	37	1.16	35.57	1.11	1.43	0.04	52	1.63	30	0.94	22	0.69	111	3.47	146	4.56	99	3.09	356	11.13	215	6.72	141	4.41	8	141	4.41	7.3	0	0.00
35330	Miedź Legnica	42004	Ekstraklasa 22/23	22/23	33	32	0.97	35.45	1.07	-3.45	-0.10	45	1.36	28	0.85	17	0.52	109	3.30	178	5.39	94	2.85	381	11.55	230	6.97	151	4.58	10	120	3.64	7.2	0	0.00
38732	Stal Mielec	42004	Ekstraklasa 22/23	22/23	33	34	1.03	34.79	1.05	-0.79	-0.02	44	1.33	24	0.73	20	0.61	110	3.33	152	4.61	110	3.33	372	11.27	209	6.33	163	4.94	5	129	3.91	6.8	0	0.00
3108	Śląsk Wrocław	42004	Ekstraklasa 22/23	22/23	33	35	1.06	33.95	1.03	1.05	0.03	49	1.48	31	0.94	18	0.55	124	3.76	152	4.61	79	2.39	355	10.76	200	6.06	155	4.70	7	142	4.30	10.1	0	0.00
3106	Legia Warszawa	37062	Ekstraklasa 21/22	21/22	33	45	1.36	0	0.00	45.00	1.36	61	1.85	37	1.12	24	0.73	146	4.42	180	5.45	127	3.85	453	13.73	283	8.58	170	5.15	14	207	6.27	8.7	0	0.00
3108	Śląsk Wrocław	37062	Ekstraklasa 21/22	21/22	33	40	1.21	0	0.00	40.00	1.21	55	1.67	33	1.00	22	0.67	142	4.30	182	5.52	117	3.55	441	13.36	227	6.88	214	6.48	14	154	4.67	8.6	0	0.00
3110	Górnik Zabrze	37062	Ekstraklasa 21/22	21/22	32	54	1.69	0	0.00	54.00	1.69	79	2.47	49	1.53	30	0.94	161	5.03	187	5.84	117	3.66	465	14.53	282	8.81	183	5.72	16	170	5.31	7.4	0	0.00
3111	Wisła Kraków	37062	Ekstraklasa 21/22	21/22	33	34	1.03	0	0.00	34.00	1.03	47	1.42	33	1.00	14	0.42	129	3.91	168	5.09	129	3.91	426	12.91	252	7.64	174	5.27	16	166	5.03	7.5	0	0.00
3113	Zagłębie Lubin	37062	Ekstraklasa 21/22	21/22	32	40	1.25	0	0.00	40.00	1.25	52	1.63	32	1.00	20	0.63	127	3.97	195	6.09	128	4.00	450	14.06	240	7.50	210	6.56	7	170	5.31	8.7	0	0.00
3117	Pogoń Szczecin	37062	Ekstraklasa 21/22	21/22	33	61	1.85	0	0.00	61.00	1.85	74	2.24	40	1.21	34	1.03	173	5.24	201	6.09	126	3.82	500	15.15	347	10.52	153	4.64	8	207	6.27	7.6	0	0.00
3121	Lech Poznań	37062	Ekstraklasa 21/22	21/22	32	64	2.00	0	0.00	64.00	2.00	84	2.63	46	1.44	38	1.19	203	6.34	227	7.09	154	4.81	584	18.25	350	10.94	234	7.31	16	211	6.59	7.5	0	0.00
3122	Wisła Płock	37062	Ekstraklasa 21/22	21/22	33	48	1.45	0	0.00	48.00	1.45	47	1.42	20	0.61	27	0.82	132	4.00	136	4.12	103	3.12	371	11.24	242	7.33	129	3.91	5	164	4.97	7.7	0	0.00
3125	Górnik Łęczna	37062	Ekstraklasa 21/22	21/22	32	27	0.84	0	0.00	27.00	0.84	35	1.09	20	0.63	15	0.47	99	3.09	130	4.06	93	2.91	322	10.06	192	6.00	130	4.06	6	128	4.00	7.4	0	0.00
4901	Cracovia	37062	Ekstraklasa 21/22	21/22	33	39	1.18	0	0.00	39.00	1.18	46	1.39	32	0.97	14	0.42	128	3.88	180	5.45	108	3.27	416	12.61	245	7.42	171	5.18	10	169	5.12	6.4	0	0.00
7295	Radomiak Radom	37062	Ekstraklasa 21/22	21/22	33	42	1.27	0	0.00	42.00	1.27	64	1.94	35	1.06	29	0.88	135	4.09	192	5.82	137	4.15	464	14.06	294	8.91	170	5.15	14	178	5.39	8.2	0	0.00
7691	Jagiellonia Białystok	37062	Ekstraklasa 21/22	21/22	33	38	1.15	0	0.00	38.00	1.15	43	1.30	25	0.76	18	0.55	136	4.12	168	5.09	106	3.21	410	12.42	249	7.55	161	4.88	7	170	5.15	7.2	0	0.00
7913	KS Lechia Gdańsk	37062	Ekstraklasa 21/22	21/22	33	51	1.55	0	0.00	51.00	1.55	73	2.21	46	1.39	27	0.82	152	4.61	200	6.06	118	3.58	470	14.24	293	8.88	177	5.36	13	211	6.39	7.8	0	0.00
7918	Piast Gliwice	37062	Ekstraklasa 21/22	21/22	32	41	1.28	0	0.00	41.00	1.28	54	1.69	27	0.84	27	0.84	115	3.59	170	5.31	94	2.94	379	11.84	249	7.78	130	4.06	8	143	4.47	6.1	0	0.00
7922	Warta Poznań	37062	Ekstraklasa 21/22	21/22	33	33	1.00	0	0.00	33.00	1.00	66	2.00	44	1.33	22	0.67	114	3.45	143	4.33	97	2.94	354	10.73	225	6.82	129	3.91	14	142	4.30	6.8	0	0.00
35268	Raków Częstochowa	37062	Ekstraklasa 21/22	21/22	33	57	1.73	0	0.00	57.00	1.73	84	2.55	49	1.48	35	1.06	184	5.58	201	6.09	103	3.12	488	14.79	332	10.06	156	4.73	11	203	6.15	9.5	0	0.00
36851	Bruk-Bet Termalica Nieciecza	37062	Ekstraklasa 21/22	21/22	33	35	1.06	0	0.00	35.00	1.06	56	1.70	33	1.00	23	0.70	117	3.55	190	5.76	110	3.33	417	12.64	258	7.82	159	4.82	15	164	4.97	6.2	0	0.00
38732	Stal Mielec	37062	Ekstraklasa 21/22	21/22	32	38	1.19	0	0.00	38.00	1.19	51	1.59	28	0.88	23	0.72	116	3.63	146	4.56	88	2.75	350	10.94	201	6.28	149	4.66	7	140	4.38	6.1	0	0.00
3106	Legia Warszawa	29222	Ekstraklasa 20/21	20/21	30	48	1.60	0	0.00	48.00	1.60	0	0.00	0	0.00	0	0.00	152	5.07	148	4.93	0	0.00	300	10.00	0	0.00	0	0.00	0	184	6.13	\N	0	0.00
3108	Śląsk Wrocław	29222	Ekstraklasa 20/21	20/21	30	36	1.20	0	0.00	36.00	1.20	0	0.00	0	0.00	0	0.00	127	4.23	134	4.47	0	0.00	261	8.70	0	0.00	0	0.00	0	132	4.40	\N	0	0.00
3110	Górnik Zabrze	29222	Ekstraklasa 20/21	20/21	30	31	1.03	0	0.00	31.00	1.03	0	0.00	0	0.00	0	0.00	133	4.43	143	4.77	0	0.00	276	9.20	0	0.00	0	0.00	0	169	5.63	\N	0	0.00
3111	Wisła Kraków	29222	Ekstraklasa 20/21	20/21	30	39	1.30	0	0.00	39.00	1.30	0	0.00	0	0.00	0	0.00	133	4.43	123	4.10	0	0.00	256	8.53	0	0.00	0	0.00	0	184	6.13	\N	0	0.00
3113	Zagłębie Lubin	29222	Ekstraklasa 20/21	20/21	30	38	1.27	0	0.00	38.00	1.27	0	0.00	0	0.00	0	0.00	120	4.00	137	4.57	0	0.00	257	8.57	0	0.00	0	0.00	0	147	4.90	\N	0	0.00
3117	Pogoń Szczecin	29222	Ekstraklasa 20/21	20/21	30	36	1.20	0	0.00	36.00	1.20	0	0.00	0	0.00	0	0.00	122	4.07	129	4.30	0	0.00	251	8.37	0	0.00	0	0.00	0	183	6.10	\N	0	0.00
3121	Lech Poznań	29222	Ekstraklasa 20/21	20/21	30	39	1.30	0	0.00	39.00	1.30	0	0.00	0	0.00	0	0.00	151	5.03	153	5.10	0	0.00	304	10.13	0	0.00	0	0.00	0	200	6.67	\N	0	0.00
3122	Wisła Płock	29222	Ekstraklasa 20/21	20/21	30	37	1.23	0	0.00	37.00	1.23	0	0.00	0	0.00	0	0.00	119	3.97	111	3.70	0	0.00	230	7.67	0	0.00	0	0.00	0	145	4.83	\N	0	0.00
4901	Cracovia	29222	Ekstraklasa 20/21	20/21	30	28	0.93	0	0.00	28.00	0.93	0	0.00	0	0.00	0	0.00	99	3.30	118	3.93	0	0.00	217	7.23	0	0.00	0	0.00	0	130	4.33	\N	0	0.00
7691	Jagiellonia Białystok	29222	Ekstraklasa 20/21	20/21	30	39	1.30	0	0.00	39.00	1.30	0	0.00	0	0.00	0	0.00	123	4.10	120	4.00	0	0.00	243	8.10	0	0.00	0	0.00	0	131	4.37	\N	0	0.00
7913	KS Lechia Gdańsk	29222	Ekstraklasa 20/21	20/21	30	40	1.33	0	0.00	40.00	1.33	0	0.00	0	0.00	0	0.00	109	3.63	134	4.47	0	0.00	243	8.10	0	0.00	0	0.00	0	159	5.30	\N	0	0.00
7918	Piast Gliwice	29222	Ekstraklasa 20/21	20/21	30	39	1.30	0	0.00	39.00	1.30	0	0.00	0	0.00	0	0.00	123	4.10	141	4.70	0	0.00	264	8.80	0	0.00	0	0.00	0	132	4.40	\N	0	0.00
7919	Podbeskidzie Bielsko-Biała	29222	Ekstraklasa 20/21	20/21	30	29	0.97	0	0.00	29.00	0.97	0	0.00	0	0.00	0	0.00	99	3.30	116	3.87	0	0.00	215	7.17	0	0.00	0	0.00	0	144	4.80	\N	0	0.00
7922	Warta Poznań	29222	Ekstraklasa 20/21	20/21	30	33	1.10	0	0.00	33.00	1.10	0	0.00	0	0.00	0	0.00	90	3.00	106	3.53	0	0.00	196	6.53	0	0.00	0	0.00	0	131	4.37	\N	0	0.00
35268	Raków Częstochowa	29222	Ekstraklasa 20/21	20/21	30	46	1.53	0	0.00	46.00	1.53	0	0.00	0	0.00	0	0.00	148	4.93	138	4.60	0	0.00	286	9.53	0	0.00	0	0.00	0	179	5.97	\N	0	0.00
38732	Stal Mielec	29222	Ekstraklasa 20/21	20/21	30	31	1.03	0	0.00	31.00	1.03	0	0.00	0	0.00	0	0.00	125	4.17	115	3.83	0	0.00	240	8.00	0	0.00	0	0.00	0	141	4.70	\N	0	0.00
3106	Legia Warszawa	23666	Ekstraklasa 19/20	19/20	37	70	1.89	0	0.00	70.00	1.89	0	0.00	0	0.00	0	0.00	230	6.22	214	5.78	0	0.00	444	12.00	0	0.00	0	0.00	0	208	5.62	\N	0	0.00
3108	Śląsk Wrocław	23666	Ekstraklasa 19/20	19/20	37	51	1.38	0	0.00	51.00	1.38	0	0.00	0	0.00	0	0.00	155	4.19	172	4.65	0	0.00	327	8.84	0	0.00	0	0.00	0	200	5.41	\N	0	0.00
3110	Górnik Zabrze	23666	Ekstraklasa 19/20	19/20	37	51	1.38	0	0.00	51.00	1.38	0	0.00	0	0.00	0	0.00	160	4.32	171	4.62	0	0.00	331	8.95	0	0.00	0	0.00	0	189	5.11	\N	0	0.00
3111	Wisła Kraków	23666	Ekstraklasa 19/20	19/20	37	44	1.19	0	0.00	44.00	1.19	0	0.00	0	0.00	0	0.00	143	3.86	163	4.41	0	0.00	306	8.27	0	0.00	0	0.00	0	176	4.76	\N	0	0.00
3113	Zagłębie Lubin	23666	Ekstraklasa 19/20	19/20	37	61	1.65	0	0.00	61.00	1.65	0	0.00	0	0.00	0	0.00	196	5.30	191	5.16	0	0.00	387	10.46	0	0.00	0	0.00	0	190	5.14	\N	0	0.00
3117	Pogoń Szczecin	23666	Ekstraklasa 19/20	19/20	37	37	1.00	0	0.00	37.00	1.00	0	0.00	0	0.00	0	0.00	158	4.27	194	5.24	0	0.00	352	9.51	0	0.00	0	0.00	0	176	4.76	\N	0	0.00
3121	Lech Poznań	23666	Ekstraklasa 19/20	19/20	37	70	1.89	0	0.00	70.00	1.89	0	0.00	0	0.00	0	0.00	226	6.11	203	5.49	0	0.00	429	11.59	0	0.00	0	0.00	0	245	6.62	\N	0	0.00
3122	Wisła Płock	23666	Ekstraklasa 19/20	19/20	37	45	1.22	0	0.00	45.00	1.22	0	0.00	0	0.00	0	0.00	152	4.11	163	4.41	0	0.00	315	8.51	0	0.00	0	0.00	0	190	5.14	\N	0	0.00
3123	ŁKS Łódź	23666	Ekstraklasa 19/20	19/20	37	33	0.89	0	0.00	33.00	0.89	0	0.00	0	0.00	0	0.00	162	4.38	192	5.19	0	0.00	354	9.57	0	0.00	0	0.00	0	178	4.81	\N	0	0.00
4901	Cracovia	23666	Ekstraklasa 19/20	19/20	37	49	1.32	0	0.00	49.00	1.32	0	0.00	0	0.00	0	0.00	174	4.70	181	4.89	0	0.00	355	9.59	0	0.00	0	0.00	0	213	5.76	\N	0	0.00
5064	MZKS Arka Gdynia	23666	Ekstraklasa 19/20	19/20	37	39	1.05	0	0.00	39.00	1.05	0	0.00	0	0.00	0	0.00	151	4.08	168	4.54	0	0.00	319	8.62	0	0.00	0	0.00	0	150	4.05	\N	0	0.00
5065	MKS Korona Kielce	23666	Ekstraklasa 19/20	19/20	37	29	0.78	0	0.00	29.00	0.78	0	0.00	0	0.00	0	0.00	163	4.41	182	4.92	0	0.00	345	9.32	0	0.00	0	0.00	0	188	5.08	\N	0	0.00
7691	Jagiellonia Białystok	23666	Ekstraklasa 19/20	19/20	37	48	1.30	0	0.00	48.00	1.30	0	0.00	0	0.00	0	0.00	173	4.68	186	5.03	0	0.00	359	9.70	0	0.00	0	0.00	0	223	6.03	\N	0	0.00
7913	KS Lechia Gdańsk	23666	Ekstraklasa 19/20	19/20	37	48	1.30	0	0.00	48.00	1.30	0	0.00	0	0.00	0	0.00	147	3.97	176	4.76	0	0.00	323	8.73	0	0.00	0	0.00	0	191	5.16	\N	0	0.00
7918	Piast Gliwice	23666	Ekstraklasa 19/20	19/20	37	41	1.11	0	0.00	41.00	1.11	0	0.00	0	0.00	0	0.00	174	4.70	185	5.00	0	0.00	359	9.70	0	0.00	0	0.00	0	183	4.95	\N	0	0.00
35268	Raków Częstochowa	23666	Ekstraklasa 19/20	19/20	37	51	1.38	0	0.00	51.00	1.38	0	0.00	0	0.00	0	0.00	178	4.81	206	5.57	0	0.00	384	10.38	0	0.00	0	0.00	0	188	5.08	\N	0	0.00
3106	Legia Warszawa	17361	Ekstraklasa 18/19	18/19	37	55	1.49	0	0.00	55.00	1.49	0	0.00	0	0.00	0	0.00	182	4.92	182	4.92	0	0.00	364	9.84	0	0.00	0	0.00	0	218	5.89	\N	0	0.00
3108	Śląsk Wrocław	17361	Ekstraklasa 18/19	18/19	37	49	1.32	0	0.00	49.00	1.32	0	0.00	0	0.00	0	0.00	148	4.00	190	5.14	0	0.00	338	9.14	0	0.00	0	0.00	0	210	5.68	\N	0	0.00
3110	Górnik Zabrze	17361	Ekstraklasa 18/19	18/19	37	48	1.30	0	0.00	48.00	1.30	0	0.00	0	0.00	0	0.00	188	5.08	179	4.84	0	0.00	367	9.92	0	0.00	0	0.00	0	164	4.43	\N	0	0.00
3111	Wisła Kraków	17361	Ekstraklasa 18/19	18/19	37	67	1.81	0	0.00	67.00	1.81	0	0.00	0	0.00	0	0.00	159	4.30	152	4.11	0	0.00	311	8.41	0	0.00	0	0.00	0	168	4.54	\N	0	0.00
3113	Zagłębie Lubin	17361	Ekstraklasa 18/19	18/19	37	57	1.54	0	0.00	57.00	1.54	0	0.00	0	0.00	0	0.00	162	4.38	139	3.76	0	0.00	301	8.14	0	0.00	0	0.00	0	184	4.97	\N	0	0.00
3117	Pogoń Szczecin	17361	Ekstraklasa 18/19	18/19	37	57	1.54	0	0.00	57.00	1.54	0	0.00	0	0.00	0	0.00	163	4.41	205	5.54	0	0.00	368	9.95	0	0.00	0	0.00	0	212	5.73	\N	0	0.00
3121	Lech Poznań	17361	Ekstraklasa 18/19	18/19	37	49	1.32	0	0.00	49.00	1.32	0	0.00	0	0.00	0	0.00	141	3.81	187	5.05	0	0.00	328	8.86	0	0.00	0	0.00	0	178	4.81	\N	0	0.00
3122	Wisła Płock	17361	Ekstraklasa 18/19	18/19	37	50	1.35	0	0.00	50.00	1.35	0	0.00	0	0.00	0	0.00	148	4.00	184	4.97	0	0.00	332	8.97	0	0.00	0	0.00	0	178	4.81	\N	0	0.00
4901	Cracovia	17361	Ekstraklasa 18/19	18/19	37	45	1.22	0	0.00	45.00	1.22	0	0.00	0	0.00	0	0.00	146	3.95	203	5.49	0	0.00	349	9.43	0	0.00	0	0.00	0	167	4.51	\N	0	0.00
5064	MZKS Arka Gdynia	17361	Ekstraklasa 18/19	18/19	37	49	1.32	0	0.00	49.00	1.32	0	0.00	0	0.00	0	0.00	167	4.51	147	3.97	0	0.00	314	8.49	0	0.00	0	0.00	0	186	5.03	\N	0	0.00
5065	MKS Korona Kielce	17361	Ekstraklasa 18/19	18/19	37	42	1.14	0	0.00	42.00	1.14	0	0.00	0	0.00	0	0.00	178	4.81	211	5.70	0	0.00	389	10.51	0	0.00	0	0.00	0	198	5.35	\N	0	0.00
7691	Jagiellonia Białystok	17361	Ekstraklasa 18/19	18/19	37	55	1.49	0	0.00	55.00	1.49	0	0.00	0	0.00	0	0.00	165	4.46	169	4.57	0	0.00	334	9.03	0	0.00	0	0.00	0	169	4.57	\N	0	0.00
7693	Zagłębie Sosnowiec	17361	Ekstraklasa 18/19	18/19	37	49	1.32	0	0.00	49.00	1.32	0	0.00	0	0.00	0	0.00	158	4.27	165	4.46	0	0.00	323	8.73	0	0.00	0	0.00	0	182	4.92	\N	0	0.00
7913	KS Lechia Gdańsk	17361	Ekstraklasa 18/19	18/19	37	54	1.46	0	0.00	54.00	1.46	0	0.00	0	0.00	0	0.00	156	4.22	186	5.03	0	0.00	342	9.24	0	0.00	0	0.00	0	171	4.62	\N	0	0.00
7918	Piast Gliwice	17361	Ekstraklasa 18/19	18/19	37	57	1.54	0	0.00	57.00	1.54	0	0.00	0	0.00	0	0.00	149	4.03	163	4.41	0	0.00	312	8.43	0	0.00	0	0.00	0	203	5.49	\N	0	0.00
35330	Miedź Legnica	17361	Ekstraklasa 18/19	18/19	37	40	1.08	0	0.00	40.00	1.08	0	0.00	0	0.00	0	0.00	171	4.62	190	5.14	0	0.00	361	9.76	0	0.00	0	0.00	0	179	4.84	\N	0	0.00
3106	Legia Warszawa	13350	Ekstraklasa 17/18	17/18	37	55	1.49	0	0.00	55.00	1.49	0	0.00	0	0.00	0	0.00	173	4.68	150	4.05	0	0.00	323	8.73	0	0.00	0	0.00	0	195	5.27	\N	0	0.00
3108	Śląsk Wrocław	13350	Ekstraklasa 17/18	17/18	37	50	1.35	0	0.00	50.00	1.35	0	0.00	0	0.00	0	0.00	140	3.78	159	4.30	0	0.00	299	8.08	0	0.00	0	0.00	0	155	4.19	\N	0	0.00
3110	Górnik Zabrze	13350	Ekstraklasa 17/18	17/18	36	65	1.81	0	0.00	65.00	1.81	0	0.00	0	0.00	0	0.00	181	5.03	168	4.67	0	0.00	349	9.69	0	0.00	0	0.00	0	183	5.08	\N	0	0.00
3111	Wisła Kraków	13350	Ekstraklasa 17/18	17/18	37	51	1.38	0	0.00	51.00	1.38	0	0.00	0	0.00	0	0.00	153	4.14	141	3.81	0	0.00	294	7.95	0	0.00	0	0.00	0	192	5.19	\N	0	0.00
3113	Zagłębie Lubin	13350	Ekstraklasa 17/18	17/18	37	45	1.22	0	0.00	45.00	1.22	0	0.00	0	0.00	0	0.00	150	4.05	178	4.81	0	0.00	328	8.86	0	0.00	0	0.00	0	195	5.27	\N	0	0.00
3117	Pogoń Szczecin	13350	Ekstraklasa 17/18	17/18	37	46	1.24	0	0.00	46.00	1.24	0	0.00	0	0.00	0	0.00	176	4.76	172	4.65	0	0.00	348	9.41	0	0.00	0	0.00	0	192	5.19	\N	0	0.00
3121	Lech Poznań	13350	Ekstraklasa 17/18	17/18	37	53	1.43	0	0.00	53.00	1.43	0	0.00	0	0.00	0	0.00	178	4.81	180	4.86	0	0.00	358	9.68	0	0.00	0	0.00	0	234	6.32	\N	0	0.00
3122	Wisła Płock	13350	Ekstraklasa 17/18	17/18	37	53	1.43	0	0.00	53.00	1.43	0	0.00	0	0.00	0	0.00	165	4.46	167	4.51	0	0.00	332	8.97	0	0.00	0	0.00	0	182	4.92	\N	0	0.00
4901	Cracovia	13350	Ekstraklasa 17/18	17/18	37	51	1.38	0	0.00	51.00	1.38	0	0.00	0	0.00	0	0.00	143	3.86	180	4.86	0	0.00	323	8.73	0	0.00	0	0.00	0	164	4.43	\N	0	0.00
5064	MZKS Arka Gdynia	13350	Ekstraklasa 17/18	17/18	37	46	1.24	0	0.00	46.00	1.24	0	0.00	0	0.00	0	0.00	144	3.89	164	4.43	0	0.00	308	8.32	0	0.00	0	0.00	0	198	5.35	\N	0	0.00
5065	MKS Korona Kielce	13350	Ekstraklasa 17/18	17/18	37	49	1.32	0	0.00	49.00	1.32	0	0.00	0	0.00	0	0.00	160	4.32	183	4.95	0	0.00	343	9.27	0	0.00	0	0.00	0	197	5.32	\N	0	0.00
7691	Jagiellonia Białystok	13350	Ekstraklasa 17/18	17/18	37	55	1.49	0	0.00	55.00	1.49	0	0.00	0	0.00	0	0.00	162	4.38	195	5.27	0	0.00	357	9.65	0	0.00	0	0.00	0	192	5.19	\N	0	0.00
7913	KS Lechia Gdańsk	13350	Ekstraklasa 17/18	17/18	37	46	1.24	0	0.00	46.00	1.24	0	0.00	0	0.00	0	0.00	137	3.70	133	3.59	0	0.00	270	7.30	0	0.00	0	0.00	0	180	4.86	\N	0	0.00
7918	Piast Gliwice	13350	Ekstraklasa 17/18	17/18	36	40	1.11	0	0.00	40.00	1.11	0	0.00	0	0.00	0	0.00	143	3.97	155	4.31	0	0.00	298	8.28	0	0.00	0	0.00	0	136	3.78	\N	0	0.00
36766	Sandecja Nowy Sącz	13350	Ekstraklasa 17/18	17/18	37	34	0.92	0	0.00	34.00	0.92	0	0.00	0	0.00	0	0.00	114	3.08	146	3.95	0	0.00	260	7.03	0	0.00	0	0.00	0	154	4.16	\N	0	0.00
36851	Bruk-Bet Termalica Nieciecza	13350	Ekstraklasa 17/18	17/18	37	39	1.05	0	0.00	39.00	1.05	0	0.00	0	0.00	0	0.00	130	3.51	179	4.84	0	0.00	309	8.35	0	0.00	0	0.00	0	173	4.68	\N	0	0.00
3105	Ruch Chorzów	11734	Ekstraklasa 16/17	16/17	37	42	1.14	0	0.00	42.00	1.14	0	0.00	0	0.00	0	0.00	137	3.70	140	3.78	0	0.00	277	7.49	0	0.00	0	0.00	0	179	4.84	\N	0	0.00
3106	Legia Warszawa	11734	Ekstraklasa 16/17	16/17	37	70	1.89	0	0.00	70.00	1.89	0	0.00	0	0.00	0	0.00	200	5.41	192	5.19	0	0.00	392	10.59	0	0.00	0	0.00	0	232	6.27	\N	0	0.00
3108	Śląsk Wrocław	11734	Ekstraklasa 16/17	16/17	37	49	1.32	0	0.00	49.00	1.32	0	0.00	0	0.00	0	0.00	142	3.84	162	4.38	0	0.00	304	8.22	0	0.00	0	0.00	0	159	4.30	\N	0	0.00
3111	Wisła Kraków	11734	Ekstraklasa 16/17	16/17	37	54	1.46	0	0.00	54.00	1.46	0	0.00	0	0.00	0	0.00	159	4.30	182	4.92	0	0.00	341	9.22	0	0.00	0	0.00	0	201	5.43	\N	0	0.00
3113	Zagłębie Lubin	11734	Ekstraklasa 16/17	16/17	37	51	1.38	0	0.00	51.00	1.38	0	0.00	0	0.00	0	0.00	170	4.59	191	5.16	0	0.00	361	9.76	0	0.00	0	0.00	0	207	5.59	\N	0	0.00
3117	Pogoń Szczecin	11734	Ekstraklasa 16/17	16/17	37	51	1.38	0	0.00	51.00	1.38	0	0.00	0	0.00	0	0.00	166	4.49	194	5.24	0	0.00	360	9.73	0	0.00	0	0.00	0	175	4.73	\N	0	0.00
3121	Lech Poznań	11734	Ekstraklasa 16/17	16/17	37	62	1.68	0	0.00	62.00	1.68	0	0.00	0	0.00	0	0.00	203	5.49	222	6.00	0	0.00	425	11.49	0	0.00	0	0.00	0	227	6.14	\N	0	0.00
3122	Wisła Płock	11734	Ekstraklasa 16/17	16/17	37	49	1.32	0	0.00	49.00	1.32	0	0.00	0	0.00	0	0.00	142	3.84	185	5.00	0	0.00	327	8.84	0	0.00	0	0.00	0	200	5.41	\N	0	0.00
3125	Górnik Łęczna	11734	Ekstraklasa 16/17	16/17	37	47	1.27	0	0.00	47.00	1.27	0	0.00	0	0.00	0	0.00	177	4.78	186	5.03	0	0.00	363	9.81	0	0.00	0	0.00	0	169	4.57	\N	0	0.00
4901	Cracovia	11734	Ekstraklasa 16/17	16/17	37	45	1.22	0	0.00	45.00	1.22	0	0.00	0	0.00	0	0.00	194	5.24	220	5.95	0	0.00	414	11.19	0	0.00	0	0.00	0	177	4.78	\N	0	0.00
5064	MZKS Arka Gdynia	11734	Ekstraklasa 16/17	16/17	37	44	1.19	0	0.00	44.00	1.19	0	0.00	0	0.00	0	0.00	155	4.19	163	4.41	0	0.00	318	8.59	0	0.00	0	0.00	0	177	4.78	\N	0	0.00
5065	MKS Korona Kielce	11734	Ekstraklasa 16/17	16/17	37	47	1.27	0	0.00	47.00	1.27	0	0.00	0	0.00	0	0.00	172	4.65	193	5.22	0	0.00	365	9.86	0	0.00	0	0.00	0	199	5.38	\N	0	0.00
7691	Jagiellonia Białystok	11734	Ekstraklasa 16/17	16/17	37	64	1.73	0	0.00	64.00	1.73	0	0.00	0	0.00	0	0.00	175	4.73	202	5.46	0	0.00	377	10.19	0	0.00	0	0.00	0	183	4.95	\N	0	0.00
7913	KS Lechia Gdańsk	11734	Ekstraklasa 16/17	16/17	37	57	1.54	0	0.00	57.00	1.54	0	0.00	0	0.00	0	0.00	172	4.65	164	4.43	0	0.00	336	9.08	0	0.00	0	0.00	0	208	5.62	\N	0	0.00
7918	Piast Gliwice	11734	Ekstraklasa 16/17	16/17	37	45	1.22	0	0.00	45.00	1.22	0	0.00	0	0.00	0	0.00	153	4.14	166	4.49	0	0.00	319	8.62	0	0.00	0	0.00	0	150	4.05	\N	0	0.00
36851	Bruk-Bet Termalica Nieciecza	11734	Ekstraklasa 16/17	16/17	37	35	0.95	0	0.00	35.00	0.95	0	0.00	0	0.00	0	0.00	141	3.81	177	4.78	0	0.00	318	8.59	0	0.00	0	0.00	0	175	4.73	\N	0	0.00
3105	Ruch Chorzów	10361	Ekstraklasa 15/16	15/16	35	38	1.09	0	0.00	38.00	1.09	0	0.00	0	0.00	0	0.00	149	4.26	147	4.20	0	0.00	296	8.46	0	0.00	0	0.00	0	170	4.86	\N	0	0.00
3106	Legia Warszawa	10361	Ekstraklasa 15/16	15/16	36	66	1.83	0	0.00	66.00	1.83	0	0.00	0	0.00	0	0.00	197	5.47	161	4.47	0	0.00	358	9.94	0	0.00	0	0.00	0	229	6.36	\N	0	0.00
3108	Śląsk Wrocław	10361	Ekstraklasa 15/16	15/16	36	40	1.11	0	0.00	40.00	1.11	0	0.00	0	0.00	0	0.00	187	5.19	180	5.00	0	0.00	367	10.19	0	0.00	0	0.00	0	182	5.06	\N	0	0.00
3110	Górnik Zabrze	10361	Ekstraklasa 15/16	15/16	36	37	1.03	0	0.00	37.00	1.03	0	0.00	0	0.00	0	0.00	139	3.86	189	5.25	0	0.00	328	9.11	0	0.00	0	0.00	0	192	5.33	\N	0	0.00
3111	Wisła Kraków	10361	Ekstraklasa 15/16	15/16	35	59	1.69	0	0.00	59.00	1.69	0	0.00	0	0.00	0	0.00	183	5.23	189	5.40	0	0.00	372	10.63	0	0.00	0	0.00	0	180	5.14	\N	0	0.00
3113	Zagłębie Lubin	10361	Ekstraklasa 15/16	15/16	35	54	1.54	0	0.00	54.00	1.54	0	0.00	0	0.00	0	0.00	168	4.80	176	5.03	0	0.00	344	9.83	0	0.00	0	0.00	0	185	5.29	\N	0	0.00
3117	Pogoń Szczecin	10361	Ekstraklasa 15/16	15/16	36	41	1.14	0	0.00	41.00	1.14	0	0.00	0	0.00	0	0.00	140	3.89	163	4.53	0	0.00	303	8.42	0	0.00	0	0.00	0	174	4.83	\N	0	0.00
3121	Lech Poznań	10361	Ekstraklasa 15/16	15/16	35	39	1.11	0	0.00	39.00	1.11	0	0.00	0	0.00	0	0.00	187	5.34	182	5.20	0	0.00	369	10.54	0	0.00	0	0.00	0	192	5.49	\N	0	0.00
3125	Górnik Łęczna	10361	Ekstraklasa 15/16	15/16	36	38	1.06	0	0.00	38.00	1.06	0	0.00	0	0.00	0	0.00	161	4.47	155	4.31	0	0.00	316	8.78	0	0.00	0	0.00	0	175	4.86	\N	0	0.00
4901	Cracovia	10361	Ekstraklasa 15/16	15/16	35	64	1.83	0	0.00	64.00	1.83	0	0.00	0	0.00	0	0.00	205	5.86	180	5.14	0	0.00	385	11.00	0	0.00	0	0.00	0	185	5.29	\N	0	0.00
5065	MKS Korona Kielce	10361	Ekstraklasa 15/16	15/16	35	34	0.97	0	0.00	34.00	0.97	0	0.00	0	0.00	0	0.00	155	4.43	188	5.37	0	0.00	343	9.80	0	0.00	0	0.00	0	160	4.57	\N	0	0.00
7691	Jagiellonia Białystok	10361	Ekstraklasa 15/16	15/16	35	42	1.20	0	0.00	42.00	1.20	0	0.00	0	0.00	0	0.00	182	5.20	177	5.06	0	0.00	359	10.26	0	0.00	0	0.00	0	194	5.54	\N	0	0.00
7913	KS Lechia Gdańsk	10361	Ekstraklasa 15/16	15/16	35	52	1.49	0	0.00	52.00	1.49	0	0.00	0	0.00	0	0.00	176	5.03	163	4.66	0	0.00	339	9.69	0	0.00	0	0.00	0	169	4.83	\N	0	0.00
7918	Piast Gliwice	10361	Ekstraklasa 15/16	15/16	35	59	1.69	0	0.00	59.00	1.69	0	0.00	0	0.00	0	0.00	174	4.97	171	4.89	0	0.00	345	9.86	0	0.00	0	0.00	0	194	5.54	\N	0	0.00
7919	Podbeskidzie Bielsko-Biała	10361	Ekstraklasa 15/16	15/16	36	44	1.22	0	0.00	44.00	1.22	0	0.00	0	0.00	0	0.00	158	4.39	181	5.03	0	0.00	339	9.42	0	0.00	0	0.00	0	165	4.58	\N	0	0.00
36851	Bruk-Bet Termalica Nieciecza	10361	Ekstraklasa 15/16	15/16	35	39	1.11	0	0.00	39.00	1.11	0	0.00	0	0.00	0	0.00	152	4.34	162	4.63	0	0.00	314	8.97	0	0.00	0	0.00	0	157	4.49	\N	0	0.00
3105	Ruch Chorzów	8206	Ekstraklasa 14/15	14/15	37	44	1.19	0	0.00	44.00	1.19	0	0.00	0	0.00	0	0.00	132	3.57	141	3.81	0	0.00	273	7.38	0	0.00	0	0.00	0	144	3.89	\N	0	0.00
3106	Legia Warszawa	8206	Ekstraklasa 14/15	14/15	37	64	1.73	0	0.00	64.00	1.73	0	0.00	0	0.00	0	0.00	196	5.30	185	5.00	0	0.00	381	10.30	0	0.00	0	0.00	0	234	6.32	\N	0	0.00
3108	Śląsk Wrocław	8206	Ekstraklasa 14/15	14/15	37	50	1.35	0	0.00	50.00	1.35	0	0.00	0	0.00	0	0.00	192	5.19	204	5.51	0	0.00	396	10.70	0	0.00	0	0.00	0	219	5.92	\N	0	0.00
3110	Górnik Zabrze	8206	Ekstraklasa 14/15	14/15	37	50	1.35	0	0.00	50.00	1.35	0	0.00	0	0.00	0	0.00	141	3.81	164	4.43	0	0.00	305	8.24	0	0.00	0	0.00	0	165	4.46	\N	0	0.00
3111	Wisła Kraków	8206	Ekstraklasa 14/15	14/15	37	56	1.51	0	0.00	56.00	1.51	0	0.00	0	0.00	0	0.00	172	4.65	191	5.16	0	0.00	363	9.81	0	0.00	0	0.00	0	169	4.57	\N	0	0.00
3117	Pogoń Szczecin	8206	Ekstraklasa 14/15	14/15	37	45	1.22	0	0.00	45.00	1.22	0	0.00	0	0.00	0	0.00	140	3.78	188	5.08	0	0.00	328	8.86	0	0.00	0	0.00	0	147	3.97	\N	0	0.00
3121	Lech Poznań	8206	Ekstraklasa 14/15	14/15	37	67	1.81	0	0.00	67.00	1.81	0	0.00	0	0.00	0	0.00	231	6.24	220	5.95	0	0.00	451	12.19	0	0.00	0	0.00	0	186	5.03	\N	0	0.00
3125	Górnik Łęczna	8206	Ekstraklasa 14/15	14/15	37	39	1.05	0	0.00	39.00	1.05	0	0.00	0	0.00	0	0.00	162	4.38	184	4.97	0	0.00	346	9.35	0	0.00	0	0.00	0	172	4.65	\N	0	0.00
3128	GKS Bełchatów	8206	Ekstraklasa 14/15	14/15	37	35	0.95	0	0.00	35.00	0.95	0	0.00	0	0.00	0	0.00	130	3.51	158	4.27	0	0.00	288	7.78	0	0.00	0	0.00	0	157	4.24	\N	0	0.00
4901	Cracovia	8206	Ekstraklasa 14/15	14/15	37	50	1.35	0	0.00	50.00	1.35	0	0.00	0	0.00	0	0.00	191	5.16	197	5.32	0	0.00	388	10.49	0	0.00	0	0.00	0	213	5.76	\N	0	0.00
5065	MKS Korona Kielce	8206	Ekstraklasa 14/15	14/15	37	44	1.19	0	0.00	44.00	1.19	0	0.00	0	0.00	0	0.00	142	3.84	171	4.62	0	0.00	313	8.46	0	0.00	0	0.00	0	188	5.08	\N	0	0.00
7691	Jagiellonia Białystok	8206	Ekstraklasa 14/15	14/15	37	59	1.59	0	0.00	59.00	1.59	0	0.00	0	0.00	0	0.00	169	4.57	174	4.70	0	0.00	343	9.27	0	0.00	0	0.00	0	157	4.24	\N	0	0.00
7913	KS Lechia Gdańsk	8206	Ekstraklasa 14/15	14/15	37	45	1.22	0	0.00	45.00	1.22	0	0.00	0	0.00	0	0.00	196	5.30	223	6.03	0	0.00	419	11.32	0	0.00	0	0.00	0	190	5.14	\N	0	0.00
7918	Piast Gliwice	8206	Ekstraklasa 14/15	14/15	37	50	1.35	0	0.00	50.00	1.35	0	0.00	0	0.00	0	0.00	144	3.89	178	4.81	0	0.00	322	8.70	0	0.00	0	0.00	0	176	4.76	\N	0	0.00
7919	Podbeskidzie Bielsko-Biała	8206	Ekstraklasa 14/15	14/15	37	47	1.27	0	0.00	47.00	1.27	0	0.00	0	0.00	0	0.00	174	4.70	187	5.05	0	0.00	361	9.76	0	0.00	0	0.00	0	189	5.11	\N	0	0.00
35329	Zawisza Bydgoszcz	8206	Ekstraklasa 14/15	14/15	37	45	1.22	0	0.00	45.00	1.22	0	0.00	0	0.00	0	0.00	166	4.49	163	4.41	0	0.00	329	8.89	0	0.00	0	0.00	0	163	4.41	\N	0	0.00
3105	Ruch Chorzów	6261	Ekstraklasa 13/14	13/14	37	47	1.27	0	0.00	47.00	1.27	0	0.00	0	0.00	0	0.00	104	2.81	128	3.46	0	0.00	232	6.27	0	0.00	0	0.00	0	130	3.51	\N	0	0.00
3106	Legia Warszawa	6261	Ekstraklasa 13/14	13/14	36	75	2.08	0	0.00	75.00	2.08	0	0.00	0	0.00	0	0.00	184	5.11	146	4.06	0	0.00	330	9.17	0	0.00	0	0.00	0	176	4.89	\N	0	0.00
3108	Śląsk Wrocław	6261	Ekstraklasa 13/14	13/14	37	49	1.32	0	0.00	49.00	1.32	0	0.00	0	0.00	0	0.00	120	3.24	142	3.84	0	0.00	262	7.08	0	0.00	0	0.00	0	144	3.89	\N	0	0.00
3110	Górnik Zabrze	6261	Ekstraklasa 13/14	13/14	37	53	1.43	0	0.00	53.00	1.43	0	0.00	0	0.00	0	0.00	115	3.11	132	3.57	0	0.00	247	6.68	0	0.00	0	0.00	0	137	3.70	\N	0	0.00
3111	Wisła Kraków	6261	Ekstraklasa 13/14	13/14	37	51	1.38	0	0.00	51.00	1.38	0	0.00	0	0.00	0	0.00	101	2.73	108	2.92	0	0.00	209	5.65	0	0.00	0	0.00	0	125	3.38	\N	0	0.00
3113	Zagłębie Lubin	6261	Ekstraklasa 13/14	13/14	37	32	0.86	0	0.00	32.00	0.86	0	0.00	0	0.00	0	0.00	125	3.38	160	4.32	0	0.00	285	7.70	0	0.00	0	0.00	0	120	3.24	\N	0	0.00
3115	Widzew Łódź	6261	Ekstraklasa 13/14	13/14	37	36	0.97	0	0.00	36.00	0.97	0	0.00	0	0.00	0	0.00	85	2.30	115	3.11	0	0.00	200	5.41	0	0.00	0	0.00	0	97	2.62	\N	0	0.00
3117	Pogoń Szczecin	6261	Ekstraklasa 13/14	13/14	37	50	1.35	0	0.00	50.00	1.35	0	0.00	0	0.00	0	0.00	121	3.27	125	3.38	0	0.00	246	6.65	0	0.00	0	0.00	0	163	4.41	\N	0	0.00
3121	Lech Poznań	6261	Ekstraklasa 13/14	13/14	37	68	1.84	0	0.00	68.00	1.84	0	0.00	0	0.00	0	0.00	149	4.03	160	4.32	0	0.00	309	8.35	0	0.00	0	0.00	0	160	4.32	\N	0	0.00
4901	Cracovia	6261	Ekstraklasa 13/14	13/14	37	43	1.16	0	0.00	43.00	1.16	0	0.00	0	0.00	0	0.00	112	3.03	136	3.68	0	0.00	248	6.70	0	0.00	0	0.00	0	98	2.65	\N	0	0.00
5065	MKS Korona Kielce	6261	Ekstraklasa 13/14	13/14	37	47	1.27	0	0.00	47.00	1.27	0	0.00	0	0.00	0	0.00	131	3.54	125	3.38	0	0.00	256	6.92	0	0.00	0	0.00	0	133	3.59	\N	0	0.00
7691	Jagiellonia Białystok	6261	Ekstraklasa 13/14	13/14	36	56	1.56	0	0.00	56.00	1.56	0	0.00	0	0.00	0	0.00	123	3.42	120	3.33	0	0.00	243	6.75	0	0.00	0	0.00	0	128	3.56	\N	0	0.00
7913	KS Lechia Gdańsk	6261	Ekstraklasa 13/14	13/14	37	46	1.24	0	0.00	46.00	1.24	0	0.00	0	0.00	0	0.00	126	3.41	163	4.41	0	0.00	289	7.81	0	0.00	0	0.00	0	136	3.68	\N	0	0.00
7918	Piast Gliwice	6261	Ekstraklasa 13/14	13/14	37	43	1.16	0	0.00	43.00	1.16	0	0.00	0	0.00	0	0.00	101	2.73	122	3.30	0	0.00	223	6.03	0	0.00	0	0.00	0	118	3.19	\N	0	0.00
7919	Podbeskidzie Bielsko-Biała	6261	Ekstraklasa 13/14	13/14	37	39	1.05	0	0.00	39.00	1.05	0	0.00	0	0.00	0	0.00	108	2.92	112	3.03	0	0.00	220	5.95	0	0.00	0	0.00	0	143	3.86	\N	0	0.00
35329	Zawisza Bydgoszcz	6261	Ekstraklasa 13/14	13/14	37	48	1.30	0	0.00	48.00	1.30	0	0.00	0	0.00	0	0.00	131	3.54	122	3.30	0	0.00	253	6.84	0	0.00	0	0.00	0	133	3.59	\N	0	0.00
3105	Ruch Chorzów	4634	Ekstraklasa 12/13	12/13	30	35	1.17	0	0.00	35.00	1.17	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3106	Legia Warszawa	4634	Ekstraklasa 12/13	12/13	30	59	1.97	0	0.00	59.00	1.97	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3108	Śląsk Wrocław	4634	Ekstraklasa 12/13	12/13	30	44	1.47	0	0.00	44.00	1.47	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3110	Górnik Zabrze	4634	Ekstraklasa 12/13	12/13	30	35	1.17	0	0.00	35.00	1.17	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3111	Wisła Kraków	4634	Ekstraklasa 12/13	12/13	30	28	0.93	0	0.00	28.00	0.93	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3113	Zagłębie Lubin	4634	Ekstraklasa 12/13	12/13	30	38	1.27	0	0.00	38.00	1.27	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3115	Widzew Łódź	4634	Ekstraklasa 12/13	12/13	30	30	1.00	0	0.00	30.00	1.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3117	Pogoń Szczecin	4634	Ekstraklasa 12/13	12/13	30	29	0.97	0	0.00	29.00	0.97	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3119	Polonia Warszawa	4634	Ekstraklasa 12/13	12/13	30	45	1.50	0	0.00	45.00	1.50	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3121	Lech Poznań	4634	Ekstraklasa 12/13	12/13	30	46	1.53	0	0.00	46.00	1.53	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3128	GKS Bełchatów	4634	Ekstraklasa 12/13	12/13	30	24	0.80	0	0.00	24.00	0.80	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
5065	MKS Korona Kielce	4634	Ekstraklasa 12/13	12/13	30	32	1.07	0	0.00	32.00	1.07	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
7691	Jagiellonia Białystok	4634	Ekstraklasa 12/13	12/13	30	31	1.03	0	0.00	31.00	1.03	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
7913	KS Lechia Gdańsk	4634	Ekstraklasa 12/13	12/13	30	42	1.40	0	0.00	42.00	1.40	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
7918	Piast Gliwice	4634	Ekstraklasa 12/13	12/13	30	41	1.37	0	0.00	41.00	1.37	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
7919	Podbeskidzie Bielsko-Biała	4634	Ekstraklasa 12/13	12/13	30	39	1.30	0	0.00	39.00	1.30	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3105	Ruch Chorzów	3411	Ekstraklasa 11/12	11/12	30	44	1.47	0	0.00	44.00	1.47	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3106	Legia Warszawa	3411	Ekstraklasa 11/12	11/12	30	42	1.40	0	0.00	42.00	1.40	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3108	Śląsk Wrocław	3411	Ekstraklasa 11/12	11/12	30	47	1.57	0	0.00	47.00	1.57	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3110	Górnik Zabrze	3411	Ekstraklasa 11/12	11/12	30	36	1.20	0	0.00	36.00	1.20	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3111	Wisła Kraków	3411	Ekstraklasa 11/12	11/12	30	29	0.97	0	0.00	29.00	0.97	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3113	Zagłębie Lubin	3411	Ekstraklasa 11/12	11/12	30	36	1.20	0	0.00	36.00	1.20	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3115	Widzew Łódź	3411	Ekstraklasa 11/12	11/12	30	25	0.83	0	0.00	25.00	0.83	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3119	Polonia Warszawa	3411	Ekstraklasa 11/12	11/12	30	33	1.10	0	0.00	33.00	1.10	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3121	Lech Poznań	3411	Ekstraklasa 11/12	11/12	30	42	1.40	0	0.00	42.00	1.40	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3123	ŁKS Łódź	3411	Ekstraklasa 11/12	11/12	30	23	0.77	0	0.00	23.00	0.77	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3128	GKS Bełchatów	3411	Ekstraklasa 11/12	11/12	30	34	1.13	0	0.00	34.00	1.13	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
4901	Cracovia	3411	Ekstraklasa 11/12	11/12	30	20	0.67	0	0.00	20.00	0.67	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
5065	MKS Korona Kielce	3411	Ekstraklasa 11/12	11/12	30	34	1.13	0	0.00	34.00	1.13	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
7691	Jagiellonia Białystok	3411	Ekstraklasa 11/12	11/12	30	35	1.17	0	0.00	35.00	1.17	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
7913	KS Lechia Gdańsk	3411	Ekstraklasa 11/12	11/12	30	21	0.70	0	0.00	21.00	0.70	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
7919	Podbeskidzie Bielsko-Biała	3411	Ekstraklasa 11/12	11/12	30	26	0.87	0	0.00	26.00	0.87	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3105	Ruch Chorzów	2737	Ekstraklasa 10/11	10/11	30	29	0.97	0	0.00	29.00	0.97	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3106	Legia Warszawa	2737	Ekstraklasa 10/11	10/11	30	45	1.50	0	0.00	45.00	1.50	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3108	Śląsk Wrocław	2737	Ekstraklasa 10/11	10/11	30	46	1.53	0	0.00	46.00	1.53	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3110	Górnik Zabrze	2737	Ekstraklasa 10/11	10/11	30	36	1.20	0	0.00	36.00	1.20	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3111	Wisła Kraków	2737	Ekstraklasa 10/11	10/11	30	44	1.47	0	0.00	44.00	1.47	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3113	Zagłębie Lubin	2737	Ekstraklasa 10/11	10/11	30	31	1.03	0	0.00	31.00	1.03	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3115	Widzew Łódź	2737	Ekstraklasa 10/11	10/11	30	41	1.37	0	0.00	41.00	1.37	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3119	Polonia Warszawa	2737	Ekstraklasa 10/11	10/11	30	41	1.37	0	0.00	41.00	1.37	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3121	Lech Poznań	2737	Ekstraklasa 10/11	10/11	30	37	1.23	0	0.00	37.00	1.23	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3128	GKS Bełchatów	2737	Ekstraklasa 10/11	10/11	30	31	1.03	0	0.00	31.00	1.03	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
4901	Cracovia	2737	Ekstraklasa 10/11	10/11	30	37	1.23	0	0.00	37.00	1.23	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
5064	MZKS Arka Gdynia	2737	Ekstraklasa 10/11	10/11	30	22	0.73	0	0.00	22.00	0.73	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
5065	MKS Korona Kielce	2737	Ekstraklasa 10/11	10/11	30	34	1.13	0	0.00	34.00	1.13	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
7691	Jagiellonia Białystok	2737	Ekstraklasa 10/11	10/11	30	38	1.27	0	0.00	38.00	1.27	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
7692	Polonia Bytom	2737	Ekstraklasa 10/11	10/11	30	29	0.97	0	0.00	29.00	0.97	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
7913	KS Lechia Gdańsk	2737	Ekstraklasa 10/11	10/11	30	37	1.23	0	0.00	37.00	1.23	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3105	Ruch Chorzów	2275	Ekstraklasa 09/10	09/10	30	40	1.33	0	0.00	40.00	1.33	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3106	Legia Warszawa	2275	Ekstraklasa 09/10	09/10	30	36	1.20	0	0.00	36.00	1.20	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3108	Śląsk Wrocław	2275	Ekstraklasa 09/10	09/10	30	32	1.07	0	0.00	32.00	1.07	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3111	Wisła Kraków	2275	Ekstraklasa 09/10	09/10	30	48	1.60	0	0.00	48.00	1.60	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3113	Zagłębie Lubin	2275	Ekstraklasa 09/10	09/10	30	30	1.00	0	0.00	30.00	1.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3114	MKS Odra Wodzisław Śląski	2275	Ekstraklasa 09/10	09/10	30	27	0.90	0	0.00	27.00	0.90	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3119	Polonia Warszawa	2275	Ekstraklasa 09/10	09/10	30	25	0.83	0	0.00	25.00	0.83	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3121	Lech Poznań	2275	Ekstraklasa 09/10	09/10	30	51	1.70	0	0.00	51.00	1.70	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3128	GKS Bełchatów	2275	Ekstraklasa 09/10	09/10	30	37	1.23	0	0.00	37.00	1.23	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
4901	Cracovia	2275	Ekstraklasa 09/10	09/10	30	25	0.83	0	0.00	25.00	0.83	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
5064	MZKS Arka Gdynia	2275	Ekstraklasa 09/10	09/10	30	28	0.93	0	0.00	28.00	0.93	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
5065	MKS Korona Kielce	2275	Ekstraklasa 09/10	09/10	30	35	1.17	0	0.00	35.00	1.17	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
7691	Jagiellonia Białystok	2275	Ekstraklasa 09/10	09/10	30	29	0.97	0	0.00	29.00	0.97	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
7692	Polonia Bytom	2275	Ekstraklasa 09/10	09/10	30	29	0.97	0	0.00	29.00	0.97	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
7913	KS Lechia Gdańsk	2275	Ekstraklasa 09/10	09/10	30	30	1.00	0	0.00	30.00	1.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
7918	Piast Gliwice	2275	Ekstraklasa 09/10	09/10	30	30	1.00	0	0.00	30.00	1.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3105	Ruch Chorzów	1691	Ekstraklasa 08/09	08/09	30	22	0.73	0	0.00	22.00	0.73	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3106	Legia Warszawa	1691	Ekstraklasa 08/09	08/09	30	52	1.73	0	0.00	52.00	1.73	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3108	Śląsk Wrocław	1691	Ekstraklasa 08/09	08/09	30	40	1.33	0	0.00	40.00	1.33	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3110	Górnik Zabrze	1691	Ekstraklasa 08/09	08/09	31	20	0.67	0	0.00	20.00	0.65	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3111	Wisła Kraków	1691	Ekstraklasa 08/09	08/09	30	53	1.77	0	0.00	53.00	1.77	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3114	MKS Odra Wodzisław Śląski	1691	Ekstraklasa 08/09	08/09	30	23	0.77	0	0.00	23.00	0.77	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3119	Polonia Warszawa	1691	Ekstraklasa 08/09	08/09	30	40	1.33	0	0.00	40.00	1.33	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3121	Lech Poznań	1691	Ekstraklasa 08/09	08/09	30	51	1.70	0	0.00	51.00	1.70	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3123	ŁKS Łódź	1691	Ekstraklasa 08/09	08/09	30	27	0.90	0	0.00	27.00	0.90	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
3128	GKS Bełchatów	1691	Ekstraklasa 08/09	08/09	30	40	1.33	0	0.00	40.00	1.33	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
4901	Cracovia	1691	Ekstraklasa 08/09	08/09	30	24	0.80	0	0.00	24.00	0.80	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
5064	MZKS Arka Gdynia	1691	Ekstraklasa 08/09	08/09	30	27	0.90	0	0.00	27.00	0.90	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
7691	Jagiellonia Białystok	1691	Ekstraklasa 08/09	08/09	30	28	0.93	0	0.00	28.00	0.93	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
7692	Polonia Bytom	1691	Ekstraklasa 08/09	08/09	30	30	1.00	0	0.00	30.00	1.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
7913	KS Lechia Gdańsk	1691	Ekstraklasa 08/09	08/09	30	30	1.00	0	0.00	30.00	1.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
7918	Piast Gliwice	1691	Ekstraklasa 08/09	08/09	31	17	0.57	0	0.00	17.00	0.55	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	\N	0	0.00
\.


--
-- Data for Name: mart_team_defense; Type: TABLE DATA; Schema: gold; Owner: airflow
--

COPY gold.mart_team_defense (team_id, team_name, season_id, season_name, season_year, matches_played, total_goals_conceded, goals_conceded_per_game, total_xga, xga_per_game, xga_difference, xga_difference_per_game, clean_sheets, clean_sheet_pct, total_saves, saves_per_game, total_tackles, tackles_per_game, avg_tackles_won_pct, total_interceptions, interceptions_per_game, total_clearances, clearances_per_game, total_blocked_shots, blocked_shots_per_game, total_ball_recoveries, ball_recoveries_per_game, avg_aerial_duels_pct, avg_ground_duels_pct, avg_duels_won_pct, total_errors_lead_to_goal, total_errors_lead_to_shot) FROM stdin;
3122	Wisła Płock	76477	Ekstraklasa 25/26	25/26	18	12	0.67	17.96	1.00	-5.96	-0.33	6	33.3	51	2.83	221	12.28	8.0	116	6.44	527	29.28	52	2.89	753	41.83	14.2	29.3	51.9	2	12
5065	MKS Korona Kielce	76477	Ekstraklasa 25/26	25/26	18	19	1.06	23.92	1.33	-4.92	-0.27	6	33.3	59	3.28	224	12.44	7.9	147	8.17	470	26.11	84	4.67	799	44.39	15.1	32.6	48.2	1	4
7918	Piast Gliwice	76477	Ekstraklasa 25/26	25/26	17	19	1.12	23.09	1.36	-4.09	-0.24	5	29.4	47	2.76	184	10.82	6.9	124	7.29	443	26.06	80	4.71	723	42.53	15.5	28.5	48.4	2	10
3106	Legia Warszawa	76477	Ekstraklasa 25/26	25/26	18	21	1.17	17.03	0.95	3.97	0.22	5	27.8	37	2.06	255	14.17	9.5	145	8.06	406	22.56	93	5.17	796	44.22	17.8	34.5	49.6	0	6
4901	Cracovia	76477	Ekstraklasa 25/26	25/26	18	21	1.17	20.28	1.13	0.72	0.04	8	44.4	46	2.56	247	13.72	9.1	172	9.56	522	29.00	55	3.06	719	39.94	17.5	32.6	49.7	0	3
7691	Jagiellonia Białystok	76477	Ekstraklasa 25/26	25/26	17	21	1.24	28.70	1.69	-7.70	-0.45	5	29.4	61	3.59	236	13.88	8.6	123	7.24	398	23.41	71	4.18	796	46.82	12.9	34.2	49.7	1	11
35268	Raków Częstochowa	76477	Ekstraklasa 25/26	25/26	18	23	1.28	19.05	1.06	3.95	0.22	4	22.2	35	1.94	221	12.28	7.9	125	6.94	420	23.33	67	3.72	781	43.39	17.1	36.0	51.8	0	5
3113	Zagłębie Lubin	76477	Ekstraklasa 25/26	25/26	18	24	1.33	24.56	1.36	-0.56	-0.03	5	27.8	53	2.94	281	15.61	8.8	181	10.06	643	35.72	55	3.06	805	44.72	21.3	31.9	51.8	2	7
3110	Górnik Zabrze	76477	Ekstraklasa 25/26	25/26	18	24	1.33	19.07	1.06	4.93	0.27	4	22.2	32	1.78	232	12.89	8.6	124	6.89	389	21.61	90	5.00	778	43.22	11.4	31.5	50.5	6	8
3121	Lech Poznań	76477	Ekstraklasa 25/26	25/26	17	26	1.53	19.28	1.13	6.72	0.40	4	23.5	41	2.41	188	11.06	7.4	88	5.18	374	22.00	83	4.88	677	39.82	13.4	30.3	50.3	4	7
3115	Widzew Łódź	76477	Ekstraklasa 25/26	25/26	18	28	1.56	25.27	1.40	2.73	0.15	4	22.2	44	2.44	255	14.17	9.6	125	6.94	509	28.28	64	3.56	760	42.22	12.5	35.8	50.5	5	10
7915	Motor Lublin	76477	Ekstraklasa 25/26	25/26	18	28	1.56	28.80	1.60	-0.80	-0.04	4	22.2	56	3.11	283	15.72	10.6	130	7.22	438	24.33	71	3.94	795	44.17	12.8	35.1	49.9	4	10
3112	GKS Katowice	76477	Ekstraklasa 25/26	25/26	17	28	1.65	29.36	1.73	-1.36	-0.08	3	17.6	45	2.65	236	13.88	8.2	116	6.82	544	32.00	56	3.29	729	42.88	18.5	30.8	52.2	1	7
7295	Radomiak Radom	76477	Ekstraklasa 25/26	25/26	18	30	1.67	22.51	1.25	7.49	0.42	3	16.7	41	2.28	237	13.17	8.3	110	6.11	556	30.89	66	3.67	646	35.89	17.5	33.3	50.3	4	4
5064	MZKS Arka Gdynia	76477	Ekstraklasa 25/26	25/26	18	32	1.78	34.30	1.91	-2.30	-0.13	4	22.2	48	2.67	234	13.00	7.5	134	7.44	501	27.83	47	2.61	641	35.61	15.2	31.4	49.2	4	10
3117	Pogoń Szczecin	76477	Ekstraklasa 25/26	25/26	18	32	1.78	29.16	1.62	2.84	0.16	1	5.6	77	4.28	208	11.56	7.6	139	7.72	508	28.22	87	4.83	767	42.61	13.8	26.7	47.2	3	8
36851	Bruk-Bet Termalica Nieciecza	76477	Ekstraklasa 25/26	25/26	18	35	1.94	30.52	1.70	4.48	0.25	3	16.7	72	4.00	261	14.50	9.2	126	7.00	497	27.61	59	3.28	772	42.89	17.3	32.6	50.1	5	5
7913	KS Lechia Gdańsk	76477	Ekstraklasa 25/26	25/26	18	37	2.06	24.76	1.38	12.24	0.68	2	11.1	47	2.61	291	16.17	10.2	148	8.22	479	26.61	57	3.17	780	43.33	15.1	31.2	48.8	4	2
35268	Raków Częstochowa	61236	Ekstraklasa 24/25	24/25	33	23	0.70	34.27	1.04	-11.27	-0.34	16	48.5	82	2.48	442	13.39	8.1	314	9.52	649	19.67	125	3.79	1490	45.15	17.4	33.6	50.2	2	4
3121	Lech Poznań	61236	Ekstraklasa 24/25	24/25	33	31	0.94	42.60	1.29	-11.60	-0.35	13	39.4	108	3.27	448	13.58	8.1	244	7.39	643	19.48	179	5.42	1570	47.58	11.7	32.0	50.1	5	10
7918	Piast Gliwice	61236	Ekstraklasa 24/25	24/25	33	35	1.06	39.11	1.19	-4.11	-0.12	11	33.3	85	2.58	426	12.91	7.9	259	7.85	828	25.09	115	3.48	1642	49.76	18.4	30.8	48.5	3	5
3110	Górnik Zabrze	61236	Ekstraklasa 24/25	24/25	32	35	1.09	41.35	1.29	-6.35	-0.20	10	31.3	76	2.38	511	15.97	10.2	299	9.34	725	22.66	148	4.63	1572	49.13	10.2	36.4	52.9	3	11
3117	Pogoń Szczecin	61236	Ekstraklasa 24/25	24/25	33	40	1.21	41.26	1.25	-1.26	-0.04	13	39.4	101	3.06	436	13.21	8.0	272	8.24	828	25.09	149	4.52	1515	45.91	14.9	28.0	50.7	4	9
5065	MKS Korona Kielce	61236	Ekstraklasa 24/25	24/25	33	42	1.27	48.64	1.47	-6.64	-0.20	8	24.2	90	2.73	562	17.03	10.5	308	9.33	895	27.12	128	3.88	1611	48.82	14.6	37.3	49.4	1	5
7691	Jagiellonia Białystok	61236	Ekstraklasa 24/25	24/25	33	42	1.27	49.03	1.49	-7.03	-0.21	10	30.3	102	3.09	491	14.88	9.2	289	8.76	772	23.39	124	3.76	1521	46.09	13.4	35.1	50.5	2	11
3106	Legia Warszawa	61236	Ekstraklasa 24/25	24/25	33	45	1.36	50.40	1.53	-5.40	-0.16	6	18.2	86	2.61	470	14.24	8.9	256	7.76	667	20.21	161	4.88	1677	50.82	15.5	34.4	49.8	10	18
3112	GKS Katowice	61236	Ekstraklasa 24/25	24/25	33	45	1.36	59.50	1.80	-14.50	-0.44	9	27.3	112	3.39	436	13.21	8.2	272	8.24	916	27.76	123	3.73	1578	47.82	15.8	29.7	49.0	6	6
3115	Widzew Łódź	61236	Ekstraklasa 24/25	24/25	33	48	1.45	56.27	1.71	-8.27	-0.25	8	24.2	91	2.76	493	14.94	9.1	288	8.73	817	24.76	123	3.73	1471	44.58	12.6	33.8	50.2	6	8
3113	Zagłębie Lubin	61236	Ekstraklasa 24/25	24/25	33	49	1.48	51.63	1.56	-2.63	-0.08	6	18.2	107	3.24	486	14.73	8.6	293	8.88	945	28.64	130	3.94	1626	49.27	17.8	31.2	48.8	3	13
7295	Radomiak Radom	61236	Ekstraklasa 24/25	24/25	33	51	1.55	48.69	1.48	2.31	0.07	5	15.2	86	2.61	549	16.64	9.8	324	9.82	899	27.24	121	3.67	1527	46.27	19.5	35.1	51.4	2	12
4901	Cracovia	61236	Ekstraklasa 24/25	24/25	33	52	1.58	48.30	1.46	3.70	0.11	6	18.2	95	2.88	477	14.45	8.7	265	8.03	842	25.52	120	3.64	1597	48.39	17.9	32.1	50.2	2	7
3108	Śląsk Wrocław	61236	Ekstraklasa 24/25	24/25	33	52	1.58	49.25	1.49	2.75	0.08	4	12.1	113	3.42	500	15.15	9.2	328	9.94	924	28.00	145	4.39	1626	49.27	16.5	34.3	49.3	7	7
38732	Stal Mielec	61236	Ekstraklasa 24/25	24/25	33	55	1.67	53.73	1.63	1.27	0.04	4	12.1	109	3.30	476	14.42	8.8	296	8.97	850	25.76	127	3.85	1564	47.39	15.6	30.9	50.5	8	19
7913	KS Lechia Gdańsk	61236	Ekstraklasa 24/25	24/25	32	56	1.75	60.96	1.91	-4.96	-0.16	6	18.8	93	2.91	505	15.78	9.6	294	9.19	798	24.94	123	3.84	1499	46.84	13.7	33.2	48.9	4	2
7915	Motor Lublin	61236	Ekstraklasa 24/25	24/25	32	57	1.78	55.61	1.74	1.39	0.04	6	18.8	118	3.69	440	13.75	8.7	272	8.50	751	23.47	115	3.59	1520	47.50	11.2	30.2	47.8	10	5
38729	Puszcza Niepołomice	61236	Ekstraklasa 24/25	24/25	32	59	1.84	62.29	1.95	-3.29	-0.10	6	18.8	119	3.72	541	16.91	10.6	334	10.44	936	29.25	109	3.41	1486	46.44	22.3	31.9	51.9	3	9
3108	Śląsk Wrocław	52176	Ekstraklasa 23/24	23/24	32	28	0.88	39.26	1.23	-11.26	-0.35	13	40.6	80	2.50	434	13.56	8.1	288	9.00	736	23.00	106	3.31	1730	54.06	15.0	34.0	51.2	0	2
7918	Piast Gliwice	52176	Ekstraklasa 23/24	23/24	32	33	1.03	34.88	1.09	-1.88	-0.06	13	40.6	68	2.13	420	13.13	8.6	241	7.53	573	17.91	114	3.56	1628	50.88	18.5	32.8	49.9	0	0
3117	Pogoń Szczecin	52176	Ekstraklasa 23/24	23/24	32	37	1.16	37.11	1.16	-0.11	0.00	10	31.3	85	2.66	360	11.25	7.5	309	9.66	619	19.34	153	4.78	1766	55.19	13.4	26.1	48.7	1	1
3110	Górnik Zabrze	52176	Ekstraklasa 23/24	23/24	32	37	1.16	47.44	1.48	-10.44	-0.33	10	31.3	96	3.00	453	14.16	8.7	289	9.03	701	21.91	112	3.50	1686	52.69	11.7	33.3	48.7	1	0
3106	Legia Warszawa	52176	Ekstraklasa 23/24	23/24	33	39	1.18	35.83	1.09	3.17	0.10	9	27.3	46	1.39	448	13.58	8.5	265	8.03	526	15.94	149	4.52	1720	52.12	15.1	34.4	51.8	0	0
35268	Raków Częstochowa	52176	Ekstraklasa 23/24	23/24	33	39	1.18	37.02	1.12	1.98	0.06	10	30.3	75	2.27	414	12.55	7.6	291	8.82	494	14.97	124	3.76	1859	56.33	14.1	35.5	50.0	1	1
3121	Lech Poznań	52176	Ekstraklasa 23/24	23/24	32	40	1.25	45.45	1.42	-5.45	-0.17	11	34.4	103	3.22	418	13.06	8.5	265	8.28	532	16.63	112	3.50	1725	53.91	11.2	32.5	48.8	0	0
7691	Jagiellonia Białystok	52176	Ekstraklasa 23/24	23/24	32	41	1.28	40.97	1.28	0.03	0.00	9	28.1	73	2.28	496	15.50	10.0	289	9.03	515	16.09	118	3.69	1690	52.81	12.0	37.2	52.6	0	0
5065	MKS Korona Kielce	52176	Ekstraklasa 23/24	23/24	33	43	1.30	45.15	1.37	-2.15	-0.07	7	21.2	85	2.58	577	17.48	11.3	313	9.48	614	18.61	141	4.27	1810	54.85	16.6	38.7	50.5	0	0
7922	Warta Poznań	52176	Ekstraklasa 23/24	23/24	32	42	1.31	46.18	1.44	-4.18	-0.13	8	25.0	95	2.97	504	15.75	10.0	338	10.56	736	23.00	90	2.81	1720	53.75	22.1	32.3	49.3	0	2
38729	Puszcza Niepołomice	52176	Ekstraklasa 23/24	23/24	32	42	1.31	52.76	1.65	-10.76	-0.34	8	25.0	114	3.56	489	15.28	10.1	309	9.66	818	25.56	98	3.06	1466	45.81	23.4	31.5	49.1	0	0
3115	Widzew Łódź	52176	Ekstraklasa 23/24	23/24	32	42	1.31	42.72	1.34	-0.72	-0.02	7	21.9	98	3.06	478	14.94	9.1	274	8.56	585	18.28	120	3.75	1715	53.59	14.2	31.7	50.5	0	1
4901	Cracovia	52176	Ekstraklasa 23/24	23/24	33	44	1.33	49.48	1.50	-5.48	-0.17	10	30.3	90	2.73	461	13.97	9.0	301	9.12	718	21.76	149	4.52	1750	53.03	19.5	31.1	52.4	1	2
38732	Stal Mielec	52176	Ekstraklasa 23/24	23/24	32	46	1.44	52.58	1.64	-6.58	-0.21	8	25.0	103	3.22	435	13.59	8.4	243	7.59	703	21.97	85	2.66	1778	55.56	14.1	31.0	48.6	0	0
3113	Zagłębie Lubin	52176	Ekstraklasa 23/24	23/24	32	48	1.50	48.55	1.52	-0.55	-0.02	9	28.1	102	3.19	398	12.44	7.5	337	10.53	572	17.88	130	4.06	1678	52.44	14.8	31.6	50.7	0	0
3105	Ruch Chorzów	52176	Ekstraklasa 23/24	23/24	32	53	1.66	54.68	1.71	-1.68	-0.05	7	21.9	98	3.06	461	14.41	8.8	307	9.59	719	22.47	125	3.91	1659	51.84	16.8	33.3	49.1	0	2
7295	Radomiak Radom	52176	Ekstraklasa 23/24	23/24	32	56	1.75	53.08	1.66	2.92	0.09	6	18.8	82	2.56	417	13.03	8.8	295	9.22	627	19.59	125	3.91	1644	51.38	18.4	33.7	50.7	1	0
3123	ŁKS Łódź	52176	Ekstraklasa 23/24	23/24	32	70	2.19	62.50	1.95	7.50	0.23	2	6.3	114	3.56	473	14.78	9.4	304	9.50	718	22.44	109	3.41	1706	53.31	12.9	35.6	47.3	1	1
35268	Raków Częstochowa	42004	Ekstraklasa 22/23	22/23	33	24	0.73	27.18	0.82	-3.18	-0.10	16	48.5	62	1.88	447	13.55	8.2	363	11.00	412	12.48	129	3.91	54	1.64	15.6	36.5	50.8	0	0
3121	Lech Poznań	42004	Ekstraklasa 22/23	22/23	33	27	0.82	37.90	1.15	-10.90	-0.33	16	48.5	77	2.33	467	14.15	8.8	323	9.79	445	13.48	140	4.24	55	1.67	10.9	35.7	49.5	0	0
7918	Piast Gliwice	42004	Ekstraklasa 22/23	22/23	33	30	0.91	32.01	0.97	-2.01	-0.06	10	30.3	75	2.27	489	14.82	9.4	341	10.33	628	19.03	83	2.52	0	0.00	18.3	34.8	50.8	0	0
7922	Warta Poznań	42004	Ekstraklasa 22/23	22/23	32	30	0.94	32.66	1.02	-2.66	-0.08	12	37.5	67	2.09	429	13.41	7.8	416	13.00	614	19.19	99	3.09	75	2.34	21.2	32.4	51.5	0	0
3106	Legia Warszawa	42004	Ekstraklasa 22/23	22/23	33	36	1.09	35.01	1.06	0.99	0.03	12	36.4	86	2.61	510	15.45	9.8	338	10.24	546	16.55	122	3.70	112	3.39	12.9	35.9	51.9	0	0
4901	Cracovia	42004	Ekstraklasa 22/23	22/23	32	35	1.09	44.54	1.39	-9.54	-0.30	10	31.3	81	2.53	444	13.88	8.1	344	10.75	652	20.38	115	3.59	59	1.84	18.3	31.1	50.6	0	0
38732	Stal Mielec	42004	Ekstraklasa 22/23	22/23	33	40	1.21	50.32	1.52	-10.32	-0.31	11	33.3	105	3.18	480	14.55	8.9	303	9.18	639	19.36	110	3.33	63	1.91	13.9	36.4	52.1	0	0
7295	Radomiak Radom	42004	Ekstraklasa 22/23	22/23	33	40	1.21	40.40	1.22	-0.40	-0.01	9	27.3	108	3.27	478	14.48	8.5	339	10.27	601	18.21	112	3.39	59	1.79	15.8	36.3	50.8	0	0
3110	Górnik Zabrze	42004	Ekstraklasa 22/23	22/23	33	41	1.24	42.20	1.28	-1.20	-0.04	11	33.3	105	3.18	560	16.97	10.4	417	12.64	541	16.39	133	4.03	119	3.61	13.8	36.3	49.9	0	0
3113	Zagłębie Lubin	42004	Ekstraklasa 22/23	22/23	33	44	1.33	50.27	1.52	-6.27	-0.19	8	24.2	85	2.58	450	13.64	8.0	324	9.82	688	20.85	125	3.79	50	1.52	13.8	32.5	48.7	0	0
3117	Pogoń Szczecin	42004	Ekstraklasa 22/23	22/23	33	45	1.36	44.99	1.36	0.01	0.00	8	24.2	77	2.33	473	14.33	9.2	312	9.45	516	15.64	150	4.55	115	3.48	12.2	34.5	50.2	0	0
3115	Widzew Łódź	42004	Ekstraklasa 22/23	22/23	32	45	1.41	45.28	1.42	-0.28	-0.01	11	34.4	98	3.06	433	13.53	7.6	334	10.44	695	21.72	121	3.78	51	1.59	13.8	32.9	49.2	0	0
5065	MKS Korona Kielce	42004	Ekstraklasa 22/23	22/23	32	45	1.41	48.83	1.53	-3.83	-0.12	8	25.0	90	2.81	495	15.47	9.2	379	11.84	718	22.44	109	3.41	49	1.53	14.3	33.3	48.0	0	0
3108	Śląsk Wrocław	42004	Ekstraklasa 22/23	22/23	33	48	1.45	40.09	1.21	7.91	0.24	5	15.2	84	2.55	460	13.94	8.4	349	10.58	598	18.12	79	2.39	49	1.48	13.6	36.1	50.5	0	0
7691	Jagiellonia Białystok	42004	Ekstraklasa 22/23	22/23	32	47	1.47	57.80	1.81	-10.80	-0.34	4	12.5	126	3.94	513	16.03	9.5	370	11.56	727	22.72	99	3.09	43	1.34	15.1	34.9	49.8	0	0
7913	KS Lechia Gdańsk	42004	Ekstraklasa 22/23	22/23	33	50	1.52	56.42	1.71	-6.42	-0.19	11	33.3	116	3.52	471	14.27	8.8	320	9.70	610	18.48	107	3.24	62	1.88	13.8	33.2	48.9	0	0
3122	Wisła Płock	42004	Ekstraklasa 22/23	22/23	32	50	1.56	58.05	1.81	-8.05	-0.25	5	15.6	121	3.78	501	15.66	10.0	291	9.09	636	19.88	110	3.44	61	1.91	12.5	34.8	49.5	0	0
35330	Miedź Legnica	42004	Ekstraklasa 22/23	22/23	33	54	1.64	56.70	1.72	-2.70	-0.08	4	12.1	131	3.97	510	15.45	8.8	416	12.61	686	20.79	94	2.85	67	2.03	15.6	32.9	47.3	0	0
3121	Lech Poznań	37062	Ekstraklasa 21/22	21/22	32	23	0.72	0	0.00	23.00	0.72	14	43.8	49	1.53	413	12.91	8.2	344	10.75	447	13.97	154	4.81	0	0.00	14.9	30.8	49.7	0	0
35268	Raków Częstochowa	37062	Ekstraklasa 21/22	21/22	33	28	0.85	0	0.00	28.00	0.85	14	42.4	80	2.42	450	13.64	8.0	377	11.42	526	15.94	103	3.12	0	0.00	17.4	38.4	51.9	0	0
3117	Pogoń Szczecin	37062	Ekstraklasa 21/22	21/22	33	31	0.94	0	0.00	31.00	0.94	9	27.3	79	2.39	481	14.58	9.3	370	11.21	583	17.67	126	3.82	0	0.00	15.6	34.4	50.3	0	0
7918	Piast Gliwice	37062	Ekstraklasa 21/22	21/22	32	34	1.06	0	0.00	34.00	1.06	10	31.3	79	2.47	492	15.38	9.0	393	12.28	711	22.22	94	2.94	0	0.00	17.7	35.4	51.2	0	0
7922	Warta Poznań	37062	Ekstraklasa 21/22	21/22	33	36	1.09	0	0.00	36.00	1.09	10	30.3	86	2.61	508	15.39	9.9	426	12.91	721	21.85	97	2.94	0	0.00	17.1	34.8	48.4	0	0
7913	KS Lechia Gdańsk	37062	Ekstraklasa 21/22	21/22	33	38	1.15	0	0.00	38.00	1.15	12	36.4	107	3.24	463	14.03	8.2	385	11.67	618	18.73	118	3.58	0	0.00	16.2	33.5	48.5	0	0
7295	Radomiak Radom	37062	Ekstraklasa 21/22	21/22	33	40	1.21	0	0.00	40.00	1.21	8	24.2	88	2.67	514	15.58	9.7	291	8.82	603	18.27	137	4.15	0	0.00	19.2	38.4	51.0	0	0
4901	Cracovia	37062	Ekstraklasa 21/22	21/22	33	41	1.24	0	0.00	41.00	1.24	10	30.3	79	2.39	567	17.18	10.2	347	10.52	677	20.52	108	3.27	0	0.00	16.8	36.8	50.2	0	0
3106	Legia Warszawa	37062	Ekstraklasa 21/22	21/22	33	48	1.45	0	0.00	48.00	1.45	7	21.2	91	2.76	556	16.85	10.2	418	12.67	482	14.61	127	3.85	0	0.00	16.7	40.3	51.6	0	0
7691	Jagiellonia Białystok	37062	Ekstraklasa 21/22	21/22	33	49	1.48	0	0.00	49.00	1.48	7	21.2	74	2.24	565	17.12	10.5	428	12.97	637	19.30	106	3.21	0	0.00	16.2	36.2	49.7	0	0
3122	Wisła Płock	37062	Ekstraklasa 21/22	21/22	33	50	1.52	0	0.00	50.00	1.52	9	27.3	127	3.85	547	16.58	10.0	364	11.03	689	20.88	103	3.12	0	0.00	15.8	38.5	49.4	0	0
3108	Śląsk Wrocław	37062	Ekstraklasa 21/22	21/22	33	50	1.52	0	0.00	50.00	1.52	5	15.2	108	3.27	510	15.45	9.5	386	11.70	630	19.09	117	3.55	0	0.00	15.1	36.5	49.6	0	0
38732	Stal Mielec	37062	Ekstraklasa 21/22	21/22	32	49	1.53	0	0.00	49.00	1.53	6	18.8	110	3.44	398	12.44	7.5	422	13.19	719	22.47	88	2.75	0	0.00	15.4	34.3	51.6	0	0
3110	Górnik Zabrze	37062	Ekstraklasa 21/22	21/22	32	50	1.56	0	0.00	50.00	1.56	6	18.8	81	2.53	487	15.22	8.7	426	13.31	566	17.69	117	3.66	0	0.00	15.2	34.5	50.9	0	0
3111	Wisła Kraków	37062	Ekstraklasa 21/22	21/22	33	54	1.64	0	0.00	54.00	1.64	7	21.2	119	3.61	540	16.36	9.5	351	10.64	592	17.94	129	3.91	0	0.00	14.4	34.8	47.7	0	0
36851	Bruk-Bet Termalica Nieciecza	37062	Ekstraklasa 21/22	21/22	33	55	1.67	0	0.00	55.00	1.67	5	15.2	126	3.82	434	13.15	7.9	392	11.88	649	19.67	110	3.33	0	0.00	15.3	33.4	51.7	0	0
3113	Zagłębie Lubin	37062	Ekstraklasa 21/22	21/22	32	55	1.72	0	0.00	55.00	1.72	8	25.0	119	3.72	486	15.19	8.6	342	10.69	722	22.56	128	4.00	0	0.00	16.2	34.6	47.4	0	0
3125	Górnik Łęczna	37062	Ekstraklasa 21/22	21/22	32	56	1.75	0	0.00	56.00	1.75	6	18.8	122	3.81	517	16.16	9.0	359	11.22	673	21.03	93	2.91	0	0.00	16.7	36.6	49.2	0	0
3117	Pogoń Szczecin	29222	Ekstraklasa 20/21	20/21	30	23	0.77	0	0.00	23.00	0.77	17	56.7	96	3.20	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3106	Legia Warszawa	29222	Ekstraklasa 20/21	20/21	30	24	0.80	0	0.00	24.00	0.80	15	50.0	67	2.23	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
35268	Raków Częstochowa	29222	Ekstraklasa 20/21	20/21	30	25	0.83	0	0.00	25.00	0.83	12	40.0	70	2.33	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3108	Śląsk Wrocław	29222	Ekstraklasa 20/21	20/21	30	32	1.07	0	0.00	32.00	1.07	9	30.0	93	3.10	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
4901	Cracovia	29222	Ekstraklasa 20/21	20/21	30	32	1.07	0	0.00	32.00	1.07	9	30.0	91	3.03	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7918	Piast Gliwice	29222	Ekstraklasa 20/21	20/21	30	32	1.07	0	0.00	32.00	1.07	12	40.0	87	2.90	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7922	Warta Poznań	29222	Ekstraklasa 20/21	20/21	30	32	1.07	0	0.00	32.00	1.07	11	36.7	80	2.67	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3110	Górnik Zabrze	29222	Ekstraklasa 20/21	20/21	30	33	1.10	0	0.00	33.00	1.10	9	30.0	76	2.53	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7913	KS Lechia Gdańsk	29222	Ekstraklasa 20/21	20/21	30	37	1.23	0	0.00	37.00	1.23	7	23.3	116	3.87	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3121	Lech Poznań	29222	Ekstraklasa 20/21	20/21	30	38	1.27	0	0.00	38.00	1.27	9	30.0	97	3.23	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3113	Zagłębie Lubin	29222	Ekstraklasa 20/21	20/21	30	40	1.33	0	0.00	40.00	1.33	7	23.3	92	3.07	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3111	Wisła Kraków	29222	Ekstraklasa 20/21	20/21	30	42	1.40	0	0.00	42.00	1.40	9	30.0	102	3.40	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3122	Wisła Płock	29222	Ekstraklasa 20/21	20/21	30	44	1.47	0	0.00	44.00	1.47	9	30.0	78	2.60	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
38732	Stal Mielec	29222	Ekstraklasa 20/21	20/21	30	47	1.57	0	0.00	47.00	1.57	5	16.7	81	2.70	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7691	Jagiellonia Białystok	29222	Ekstraklasa 20/21	20/21	30	48	1.60	0	0.00	48.00	1.60	4	13.3	106	3.53	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7919	Podbeskidzie Bielsko-Biała	29222	Ekstraklasa 20/21	20/21	30	60	2.00	0	0.00	60.00	2.00	4	13.3	90	3.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7918	Piast Gliwice	23666	Ekstraklasa 19/20	19/20	37	32	0.86	0	0.00	32.00	0.86	15	40.5	118	3.19	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3106	Legia Warszawa	23666	Ekstraklasa 19/20	19/20	37	35	0.95	0	0.00	35.00	0.95	14	37.8	91	2.46	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3121	Lech Poznań	23666	Ekstraklasa 19/20	19/20	37	35	0.95	0	0.00	35.00	0.95	14	37.8	120	3.24	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3117	Pogoń Szczecin	23666	Ekstraklasa 19/20	19/20	37	39	1.05	0	0.00	39.00	1.05	14	37.8	141	3.81	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
4901	Cracovia	23666	Ekstraklasa 19/20	19/20	37	40	1.08	0	0.00	40.00	1.08	11	29.7	98	2.65	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3108	Śląsk Wrocław	23666	Ekstraklasa 19/20	19/20	37	46	1.24	0	0.00	46.00	1.24	7	18.9	152	4.11	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3110	Górnik Zabrze	23666	Ekstraklasa 19/20	19/20	37	47	1.27	0	0.00	47.00	1.27	10	27.0	114	3.08	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
5065	MKS Korona Kielce	23666	Ekstraklasa 19/20	19/20	37	48	1.30	0	0.00	48.00	1.30	11	29.7	124	3.35	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7913	KS Lechia Gdańsk	23666	Ekstraklasa 19/20	19/20	37	50	1.35	0	0.00	50.00	1.35	9	24.3	148	4.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7691	Jagiellonia Białystok	23666	Ekstraklasa 19/20	19/20	37	51	1.38	0	0.00	51.00	1.38	11	29.7	109	2.95	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3113	Zagłębie Lubin	23666	Ekstraklasa 19/20	19/20	37	53	1.43	0	0.00	53.00	1.43	7	18.9	121	3.27	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3122	Wisła Płock	23666	Ekstraklasa 19/20	19/20	37	54	1.46	0	0.00	54.00	1.46	8	21.6	112	3.03	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
35268	Raków Częstochowa	23666	Ekstraklasa 19/20	19/20	37	56	1.51	0	0.00	56.00	1.51	9	24.3	139	3.76	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3111	Wisła Kraków	23666	Ekstraklasa 19/20	19/20	37	56	1.51	0	0.00	56.00	1.51	11	29.7	126	3.41	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
5064	MZKS Arka Gdynia	23666	Ekstraklasa 19/20	19/20	37	57	1.54	0	0.00	57.00	1.54	8	21.6	171	4.62	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3123	ŁKS Łódź	23666	Ekstraklasa 19/20	19/20	37	68	1.84	0	0.00	68.00	1.84	5	13.5	132	3.57	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7918	Piast Gliwice	17361	Ekstraklasa 18/19	18/19	37	33	0.89	0	0.00	33.00	0.89	16	43.2	105	2.84	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3106	Legia Warszawa	17361	Ekstraklasa 18/19	18/19	37	38	1.03	0	0.00	38.00	1.03	14	37.8	91	2.46	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7913	KS Lechia Gdańsk	17361	Ekstraklasa 18/19	18/19	37	38	1.03	0	0.00	38.00	1.03	18	48.6	103	2.78	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
4901	Cracovia	17361	Ekstraklasa 18/19	18/19	37	43	1.16	0	0.00	43.00	1.16	12	32.4	103	2.78	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3108	Śląsk Wrocław	17361	Ekstraklasa 18/19	18/19	37	45	1.22	0	0.00	45.00	1.22	10	27.0	94	2.54	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3113	Zagłębie Lubin	17361	Ekstraklasa 18/19	18/19	37	48	1.30	0	0.00	48.00	1.30	9	24.3	98	2.65	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3121	Lech Poznań	17361	Ekstraklasa 18/19	18/19	37	48	1.30	0	0.00	48.00	1.30	10	27.0	113	3.05	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
5064	MZKS Arka Gdynia	17361	Ekstraklasa 18/19	18/19	37	51	1.38	0	0.00	51.00	1.38	9	24.3	115	3.11	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7691	Jagiellonia Białystok	17361	Ekstraklasa 18/19	18/19	37	52	1.41	0	0.00	52.00	1.41	9	24.3	106	2.86	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3110	Górnik Zabrze	17361	Ekstraklasa 18/19	18/19	37	53	1.43	0	0.00	53.00	1.43	9	24.3	107	2.89	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
5065	MKS Korona Kielce	17361	Ekstraklasa 18/19	18/19	37	54	1.46	0	0.00	54.00	1.46	8	21.6	91	2.46	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3117	Pogoń Szczecin	17361	Ekstraklasa 18/19	18/19	37	54	1.46	0	0.00	54.00	1.46	10	27.0	89	2.41	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3122	Wisła Płock	17361	Ekstraklasa 18/19	18/19	37	58	1.57	0	0.00	58.00	1.57	6	16.2	94	2.54	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3111	Wisła Kraków	17361	Ekstraklasa 18/19	18/19	37	63	1.70	0	0.00	63.00	1.70	7	18.9	130	3.51	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
35330	Miedź Legnica	17361	Ekstraklasa 18/19	18/19	37	65	1.76	0	0.00	65.00	1.76	8	21.6	119	3.22	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7693	Zagłębie Sosnowiec	17361	Ekstraklasa 18/19	18/19	37	80	2.16	0	0.00	80.00	2.16	4	10.8	145	3.92	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3121	Lech Poznań	13350	Ekstraklasa 17/18	17/18	37	34	0.92	0	0.00	34.00	0.92	15	40.5	82	2.22	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3106	Legia Warszawa	13350	Ekstraklasa 17/18	17/18	37	35	0.95	0	0.00	35.00	0.95	15	40.5	117	3.16	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7691	Jagiellonia Białystok	13350	Ekstraklasa 17/18	17/18	37	41	1.11	0	0.00	41.00	1.11	14	37.8	88	2.38	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3113	Zagłębie Lubin	13350	Ekstraklasa 17/18	17/18	37	42	1.14	0	0.00	42.00	1.14	14	37.8	112	3.03	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3111	Wisła Kraków	13350	Ekstraklasa 17/18	17/18	37	42	1.14	0	0.00	42.00	1.14	13	35.1	120	3.24	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3122	Wisła Płock	13350	Ekstraklasa 17/18	17/18	37	45	1.22	0	0.00	45.00	1.22	11	29.7	86	2.32	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7918	Piast Gliwice	13350	Ekstraklasa 17/18	17/18	36	45	1.25	0	0.00	45.00	1.25	11	30.6	97	2.69	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
5064	MZKS Arka Gdynia	13350	Ekstraklasa 17/18	17/18	37	48	1.30	0	0.00	48.00	1.30	13	35.1	116	3.14	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
4901	Cracovia	13350	Ekstraklasa 17/18	17/18	37	52	1.41	0	0.00	52.00	1.41	8	21.6	118	3.19	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
36766	Sandecja Nowy Sącz	13350	Ekstraklasa 17/18	17/18	37	54	1.46	0	0.00	54.00	1.46	6	16.2	128	3.46	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
5065	MKS Korona Kielce	13350	Ekstraklasa 17/18	17/18	37	54	1.46	0	0.00	54.00	1.46	12	32.4	97	2.62	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3117	Pogoń Szczecin	13350	Ekstraklasa 17/18	17/18	37	54	1.46	0	0.00	54.00	1.46	10	27.0	82	2.22	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3108	Śląsk Wrocław	13350	Ekstraklasa 17/18	17/18	37	54	1.46	0	0.00	54.00	1.46	8	21.6	115	3.11	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3110	Górnik Zabrze	13350	Ekstraklasa 17/18	17/18	36	54	1.50	0	0.00	54.00	1.50	6	16.7	102	2.83	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7913	KS Lechia Gdańsk	13350	Ekstraklasa 17/18	17/18	37	58	1.57	0	0.00	58.00	1.57	8	21.6	111	3.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
36851	Bruk-Bet Termalica Nieciecza	13350	Ekstraklasa 17/18	17/18	37	66	1.78	0	0.00	66.00	1.78	5	13.5	105	2.84	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3121	Lech Poznań	11734	Ekstraklasa 16/17	16/17	37	29	0.78	0	0.00	29.00	0.78	20	54.1	108	2.92	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3106	Legia Warszawa	11734	Ekstraklasa 16/17	16/17	37	31	0.84	0	0.00	31.00	0.84	18	48.6	106	2.86	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7913	KS Lechia Gdańsk	11734	Ekstraklasa 16/17	16/17	37	37	1.00	0	0.00	37.00	1.00	14	37.8	126	3.41	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7691	Jagiellonia Białystok	11734	Ekstraklasa 16/17	16/17	37	39	1.05	0	0.00	39.00	1.05	14	37.8	79	2.14	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3113	Zagłębie Lubin	11734	Ekstraklasa 16/17	16/17	37	45	1.22	0	0.00	45.00	1.22	9	24.3	100	2.70	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3108	Śląsk Wrocław	11734	Ekstraklasa 16/17	16/17	37	52	1.41	0	0.00	52.00	1.41	11	29.7	123	3.32	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
4901	Cracovia	11734	Ekstraklasa 16/17	16/17	37	52	1.41	0	0.00	52.00	1.41	8	21.6	104	2.81	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3117	Pogoń Szczecin	11734	Ekstraklasa 16/17	16/17	37	54	1.46	0	0.00	54.00	1.46	6	16.2	88	2.38	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7918	Piast Gliwice	11734	Ekstraklasa 16/17	16/17	37	54	1.46	0	0.00	54.00	1.46	9	24.3	134	3.62	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
36851	Bruk-Bet Termalica Nieciecza	11734	Ekstraklasa 16/17	16/17	37	55	1.49	0	0.00	55.00	1.49	9	24.3	125	3.38	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3122	Wisła Płock	11734	Ekstraklasa 16/17	16/17	37	57	1.54	0	0.00	57.00	1.54	8	21.6	137	3.70	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3111	Wisła Kraków	11734	Ekstraklasa 16/17	16/17	37	57	1.54	0	0.00	57.00	1.54	8	21.6	127	3.43	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
5064	MZKS Arka Gdynia	11734	Ekstraklasa 16/17	16/17	37	60	1.62	0	0.00	60.00	1.62	9	24.3	105	2.84	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3105	Ruch Chorzów	11734	Ekstraklasa 16/17	16/17	37	62	1.68	0	0.00	62.00	1.68	7	18.9	123	3.32	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3125	Górnik Łęczna	11734	Ekstraklasa 16/17	16/17	37	63	1.70	0	0.00	63.00	1.70	10	27.0	146	3.95	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
5065	MKS Korona Kielce	11734	Ekstraklasa 16/17	16/17	37	65	1.76	0	0.00	65.00	1.76	8	21.6	116	3.14	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3106	Legia Warszawa	10361	Ekstraklasa 15/16	15/16	36	31	0.86	0	0.00	31.00	0.86	14	38.9	111	3.08	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3113	Zagłębie Lubin	10361	Ekstraklasa 15/16	15/16	35	39	1.11	0	0.00	39.00	1.11	11	31.4	106	3.03	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7913	KS Lechia Gdańsk	10361	Ekstraklasa 15/16	15/16	35	41	1.17	0	0.00	41.00	1.17	11	31.4	73	2.09	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3108	Śląsk Wrocław	10361	Ekstraklasa 15/16	15/16	36	42	1.17	0	0.00	42.00	1.17	8	22.2	137	3.81	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3117	Pogoń Szczecin	10361	Ekstraklasa 15/16	15/16	36	42	1.17	0	0.00	42.00	1.17	11	30.6	119	3.31	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
5065	MKS Korona Kielce	10361	Ekstraklasa 15/16	15/16	35	43	1.23	0	0.00	43.00	1.23	10	28.6	127	3.63	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7918	Piast Gliwice	10361	Ekstraklasa 15/16	15/16	35	43	1.23	0	0.00	43.00	1.23	13	37.1	125	3.57	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3111	Wisła Kraków	10361	Ekstraklasa 15/16	15/16	35	43	1.23	0	0.00	43.00	1.23	7	20.0	114	3.26	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3121	Lech Poznań	10361	Ekstraklasa 15/16	15/16	35	44	1.26	0	0.00	44.00	1.26	11	31.4	100	2.86	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
36851	Bruk-Bet Termalica Nieciecza	10361	Ekstraklasa 15/16	15/16	35	47	1.34	0	0.00	47.00	1.34	10	28.6	118	3.37	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3110	Górnik Zabrze	10361	Ekstraklasa 15/16	15/16	36	50	1.39	0	0.00	50.00	1.39	8	22.2	126	3.50	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
4901	Cracovia	10361	Ekstraklasa 15/16	15/16	35	49	1.40	0	0.00	49.00	1.40	9	25.7	96	2.74	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3125	Górnik Łęczna	10361	Ekstraklasa 15/16	15/16	36	53	1.47	0	0.00	53.00	1.47	9	25.0	103	2.86	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3105	Ruch Chorzów	10361	Ekstraklasa 15/16	15/16	35	58	1.66	0	0.00	58.00	1.66	9	25.7	133	3.80	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7691	Jagiellonia Białystok	10361	Ekstraklasa 15/16	15/16	35	59	1.69	0	0.00	59.00	1.69	9	25.7	83	2.37	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7919	Podbeskidzie Bielsko-Biała	10361	Ekstraklasa 15/16	15/16	36	62	1.72	0	0.00	62.00	1.72	8	22.2	168	4.67	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3121	Lech Poznań	8206	Ekstraklasa 14/15	14/15	37	33	0.89	0	0.00	33.00	0.89	13	35.1	94	2.54	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3106	Legia Warszawa	8206	Ekstraklasa 14/15	14/15	37	33	0.89	0	0.00	33.00	0.89	18	48.6	105	2.84	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3108	Śląsk Wrocław	8206	Ekstraklasa 14/15	14/15	37	43	1.16	0	0.00	43.00	1.16	11	29.7	101	2.73	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7691	Jagiellonia Białystok	8206	Ekstraklasa 14/15	14/15	37	44	1.19	0	0.00	44.00	1.19	11	29.7	159	4.30	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
4901	Cracovia	8206	Ekstraklasa 14/15	14/15	37	44	1.19	0	0.00	44.00	1.19	10	27.0	97	2.62	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3105	Ruch Chorzów	8206	Ekstraklasa 14/15	14/15	37	46	1.24	0	0.00	46.00	1.24	12	32.4	122	3.30	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3125	Górnik Łęczna	8206	Ekstraklasa 14/15	14/15	37	46	1.24	0	0.00	46.00	1.24	8	21.6	112	3.03	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7913	KS Lechia Gdańsk	8206	Ekstraklasa 14/15	14/15	37	47	1.27	0	0.00	47.00	1.27	12	32.4	86	2.32	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3111	Wisła Kraków	8206	Ekstraklasa 14/15	14/15	37	48	1.30	0	0.00	48.00	1.30	7	18.9	95	2.57	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3117	Pogoń Szczecin	8206	Ekstraklasa 14/15	14/15	37	52	1.41	0	0.00	52.00	1.41	7	18.9	137	3.70	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
5065	MKS Korona Kielce	8206	Ekstraklasa 14/15	14/15	37	55	1.49	0	0.00	55.00	1.49	6	16.2	113	3.05	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7918	Piast Gliwice	8206	Ekstraklasa 14/15	14/15	37	56	1.51	0	0.00	56.00	1.51	9	24.3	145	3.92	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3110	Górnik Zabrze	8206	Ekstraklasa 14/15	14/15	37	60	1.62	0	0.00	60.00	1.62	8	21.6	101	2.73	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3128	GKS Bełchatów	8206	Ekstraklasa 14/15	14/15	37	60	1.62	0	0.00	60.00	1.62	9	24.3	134	3.62	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7919	Podbeskidzie Bielsko-Biała	8206	Ekstraklasa 14/15	14/15	37	60	1.62	0	0.00	60.00	1.62	8	21.6	114	3.08	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
35329	Zawisza Bydgoszcz	8206	Ekstraklasa 14/15	14/15	37	63	1.70	0	0.00	63.00	1.70	8	21.6	102	2.76	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3106	Legia Warszawa	6261	Ekstraklasa 13/14	13/14	36	31	0.86	0	0.00	31.00	0.86	15	41.7	75	2.08	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3121	Lech Poznań	6261	Ekstraklasa 13/14	13/14	37	40	1.08	0	0.00	40.00	1.08	11	29.7	60	1.62	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3108	Śląsk Wrocław	6261	Ekstraklasa 13/14	13/14	37	41	1.11	0	0.00	41.00	1.11	15	40.5	72	1.95	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7913	KS Lechia Gdańsk	6261	Ekstraklasa 13/14	13/14	37	41	1.11	0	0.00	41.00	1.11	14	37.8	92	2.49	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7919	Podbeskidzie Bielsko-Biała	6261	Ekstraklasa 13/14	13/14	37	45	1.22	0	0.00	45.00	1.22	16	43.2	92	2.49	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3111	Wisła Kraków	6261	Ekstraklasa 13/14	13/14	37	46	1.24	0	0.00	46.00	1.24	15	40.5	104	2.81	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3105	Ruch Chorzów	6261	Ekstraklasa 13/14	13/14	37	48	1.30	0	0.00	48.00	1.30	11	29.7	67	1.81	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
35329	Zawisza Bydgoszcz	6261	Ekstraklasa 13/14	13/14	37	48	1.30	0	0.00	48.00	1.30	9	24.3	88	2.38	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3117	Pogoń Szczecin	6261	Ekstraklasa 13/14	13/14	37	50	1.35	0	0.00	50.00	1.35	9	24.3	75	2.03	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3113	Zagłębie Lubin	6261	Ekstraklasa 13/14	13/14	37	51	1.38	0	0.00	51.00	1.38	7	18.9	83	2.24	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
5065	MKS Korona Kielce	6261	Ekstraklasa 13/14	13/14	37	56	1.51	0	0.00	56.00	1.51	8	21.6	101	2.73	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
4901	Cracovia	6261	Ekstraklasa 13/14	13/14	37	56	1.51	0	0.00	56.00	1.51	7	18.9	91	2.46	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7918	Piast Gliwice	6261	Ekstraklasa 13/14	13/14	37	56	1.51	0	0.00	56.00	1.51	11	29.7	97	2.62	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3110	Górnik Zabrze	6261	Ekstraklasa 13/14	13/14	37	57	1.54	0	0.00	57.00	1.54	8	21.6	111	3.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3115	Widzew Łódź	6261	Ekstraklasa 13/14	13/14	37	59	1.59	0	0.00	59.00	1.59	4	10.8	80	2.16	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7691	Jagiellonia Białystok	6261	Ekstraklasa 13/14	13/14	36	58	1.61	0	0.00	58.00	1.61	7	19.4	85	2.36	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3106	Legia Warszawa	4634	Ekstraklasa 12/13	12/13	30	22	0.73	0	0.00	22.00	0.73	14	46.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3121	Lech Poznań	4634	Ekstraklasa 12/13	12/13	30	22	0.73	0	0.00	22.00	0.73	17	56.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3110	Górnik Zabrze	4634	Ekstraklasa 12/13	12/13	30	31	1.03	0	0.00	31.00	1.03	9	30.0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3119	Polonia Warszawa	4634	Ekstraklasa 12/13	12/13	30	34	1.13	0	0.00	34.00	1.13	7	23.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3111	Wisła Kraków	4634	Ekstraklasa 12/13	12/13	30	35	1.17	0	0.00	35.00	1.17	10	33.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
5065	MKS Korona Kielce	4634	Ekstraklasa 12/13	12/13	30	37	1.23	0	0.00	37.00	1.23	7	23.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3113	Zagłębie Lubin	4634	Ekstraklasa 12/13	12/13	30	37	1.23	0	0.00	37.00	1.23	10	33.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3128	GKS Bełchatów	4634	Ekstraklasa 12/13	12/13	30	38	1.27	0	0.00	38.00	1.27	8	26.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3117	Pogoń Szczecin	4634	Ekstraklasa 12/13	12/13	30	39	1.30	0	0.00	39.00	1.30	7	23.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3115	Widzew Łódź	4634	Ekstraklasa 12/13	12/13	30	41	1.37	0	0.00	41.00	1.37	8	26.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7918	Piast Gliwice	4634	Ekstraklasa 12/13	12/13	30	41	1.37	0	0.00	41.00	1.37	7	23.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3108	Śląsk Wrocław	4634	Ekstraklasa 12/13	12/13	30	42	1.40	0	0.00	42.00	1.40	8	26.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7919	Podbeskidzie Bielsko-Biała	4634	Ekstraklasa 12/13	12/13	30	43	1.43	0	0.00	43.00	1.43	4	13.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7913	KS Lechia Gdańsk	4634	Ekstraklasa 12/13	12/13	30	43	1.43	0	0.00	43.00	1.43	8	26.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7691	Jagiellonia Białystok	4634	Ekstraklasa 12/13	12/13	30	45	1.50	0	0.00	45.00	1.50	7	23.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3105	Ruch Chorzów	4634	Ekstraklasa 12/13	12/13	30	48	1.60	0	0.00	48.00	1.60	4	13.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3106	Legia Warszawa	3411	Ekstraklasa 11/12	11/12	30	17	0.57	0	0.00	17.00	0.57	17	56.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3121	Lech Poznań	3411	Ekstraklasa 11/12	11/12	30	22	0.73	0	0.00	22.00	0.73	16	53.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3111	Wisła Kraków	3411	Ekstraklasa 11/12	11/12	30	26	0.87	0	0.00	26.00	0.87	10	33.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3115	Widzew Łódź	3411	Ekstraklasa 11/12	11/12	30	26	0.87	0	0.00	26.00	0.87	13	43.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3105	Ruch Chorzów	3411	Ekstraklasa 11/12	11/12	30	28	0.93	0	0.00	28.00	0.93	10	33.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
5065	MKS Korona Kielce	3411	Ekstraklasa 11/12	11/12	30	29	0.97	0	0.00	29.00	0.97	14	46.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3110	Górnik Zabrze	3411	Ekstraklasa 11/12	11/12	30	30	1.00	0	0.00	30.00	1.00	10	33.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7913	KS Lechia Gdańsk	3411	Ekstraklasa 11/12	11/12	30	30	1.00	0	0.00	30.00	1.00	11	36.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3108	Śląsk Wrocław	3411	Ekstraklasa 11/12	11/12	30	31	1.03	0	0.00	31.00	1.03	11	36.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3119	Polonia Warszawa	3411	Ekstraklasa 11/12	11/12	30	32	1.07	0	0.00	32.00	1.07	10	33.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3128	GKS Bełchatów	3411	Ekstraklasa 11/12	11/12	30	36	1.20	0	0.00	36.00	1.20	7	23.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7919	Podbeskidzie Bielsko-Biała	3411	Ekstraklasa 11/12	11/12	30	39	1.30	0	0.00	39.00	1.30	10	33.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
4901	Cracovia	3411	Ekstraklasa 11/12	11/12	30	41	1.37	0	0.00	41.00	1.37	7	23.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3113	Zagłębie Lubin	3411	Ekstraklasa 11/12	11/12	30	42	1.40	0	0.00	42.00	1.40	8	26.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7691	Jagiellonia Białystok	3411	Ekstraklasa 11/12	11/12	30	45	1.50	0	0.00	45.00	1.50	6	20.0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3123	ŁKS Łódź	3411	Ekstraklasa 11/12	11/12	30	53	1.77	0	0.00	53.00	1.77	7	23.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3121	Lech Poznań	2737	Ekstraklasa 10/11	10/11	30	23	0.77	0	0.00	23.00	0.77	13	43.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3119	Polonia Warszawa	2737	Ekstraklasa 10/11	10/11	30	26	0.87	0	0.00	26.00	0.87	14	46.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3111	Wisła Kraków	2737	Ekstraklasa 10/11	10/11	30	29	0.97	0	0.00	29.00	0.97	14	46.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3105	Ruch Chorzów	2737	Ekstraklasa 10/11	10/11	30	32	1.07	0	0.00	32.00	1.07	13	43.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7691	Jagiellonia Białystok	2737	Ekstraklasa 10/11	10/11	30	32	1.07	0	0.00	32.00	1.07	13	43.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3128	GKS Bełchatów	2737	Ekstraklasa 10/11	10/11	30	33	1.10	0	0.00	33.00	1.10	12	40.0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3115	Widzew Łódź	2737	Ekstraklasa 10/11	10/11	30	34	1.13	0	0.00	34.00	1.13	6	20.0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3108	Śląsk Wrocław	2737	Ekstraklasa 10/11	10/11	30	34	1.13	0	0.00	34.00	1.13	11	36.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7913	KS Lechia Gdańsk	2737	Ekstraklasa 10/11	10/11	30	36	1.20	0	0.00	36.00	1.20	10	33.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3106	Legia Warszawa	2737	Ekstraklasa 10/11	10/11	30	38	1.27	0	0.00	38.00	1.27	10	33.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3113	Zagłębie Lubin	2737	Ekstraklasa 10/11	10/11	30	38	1.27	0	0.00	38.00	1.27	9	30.0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3110	Górnik Zabrze	2737	Ekstraklasa 10/11	10/11	30	40	1.33	0	0.00	40.00	1.33	9	30.0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
5064	MZKS Arka Gdynia	2737	Ekstraklasa 10/11	10/11	30	43	1.43	0	0.00	43.00	1.43	8	26.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7692	Polonia Bytom	2737	Ekstraklasa 10/11	10/11	30	45	1.50	0	0.00	45.00	1.50	7	23.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
4901	Cracovia	2737	Ekstraklasa 10/11	10/11	30	47	1.57	0	0.00	47.00	1.57	7	23.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
5065	MKS Korona Kielce	2737	Ekstraklasa 10/11	10/11	30	48	1.60	0	0.00	48.00	1.60	8	26.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3121	Lech Poznań	2275	Ekstraklasa 09/10	09/10	30	20	0.67	0	0.00	20.00	0.67	16	53.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3111	Wisła Kraków	2275	Ekstraklasa 09/10	09/10	30	20	0.67	0	0.00	20.00	0.67	11	36.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3106	Legia Warszawa	2275	Ekstraklasa 09/10	09/10	30	22	0.73	0	0.00	22.00	0.73	14	46.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7691	Jagiellonia Białystok	2275	Ekstraklasa 09/10	09/10	30	27	0.90	0	0.00	27.00	0.90	15	50.0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3128	GKS Bełchatów	2275	Ekstraklasa 09/10	09/10	30	27	0.90	0	0.00	27.00	0.90	12	40.0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3105	Ruch Chorzów	2275	Ekstraklasa 09/10	09/10	30	30	1.00	0	0.00	30.00	1.00	13	43.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7692	Polonia Bytom	2275	Ekstraklasa 09/10	09/10	30	31	1.03	0	0.00	31.00	1.03	9	30.0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7913	KS Lechia Gdańsk	2275	Ekstraklasa 09/10	09/10	30	32	1.07	0	0.00	32.00	1.07	9	30.0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3108	Śląsk Wrocław	2275	Ekstraklasa 09/10	09/10	30	33	1.10	0	0.00	33.00	1.10	9	30.0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3119	Polonia Warszawa	2275	Ekstraklasa 09/10	09/10	30	38	1.27	0	0.00	38.00	1.27	6	20.0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3113	Zagłębie Lubin	2275	Ekstraklasa 09/10	09/10	30	38	1.27	0	0.00	38.00	1.27	9	30.0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
4901	Cracovia	2275	Ekstraklasa 09/10	09/10	30	39	1.30	0	0.00	39.00	1.30	10	33.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
5064	MZKS Arka Gdynia	2275	Ekstraklasa 09/10	09/10	30	39	1.30	0	0.00	39.00	1.30	6	20.0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
5065	MKS Korona Kielce	2275	Ekstraklasa 09/10	09/10	30	41	1.37	0	0.00	41.00	1.37	8	26.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3114	MKS Odra Wodzisław Śląski	2275	Ekstraklasa 09/10	09/10	30	45	1.50	0	0.00	45.00	1.50	7	23.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7918	Piast Gliwice	2275	Ekstraklasa 09/10	09/10	30	50	1.67	0	0.00	50.00	1.67	6	20.0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3106	Legia Warszawa	1691	Ekstraklasa 08/09	08/09	30	17	0.57	0	0.00	17.00	0.57	17	56.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3111	Wisła Kraków	1691	Ekstraklasa 08/09	08/09	30	21	0.70	0	0.00	21.00	0.70	15	50.0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3119	Polonia Warszawa	1691	Ekstraklasa 08/09	08/09	30	23	0.77	0	0.00	23.00	0.77	16	53.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3121	Lech Poznań	1691	Ekstraklasa 08/09	08/09	30	24	0.80	0	0.00	24.00	0.80	14	46.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7918	Piast Gliwice	1691	Ekstraklasa 08/09	08/09	31	26	0.87	0	0.00	26.00	0.87	12	38.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3128	GKS Bełchatów	1691	Ekstraklasa 08/09	08/09	30	28	0.93	0	0.00	28.00	0.93	13	43.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3105	Ruch Chorzów	1691	Ekstraklasa 08/09	08/09	30	32	1.07	0	0.00	32.00	1.07	12	40.0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3110	Górnik Zabrze	1691	Ekstraklasa 08/09	08/09	31	33	1.10	0	0.00	33.00	1.10	11	35.5	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7691	Jagiellonia Białystok	1691	Ekstraklasa 08/09	08/09	30	34	1.13	0	0.00	34.00	1.13	9	30.0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3108	Śląsk Wrocław	1691	Ekstraklasa 08/09	08/09	30	34	1.13	0	0.00	34.00	1.13	7	23.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
5064	MZKS Arka Gdynia	1691	Ekstraklasa 08/09	08/09	30	39	1.30	0	0.00	39.00	1.30	8	26.7	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
4901	Cracovia	1691	Ekstraklasa 08/09	08/09	30	40	1.33	0	0.00	40.00	1.33	10	33.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3114	MKS Odra Wodzisław Śląski	1691	Ekstraklasa 08/09	08/09	30	40	1.33	0	0.00	40.00	1.33	10	33.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
3123	ŁKS Łódź	1691	Ekstraklasa 08/09	08/09	30	43	1.43	0	0.00	43.00	1.43	10	33.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7913	KS Lechia Gdańsk	1691	Ekstraklasa 08/09	08/09	30	44	1.47	0	0.00	44.00	1.47	7	23.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
7692	Polonia Bytom	1691	Ekstraklasa 08/09	08/09	30	46	1.53	0	0.00	46.00	1.53	7	23.3	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0
\.


--
-- Data for Name: mart_team_discipline; Type: TABLE DATA; Schema: gold; Owner: airflow
--

COPY gold.mart_team_discipline (team_id, team_name, season_id, season_name, season_year, matches_played, total_yellow_cards, yellow_cards_per_game, total_red_cards, total_fouls, fouls_per_game, total_offsides, offsides_per_game, total_free_kicks, free_kicks_per_game) FROM stdin;
7295	Radomiak Radom	76477	Ekstraklasa 25/26	25/26	18	43	2.39	0	259	14.39	26	1.44	226	12.56
35268	Raków Częstochowa	76477	Ekstraklasa 25/26	25/26	18	42	2.33	3	206	11.44	24	1.33	264	14.67
3115	Widzew Łódź	76477	Ekstraklasa 25/26	25/26	18	40	2.22	1	180	10.00	27	1.50	219	12.17
7915	Motor Lublin	76477	Ekstraklasa 25/26	25/26	18	40	2.22	2	227	12.61	36	2.00	216	12.00
3117	Pogoń Szczecin	76477	Ekstraklasa 25/26	25/26	18	39	2.17	0	215	11.94	33	1.83	192	10.67
7918	Piast Gliwice	76477	Ekstraklasa 25/26	25/26	17	39	2.29	3	202	11.88	26	1.53	209	12.29
7913	KS Lechia Gdańsk	76477	Ekstraklasa 25/26	25/26	18	39	2.17	1	199	11.06	13	0.72	163	9.06
4901	Cracovia	76477	Ekstraklasa 25/26	25/26	18	39	2.17	1	246	13.67	20	1.11	215	11.94
7691	Jagiellonia Białystok	76477	Ekstraklasa 25/26	25/26	17	38	2.24	0	194	11.41	38	2.24	239	14.06
5064	MZKS Arka Gdynia	76477	Ekstraklasa 25/26	25/26	18	38	2.11	1	234	13.00	25	1.39	227	12.61
3113	Zagłębie Lubin	76477	Ekstraklasa 25/26	25/26	18	36	2.00	1	237	13.17	30	1.67	221	12.28
3106	Legia Warszawa	76477	Ekstraklasa 25/26	25/26	18	34	1.89	1	265	14.72	16	0.89	213	11.83
5065	MKS Korona Kielce	76477	Ekstraklasa 25/26	25/26	18	33	1.83	2	205	11.39	32	1.78	212	11.78
3121	Lech Poznań	76477	Ekstraklasa 25/26	25/26	17	33	1.94	3	180	10.59	23	1.35	188	11.06
36851	Bruk-Bet Termalica Nieciecza	76477	Ekstraklasa 25/26	25/26	18	33	1.83	0	215	11.94	19	1.06	203	11.28
3122	Wisła Płock	76477	Ekstraklasa 25/26	25/26	18	29	1.61	0	186	10.33	21	1.17	192	10.67
3110	Górnik Zabrze	76477	Ekstraklasa 25/26	25/26	18	29	1.61	0	175	9.72	17	0.94	181	10.06
3112	GKS Katowice	76477	Ekstraklasa 25/26	25/26	17	26	1.53	0	211	12.41	29	1.71	207	12.18
38729	Puszcza Niepołomice	61236	Ekstraklasa 24/25	24/25	32	82	2.56	4	484	15.13	50	1.56	322	10.06
7295	Radomiak Radom	61236	Ekstraklasa 24/25	24/25	33	81	2.45	1	452	13.70	32	0.97	406	12.30
3106	Legia Warszawa	61236	Ekstraklasa 24/25	24/25	33	79	2.39	3	441	13.36	49	1.48	359	10.88
5065	MKS Korona Kielce	61236	Ekstraklasa 24/25	24/25	33	74	2.24	2	406	12.30	41	1.24	466	14.12
3108	Śląsk Wrocław	61236	Ekstraklasa 24/25	24/25	33	72	2.18	2	443	13.42	60	1.82	399	12.09
3115	Widzew Łódź	61236	Ekstraklasa 24/25	24/25	33	69	2.09	4	344	10.42	44	1.33	422	12.79
35268	Raków Częstochowa	61236	Ekstraklasa 24/25	24/25	33	68	2.06	5	401	12.15	52	1.58	395	11.97
7913	KS Lechia Gdańsk	61236	Ekstraklasa 24/25	24/25	32	67	2.09	1	364	11.38	30	0.94	332	10.38
7915	Motor Lublin	61236	Ekstraklasa 24/25	24/25	32	66	2.06	2	398	12.44	62	1.94	338	10.56
4901	Cracovia	61236	Ekstraklasa 24/25	24/25	33	65	1.97	2	378	11.45	47	1.42	388	11.76
3117	Pogoń Szczecin	61236	Ekstraklasa 24/25	24/25	33	65	1.97	5	375	11.36	41	1.24	326	9.88
7918	Piast Gliwice	61236	Ekstraklasa 24/25	24/25	33	65	1.97	2	408	12.36	64	1.94	441	13.36
3110	Górnik Zabrze	61236	Ekstraklasa 24/25	24/25	32	62	1.94	5	303	9.47	54	1.69	425	13.28
7691	Jagiellonia Białystok	61236	Ekstraklasa 24/25	24/25	33	61	1.85	2	395	11.97	56	1.70	438	13.27
38732	Stal Mielec	61236	Ekstraklasa 24/25	24/25	33	57	1.73	6	368	11.15	50	1.52	370	11.21
3113	Zagłębie Lubin	61236	Ekstraklasa 24/25	24/25	33	57	1.73	2	377	11.42	38	1.15	337	10.21
3121	Lech Poznań	61236	Ekstraklasa 24/25	24/25	33	52	1.58	2	397	12.03	61	1.85	403	12.21
3112	GKS Katowice	61236	Ekstraklasa 24/25	24/25	33	48	1.45	1	352	10.67	65	1.97	373	11.30
38729	Puszcza Niepołomice	52176	Ekstraklasa 23/24	23/24	32	93	2.91	4	505	15.78	53	1.66	364	11.38
7295	Radomiak Radom	52176	Ekstraklasa 23/24	23/24	32	86	2.69	7	422	13.19	48	1.50	452	14.13
3106	Legia Warszawa	52176	Ekstraklasa 23/24	23/24	33	83	2.52	5	438	13.27	58	1.76	456	13.82
3123	ŁKS Łódź	52176	Ekstraklasa 23/24	23/24	32	82	2.56	5	450	14.06	45	1.41	404	12.63
3115	Widzew Łódź	52176	Ekstraklasa 23/24	23/24	32	74	2.31	3	368	11.50	52	1.63	343	10.72
7922	Warta Poznań	52176	Ekstraklasa 23/24	23/24	32	73	2.28	2	488	15.25	40	1.25	354	11.06
35268	Raków Częstochowa	52176	Ekstraklasa 23/24	23/24	33	72	2.18	3	447	13.55	56	1.70	445	13.48
3108	Śląsk Wrocław	52176	Ekstraklasa 23/24	23/24	32	71	2.22	4	363	11.34	43	1.34	384	12.00
5065	MKS Korona Kielce	52176	Ekstraklasa 23/24	23/24	33	69	2.09	1	440	13.33	56	1.70	452	13.70
7918	Piast Gliwice	52176	Ekstraklasa 23/24	23/24	32	69	2.16	3	406	12.69	44	1.38	420	13.13
3105	Ruch Chorzów	52176	Ekstraklasa 23/24	23/24	32	68	2.13	5	408	12.75	35	1.09	412	12.88
4901	Cracovia	52176	Ekstraklasa 23/24	23/24	33	68	2.06	3	431	13.06	50	1.52	346	10.48
3110	Górnik Zabrze	52176	Ekstraklasa 23/24	23/24	32	67	2.09	7	417	13.03	25	0.78	396	12.38
3121	Lech Poznań	52176	Ekstraklasa 23/24	23/24	32	66	2.06	3	403	12.59	57	1.78	380	11.88
3117	Pogoń Szczecin	52176	Ekstraklasa 23/24	23/24	32	65	2.03	2	349	10.91	38	1.19	294	9.19
7691	Jagiellonia Białystok	52176	Ekstraklasa 23/24	23/24	32	64	2.00	2	373	11.66	65	2.03	448	14.00
38732	Stal Mielec	52176	Ekstraklasa 23/24	23/24	32	61	1.91	4	371	11.59	34	1.06	350	10.94
3113	Zagłębie Lubin	52176	Ekstraklasa 23/24	23/24	32	59	1.84	6	349	10.91	51	1.59	407	12.72
35330	Miedź Legnica	42004	Ekstraklasa 22/23	22/23	33	98	2.97	4	460	13.94	71	2.15	346	10.48
3110	Górnik Zabrze	42004	Ekstraklasa 22/23	22/23	33	90	2.73	2	449	13.61	70	2.12	366	11.09
7691	Jagiellonia Białystok	42004	Ekstraklasa 22/23	22/23	32	88	2.75	6	430	13.44	81	2.53	382	11.94
7295	Radomiak Radom	42004	Ekstraklasa 22/23	22/23	33	82	2.48	3	433	13.12	45	1.36	501	15.18
3106	Legia Warszawa	42004	Ekstraklasa 22/23	22/23	33	80	2.42	3	396	12.00	64	1.94	440	13.33
5065	MKS Korona Kielce	42004	Ekstraklasa 22/23	22/23	32	80	2.50	3	458	14.31	46	1.44	380	11.88
3108	Śląsk Wrocław	42004	Ekstraklasa 22/23	22/23	33	79	2.39	4	395	11.97	43	1.30	400	12.12
35268	Raków Częstochowa	42004	Ekstraklasa 22/23	22/23	33	77	2.33	3	463	14.03	62	1.88	443	13.42
3121	Lech Poznań	42004	Ekstraklasa 22/23	22/23	33	73	2.21	2	442	13.39	45	1.36	403	12.21
3117	Pogoń Szczecin	42004	Ekstraklasa 22/23	22/23	33	70	2.12	1	382	11.58	48	1.45	341	10.33
4901	Cracovia	42004	Ekstraklasa 22/23	22/23	32	70	2.19	3	395	12.34	36	1.13	335	10.47
7922	Warta Poznań	42004	Ekstraklasa 22/23	22/23	32	69	2.16	1	416	13.00	47	1.47	380	11.88
7913	KS Lechia Gdańsk	42004	Ekstraklasa 22/23	22/23	33	69	2.09	1	383	11.61	73	2.21	378	11.45
3122	Wisła Płock	42004	Ekstraklasa 22/23	22/23	32	67	2.09	4	384	12.00	72	2.25	400	12.50
7918	Piast Gliwice	42004	Ekstraklasa 22/23	22/23	33	63	1.91	2	421	12.76	57	1.73	442	13.39
38732	Stal Mielec	42004	Ekstraklasa 22/23	22/23	33	58	1.76	3	397	12.03	44	1.33	497	15.06
3113	Zagłębie Lubin	42004	Ekstraklasa 22/23	22/23	33	49	1.48	2	405	12.27	39	1.18	363	11.00
3115	Widzew Łódź	42004	Ekstraklasa 22/23	22/23	32	46	1.44	0	365	11.41	57	1.78	339	10.59
3106	Legia Warszawa	37062	Ekstraklasa 21/22	21/22	33	94	2.85	5	493	14.94	44	1.33	496	15.03
3122	Wisła Płock	37062	Ekstraklasa 21/22	21/22	33	93	2.82	5	487	14.76	46	1.39	479	14.52
7691	Jagiellonia Białystok	37062	Ekstraklasa 21/22	21/22	33	85	2.58	3	512	15.52	72	2.18	395	11.97
3113	Zagłębie Lubin	37062	Ekstraklasa 21/22	21/22	32	82	2.56	4	473	14.78	46	1.44	348	10.88
36851	Bruk-Bet Termalica Nieciecza	37062	Ekstraklasa 21/22	21/22	33	78	2.36	1	432	13.09	56	1.70	472	14.30
38732	Stal Mielec	37062	Ekstraklasa 21/22	21/22	32	75	2.34	3	366	11.44	53	1.66	523	16.34
35268	Raków Częstochowa	37062	Ekstraklasa 21/22	21/22	33	75	2.27	4	444	13.45	58	1.76	514	15.58
7913	KS Lechia Gdańsk	37062	Ekstraklasa 21/22	21/22	33	73	2.21	1	495	15.00	56	1.70	401	12.15
4901	Cracovia	37062	Ekstraklasa 21/22	21/22	33	71	2.15	2	499	15.12	81	2.45	444	13.45
7295	Radomiak Radom	37062	Ekstraklasa 21/22	21/22	33	71	2.15	4	449	13.61	51	1.55	487	14.76
3108	Śląsk Wrocław	37062	Ekstraklasa 21/22	21/22	33	71	2.15	5	455	13.79	63	1.91	420	12.73
3125	Górnik Łęczna	37062	Ekstraklasa 21/22	21/22	32	70	2.19	4	449	14.03	51	1.59	426	13.31
7922	Warta Poznań	37062	Ekstraklasa 21/22	21/22	33	68	2.06	2	514	15.58	58	1.76	428	12.97
3111	Wisła Kraków	37062	Ekstraklasa 21/22	21/22	33	65	1.97	3	457	13.85	64	1.94	371	11.24
3110	Górnik Zabrze	37062	Ekstraklasa 21/22	21/22	32	64	2.00	1	415	12.97	58	1.81	386	12.06
3117	Pogoń Szczecin	37062	Ekstraklasa 21/22	21/22	33	62	1.88	3	385	11.67	59	1.79	417	12.64
3121	Lech Poznań	37062	Ekstraklasa 21/22	21/22	32	50	1.56	1	406	12.69	49	1.53	341	10.66
7918	Piast Gliwice	37062	Ekstraklasa 21/22	21/22	32	49	1.53	0	397	12.41	57	1.78	463	14.47
3111	Wisła Kraków	29222	Ekstraklasa 20/21	20/21	30	80	2.67	1	429	14.30	53	1.77	478	15.93
7913	KS Lechia Gdańsk	29222	Ekstraklasa 20/21	20/21	30	74	2.47	4	441	14.70	52	1.73	471	15.70
4901	Cracovia	29222	Ekstraklasa 20/21	20/21	30	71	2.37	5	461	15.37	44	1.47	474	15.80
3110	Górnik Zabrze	29222	Ekstraklasa 20/21	20/21	30	65	2.17	0	423	14.10	31	1.03	452	15.07
7691	Jagiellonia Białystok	29222	Ekstraklasa 20/21	20/21	30	65	2.17	5	420	14.00	44	1.47	444	14.80
3113	Zagłębie Lubin	29222	Ekstraklasa 20/21	20/21	30	62	2.07	3	396	13.20	52	1.73	446	14.87
38732	Stal Mielec	29222	Ekstraklasa 20/21	20/21	30	61	2.03	2	368	12.27	40	1.33	442	14.73
7919	Podbeskidzie Bielsko-Biała	29222	Ekstraklasa 20/21	20/21	30	61	2.03	4	446	14.87	46	1.53	430	14.33
3122	Wisła Płock	29222	Ekstraklasa 20/21	20/21	30	59	1.97	1	456	15.20	40	1.33	491	16.37
3117	Pogoń Szczecin	29222	Ekstraklasa 20/21	20/21	30	58	1.93	2	384	12.80	57	1.90	434	14.47
35268	Raków Częstochowa	29222	Ekstraklasa 20/21	20/21	30	57	1.90	2	424	14.13	48	1.60	512	17.07
3106	Legia Warszawa	29222	Ekstraklasa 20/21	20/21	30	54	1.80	0	410	13.67	45	1.50	446	14.87
3121	Lech Poznań	29222	Ekstraklasa 20/21	20/21	30	53	1.77	0	393	13.10	44	1.47	423	14.10
7918	Piast Gliwice	29222	Ekstraklasa 20/21	20/21	30	53	1.77	0	366	12.20	51	1.70	469	15.63
3108	Śląsk Wrocław	29222	Ekstraklasa 20/21	20/21	30	49	1.63	3	437	14.57	41	1.37	454	15.13
7922	Warta Poznań	29222	Ekstraklasa 20/21	20/21	30	42	1.40	2	388	12.93	43	1.43	508	16.93
5065	MKS Korona Kielce	23666	Ekstraklasa 19/20	19/20	37	95	2.57	7	684	18.49	60	1.62	630	17.03
7913	KS Lechia Gdańsk	23666	Ekstraklasa 19/20	19/20	37	91	2.46	5	565	15.27	80	2.16	534	14.43
3123	ŁKS Łódź	23666	Ekstraklasa 19/20	19/20	37	89	2.41	4	580	15.68	41	1.11	699	18.89
7691	Jagiellonia Białystok	23666	Ekstraklasa 19/20	19/20	37	86	2.32	4	503	13.59	63	1.70	654	17.68
4901	Cracovia	23666	Ekstraklasa 19/20	19/20	37	85	2.30	2	557	15.05	48	1.30	655	17.70
5064	MZKS Arka Gdynia	23666	Ekstraklasa 19/20	19/20	37	84	2.27	3	646	17.46	59	1.59	575	15.54
3111	Wisła Kraków	23666	Ekstraklasa 19/20	19/20	37	83	2.24	5	583	15.76	66	1.78	569	15.38
35268	Raków Częstochowa	23666	Ekstraklasa 19/20	19/20	37	76	2.05	2	577	15.59	57	1.54	629	17.00
3110	Górnik Zabrze	23666	Ekstraklasa 19/20	19/20	37	74	2.00	2	578	15.62	67	1.81	576	15.57
3122	Wisła Płock	23666	Ekstraklasa 19/20	19/20	37	72	1.95	0	570	15.41	51	1.38	731	19.76
3106	Legia Warszawa	23666	Ekstraklasa 19/20	19/20	37	70	1.89	2	561	15.16	51	1.38	584	15.78
3121	Lech Poznań	23666	Ekstraklasa 19/20	19/20	37	69	1.86	4	470	12.70	32	0.86	588	15.89
3117	Pogoń Szczecin	23666	Ekstraklasa 19/20	19/20	37	67	1.81	4	531	14.35	43	1.16	678	18.32
3108	Śląsk Wrocław	23666	Ekstraklasa 19/20	19/20	37	65	1.76	4	557	15.05	46	1.24	537	14.51
3113	Zagłębie Lubin	23666	Ekstraklasa 19/20	19/20	37	60	1.62	3	542	14.65	59	1.59	566	15.30
7918	Piast Gliwice	23666	Ekstraklasa 19/20	19/20	37	52	1.41	4	459	12.41	47	1.27	631	17.05
5065	MKS Korona Kielce	17361	Ekstraklasa 18/19	18/19	37	95	2.57	2	631	17.05	67	1.81	633	17.11
7913	KS Lechia Gdańsk	17361	Ekstraklasa 18/19	18/19	37	92	2.49	3	557	15.05	62	1.68	547	14.78
3113	Zagłębie Lubin	17361	Ekstraklasa 18/19	18/19	37	88	2.38	4	518	14.00	83	2.24	620	16.76
7693	Zagłębie Sosnowiec	17361	Ekstraklasa 18/19	18/19	37	81	2.19	6	600	16.22	71	1.92	624	16.86
3122	Wisła Płock	17361	Ekstraklasa 18/19	18/19	37	80	2.16	7	565	15.27	67	1.81	732	19.78
3108	Śląsk Wrocław	17361	Ekstraklasa 18/19	18/19	37	79	2.14	4	547	14.78	105	2.84	624	16.86
3117	Pogoń Szczecin	17361	Ekstraklasa 18/19	18/19	37	78	2.11	2	540	14.59	73	1.97	608	16.43
3106	Legia Warszawa	17361	Ekstraklasa 18/19	18/19	37	77	2.08	4	549	14.84	73	1.97	653	17.65
3110	Górnik Zabrze	17361	Ekstraklasa 18/19	18/19	37	77	2.08	4	567	15.32	102	2.76	583	15.76
4901	Cracovia	17361	Ekstraklasa 18/19	18/19	37	77	2.08	1	567	15.32	48	1.30	675	18.24
7691	Jagiellonia Białystok	17361	Ekstraklasa 18/19	18/19	37	76	2.05	3	504	13.62	52	1.41	629	17.00
5064	MZKS Arka Gdynia	17361	Ekstraklasa 18/19	18/19	37	73	1.97	4	575	15.54	44	1.19	542	14.65
3111	Wisła Kraków	17361	Ekstraklasa 18/19	18/19	37	72	1.95	2	502	13.57	53	1.43	592	16.00
3121	Lech Poznań	17361	Ekstraklasa 18/19	18/19	37	66	1.78	0	495	13.38	42	1.14	652	17.62
35330	Miedź Legnica	17361	Ekstraklasa 18/19	18/19	37	62	1.68	4	540	14.59	49	1.32	518	14.00
7918	Piast Gliwice	17361	Ekstraklasa 18/19	18/19	37	52	1.41	2	520	14.05	53	1.43	589	15.92
3111	Wisła Kraków	13350	Ekstraklasa 17/18	17/18	37	92	2.49	3	559	15.11	65	1.76	577	15.59
3117	Pogoń Szczecin	13350	Ekstraklasa 17/18	17/18	37	88	2.38	3	564	15.24	96	2.59	618	16.70
36766	Sandecja Nowy Sącz	13350	Ekstraklasa 17/18	17/18	37	85	2.30	5	601	16.24	47	1.27	641	17.32
3122	Wisła Płock	13350	Ekstraklasa 17/18	17/18	37	85	2.30	4	581	15.70	39	1.05	633	17.11
5064	MZKS Arka Gdynia	13350	Ekstraklasa 17/18	17/18	37	85	2.30	3	666	18.00	41	1.11	567	15.32
3108	Śląsk Wrocław	13350	Ekstraklasa 17/18	17/18	37	84	2.27	3	559	15.11	83	2.24	619	16.73
7913	KS Lechia Gdańsk	13350	Ekstraklasa 17/18	17/18	37	82	2.22	3	597	16.14	78	2.11	656	17.73
5065	MKS Korona Kielce	13350	Ekstraklasa 17/18	17/18	37	77	2.08	4	600	16.22	78	2.11	655	17.70
7691	Jagiellonia Białystok	13350	Ekstraklasa 17/18	17/18	37	77	2.08	1	469	12.68	59	1.59	578	15.62
4901	Cracovia	13350	Ekstraklasa 17/18	17/18	37	76	2.05	1	496	13.41	45	1.22	691	18.68
3113	Zagłębie Lubin	13350	Ekstraklasa 17/18	17/18	37	74	2.00	3	530	14.32	67	1.81	586	15.84
36851	Bruk-Bet Termalica Nieciecza	13350	Ekstraklasa 17/18	17/18	37	74	2.00	3	577	15.59	41	1.11	535	14.46
3121	Lech Poznań	13350	Ekstraklasa 17/18	17/18	37	72	1.95	4	507	13.70	51	1.38	667	18.03
3110	Górnik Zabrze	13350	Ekstraklasa 17/18	17/18	36	68	1.89	5	567	15.75	81	2.25	614	17.06
3106	Legia Warszawa	13350	Ekstraklasa 17/18	17/18	37	66	1.78	7	473	12.78	72	1.95	652	17.62
7918	Piast Gliwice	13350	Ekstraklasa 17/18	17/18	36	66	1.83	2	508	14.11	49	1.36	558	15.50
7913	KS Lechia Gdańsk	11734	Ekstraklasa 16/17	16/17	37	101	2.73	5	520	14.05	61	1.65	720	19.46
5065	MKS Korona Kielce	11734	Ekstraklasa 16/17	16/17	37	96	2.59	3	579	15.65	58	1.57	585	15.81
3111	Wisła Kraków	11734	Ekstraklasa 16/17	16/17	37	83	2.24	3	567	15.32	61	1.65	595	16.08
3113	Zagłębie Lubin	11734	Ekstraklasa 16/17	16/17	37	76	2.05	1	545	14.73	65	1.76	487	13.16
5064	MZKS Arka Gdynia	11734	Ekstraklasa 16/17	16/17	37	74	2.00	3	628	16.97	37	1.00	639	17.27
7918	Piast Gliwice	11734	Ekstraklasa 16/17	16/17	37	71	1.92	5	553	14.95	61	1.65	541	14.62
3122	Wisła Płock	11734	Ekstraklasa 16/17	16/17	37	71	1.92	3	526	14.22	31	0.84	565	15.27
4901	Cracovia	11734	Ekstraklasa 16/17	16/17	37	69	1.86	1	549	14.84	38	1.03	602	16.27
3117	Pogoń Szczecin	11734	Ekstraklasa 16/17	16/17	37	68	1.84	2	514	13.89	63	1.70	601	16.24
3125	Górnik Łęczna	11734	Ekstraklasa 16/17	16/17	37	68	1.84	6	517	13.97	50	1.35	623	16.84
3106	Legia Warszawa	11734	Ekstraklasa 16/17	16/17	37	67	1.81	4	469	12.68	83	2.24	538	14.54
36851	Bruk-Bet Termalica Nieciecza	11734	Ekstraklasa 16/17	16/17	37	66	1.78	2	512	13.84	38	1.03	526	14.22
7691	Jagiellonia Białystok	11734	Ekstraklasa 16/17	16/17	37	65	1.76	1	522	14.11	33	0.89	547	14.78
3108	Śląsk Wrocław	11734	Ekstraklasa 16/17	16/17	37	62	1.68	4	553	14.95	40	1.08	556	15.03
3121	Lech Poznań	11734	Ekstraklasa 16/17	16/17	37	59	1.59	3	484	13.08	36	0.97	511	13.81
3105	Ruch Chorzów	11734	Ekstraklasa 16/17	16/17	37	50	1.35	4	437	11.81	33	0.89	628	16.97
3108	Śląsk Wrocław	10361	Ekstraklasa 15/16	15/16	36	88	2.44	2	560	15.56	64	1.78	524	14.56
3125	Górnik Łęczna	10361	Ekstraklasa 15/16	15/16	36	82	2.28	6	503	13.97	78	2.17	504	14.00
7919	Podbeskidzie Bielsko-Biała	10361	Ekstraklasa 15/16	15/16	36	77	2.14	6	488	13.56	62	1.72	532	14.78
7913	KS Lechia Gdańsk	10361	Ekstraklasa 15/16	15/16	35	75	2.14	3	454	12.97	64	1.83	667	19.06
3113	Zagłębie Lubin	10361	Ekstraklasa 15/16	15/16	35	75	2.14	2	527	15.06	65	1.86	494	14.11
4901	Cracovia	10361	Ekstraklasa 15/16	15/16	35	72	2.06	1	442	12.63	45	1.29	578	16.51
36851	Bruk-Bet Termalica Nieciecza	10361	Ekstraklasa 15/16	15/16	35	72	2.06	2	481	13.74	32	0.91	605	17.29
3111	Wisła Kraków	10361	Ekstraklasa 15/16	15/16	35	72	2.06	1	477	13.63	43	1.23	519	14.83
3121	Lech Poznań	10361	Ekstraklasa 15/16	15/16	35	71	2.03	1	421	12.03	42	1.20	465	13.29
3110	Górnik Zabrze	10361	Ekstraklasa 15/16	15/16	36	69	1.92	4	511	14.19	42	1.17	521	14.47
3106	Legia Warszawa	10361	Ekstraklasa 15/16	15/16	36	66	1.83	2	478	13.28	108	3.00	587	16.31
7918	Piast Gliwice	10361	Ekstraklasa 15/16	15/16	35	66	1.89	3	486	13.89	77	2.20	514	14.69
5065	MKS Korona Kielce	10361	Ekstraklasa 15/16	15/16	35	63	1.80	1	535	15.29	35	1.00	560	16.00
3117	Pogoń Szczecin	10361	Ekstraklasa 15/16	15/16	36	60	1.67	1	592	16.44	60	1.67	556	15.44
7691	Jagiellonia Białystok	10361	Ekstraklasa 15/16	15/16	35	60	1.71	4	475	13.57	57	1.63	491	14.03
3105	Ruch Chorzów	10361	Ekstraklasa 15/16	15/16	35	45	1.29	7	373	10.66	45	1.29	605	17.29
5065	MKS Korona Kielce	8206	Ekstraklasa 14/15	14/15	37	77	2.08	4	547	14.78	54	1.46	522	14.11
3111	Wisła Kraków	8206	Ekstraklasa 14/15	14/15	37	76	2.05	5	556	15.03	64	1.73	581	15.70
3128	GKS Bełchatów	8206	Ekstraklasa 14/15	14/15	37	74	2.00	4	557	15.05	46	1.24	642	17.35
3121	Lech Poznań	8206	Ekstraklasa 14/15	14/15	37	74	2.00	2	567	15.32	54	1.46	530	14.32
4901	Cracovia	8206	Ekstraklasa 14/15	14/15	37	74	2.00	2	501	13.54	66	1.78	502	13.57
3117	Pogoń Szczecin	8206	Ekstraklasa 14/15	14/15	37	71	1.92	3	586	15.84	60	1.62	592	16.00
7919	Podbeskidzie Bielsko-Biała	8206	Ekstraklasa 14/15	14/15	37	71	1.92	6	549	14.84	51	1.38	652	17.62
3106	Legia Warszawa	8206	Ekstraklasa 14/15	14/15	37	70	1.89	4	461	12.46	77	2.08	641	17.32
3110	Górnik Zabrze	8206	Ekstraklasa 14/15	14/15	37	67	1.81	4	482	13.03	47	1.27	563	15.22
35329	Zawisza Bydgoszcz	8206	Ekstraklasa 14/15	14/15	37	66	1.78	6	515	13.92	45	1.22	593	16.03
3125	Górnik Łęczna	8206	Ekstraklasa 14/15	14/15	37	66	1.78	5	506	13.68	83	2.24	457	12.35
3105	Ruch Chorzów	8206	Ekstraklasa 14/15	14/15	37	65	1.76	2	393	10.62	51	1.38	523	14.14
7913	KS Lechia Gdańsk	8206	Ekstraklasa 14/15	14/15	37	63	1.70	6	504	13.62	52	1.41	673	18.19
3108	Śląsk Wrocław	8206	Ekstraklasa 14/15	14/15	37	62	1.68	3	518	14.00	64	1.73	592	16.00
7691	Jagiellonia Białystok	8206	Ekstraklasa 14/15	14/15	37	59	1.59	3	473	12.78	48	1.30	574	15.51
7918	Piast Gliwice	8206	Ekstraklasa 14/15	14/15	37	51	1.38	1	506	13.68	60	1.62	506	13.68
3111	Wisła Kraków	6261	Ekstraklasa 13/14	13/14	37	65	1.76	3	388	10.49	69	1.86	377	10.19
3117	Pogoń Szczecin	6261	Ekstraklasa 13/14	13/14	37	62	1.68	5	404	10.92	60	1.62	396	10.70
5065	MKS Korona Kielce	6261	Ekstraklasa 13/14	13/14	37	61	1.65	9	434	11.73	58	1.57	364	9.84
3121	Lech Poznań	6261	Ekstraklasa 13/14	13/14	37	58	1.57	4	419	11.32	44	1.19	336	9.08
7919	Podbeskidzie Bielsko-Biała	6261	Ekstraklasa 13/14	13/14	37	56	1.51	1	380	10.27	37	1.00	411	11.11
7913	KS Lechia Gdańsk	6261	Ekstraklasa 13/14	13/14	37	53	1.43	4	350	9.46	40	1.08	421	11.38
3113	Zagłębie Lubin	6261	Ekstraklasa 13/14	13/14	37	51	1.38	4	319	8.62	36	0.97	379	10.24
3108	Śląsk Wrocław	6261	Ekstraklasa 13/14	13/14	37	50	1.35	2	345	9.32	47	1.27	416	11.24
3110	Górnik Zabrze	6261	Ekstraklasa 13/14	13/14	37	49	1.32	4	339	9.16	39	1.05	414	11.19
7691	Jagiellonia Białystok	6261	Ekstraklasa 13/14	13/14	36	48	1.33	5	358	9.94	30	0.83	485	13.47
35329	Zawisza Bydgoszcz	6261	Ekstraklasa 13/14	13/14	37	46	1.24	6	386	10.43	40	1.08	464	12.54
3106	Legia Warszawa	6261	Ekstraklasa 13/14	13/14	36	45	1.25	3	390	10.83	58	1.61	505	14.03
4901	Cracovia	6261	Ekstraklasa 13/14	13/14	37	44	1.19	3	284	7.68	42	1.14	322	8.70
7918	Piast Gliwice	6261	Ekstraklasa 13/14	13/14	37	43	1.16	2	409	11.05	38	1.03	362	9.78
3115	Widzew Łódź	6261	Ekstraklasa 13/14	13/14	37	42	1.14	6	307	8.30	18	0.49	359	9.70
3105	Ruch Chorzów	6261	Ekstraklasa 13/14	13/14	37	30	0.81	1	338	9.14	31	0.84	428	11.57
7919	Podbeskidzie Bielsko-Biała	4634	Ekstraklasa 12/13	12/13	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3105	Ruch Chorzów	4634	Ekstraklasa 12/13	12/13	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3106	Legia Warszawa	4634	Ekstraklasa 12/13	12/13	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3108	Śląsk Wrocław	4634	Ekstraklasa 12/13	12/13	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3110	Górnik Zabrze	4634	Ekstraklasa 12/13	12/13	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3111	Wisła Kraków	4634	Ekstraklasa 12/13	12/13	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3113	Zagłębie Lubin	4634	Ekstraklasa 12/13	12/13	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3115	Widzew Łódź	4634	Ekstraklasa 12/13	12/13	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3117	Pogoń Szczecin	4634	Ekstraklasa 12/13	12/13	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3119	Polonia Warszawa	4634	Ekstraklasa 12/13	12/13	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3121	Lech Poznań	4634	Ekstraklasa 12/13	12/13	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3128	GKS Bełchatów	4634	Ekstraklasa 12/13	12/13	30	0	0.00	0	0	0.00	0	0.00	0	0.00
5065	MKS Korona Kielce	4634	Ekstraklasa 12/13	12/13	30	0	0.00	0	0	0.00	0	0.00	0	0.00
7691	Jagiellonia Białystok	4634	Ekstraklasa 12/13	12/13	30	0	0.00	0	0	0.00	0	0.00	0	0.00
7913	KS Lechia Gdańsk	4634	Ekstraklasa 12/13	12/13	30	0	0.00	0	0	0.00	0	0.00	0	0.00
7918	Piast Gliwice	4634	Ekstraklasa 12/13	12/13	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3105	Ruch Chorzów	3411	Ekstraklasa 11/12	11/12	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3106	Legia Warszawa	3411	Ekstraklasa 11/12	11/12	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3108	Śląsk Wrocław	3411	Ekstraklasa 11/12	11/12	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3110	Górnik Zabrze	3411	Ekstraklasa 11/12	11/12	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3111	Wisła Kraków	3411	Ekstraklasa 11/12	11/12	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3113	Zagłębie Lubin	3411	Ekstraklasa 11/12	11/12	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3115	Widzew Łódź	3411	Ekstraklasa 11/12	11/12	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3119	Polonia Warszawa	3411	Ekstraklasa 11/12	11/12	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3121	Lech Poznań	3411	Ekstraklasa 11/12	11/12	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3123	ŁKS Łódź	3411	Ekstraklasa 11/12	11/12	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3128	GKS Bełchatów	3411	Ekstraklasa 11/12	11/12	30	0	0.00	0	0	0.00	0	0.00	0	0.00
4901	Cracovia	3411	Ekstraklasa 11/12	11/12	30	0	0.00	0	0	0.00	0	0.00	0	0.00
5065	MKS Korona Kielce	3411	Ekstraklasa 11/12	11/12	30	0	0.00	0	0	0.00	0	0.00	0	0.00
7691	Jagiellonia Białystok	3411	Ekstraklasa 11/12	11/12	30	0	0.00	0	0	0.00	0	0.00	0	0.00
7913	KS Lechia Gdańsk	3411	Ekstraklasa 11/12	11/12	30	0	0.00	0	0	0.00	0	0.00	0	0.00
7919	Podbeskidzie Bielsko-Biała	3411	Ekstraklasa 11/12	11/12	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3105	Ruch Chorzów	2737	Ekstraklasa 10/11	10/11	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3106	Legia Warszawa	2737	Ekstraklasa 10/11	10/11	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3108	Śląsk Wrocław	2737	Ekstraklasa 10/11	10/11	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3110	Górnik Zabrze	2737	Ekstraklasa 10/11	10/11	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3111	Wisła Kraków	2737	Ekstraklasa 10/11	10/11	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3113	Zagłębie Lubin	2737	Ekstraklasa 10/11	10/11	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3115	Widzew Łódź	2737	Ekstraklasa 10/11	10/11	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3119	Polonia Warszawa	2737	Ekstraklasa 10/11	10/11	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3121	Lech Poznań	2737	Ekstraklasa 10/11	10/11	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3128	GKS Bełchatów	2737	Ekstraklasa 10/11	10/11	30	0	0.00	0	0	0.00	0	0.00	0	0.00
4901	Cracovia	2737	Ekstraklasa 10/11	10/11	30	0	0.00	0	0	0.00	0	0.00	0	0.00
5064	MZKS Arka Gdynia	2737	Ekstraklasa 10/11	10/11	30	0	0.00	0	0	0.00	0	0.00	0	0.00
5065	MKS Korona Kielce	2737	Ekstraklasa 10/11	10/11	30	0	0.00	0	0	0.00	0	0.00	0	0.00
7691	Jagiellonia Białystok	2737	Ekstraklasa 10/11	10/11	30	0	0.00	0	0	0.00	0	0.00	0	0.00
7692	Polonia Bytom	2737	Ekstraklasa 10/11	10/11	30	0	0.00	0	0	0.00	0	0.00	0	0.00
7913	KS Lechia Gdańsk	2737	Ekstraklasa 10/11	10/11	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3105	Ruch Chorzów	2275	Ekstraklasa 09/10	09/10	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3106	Legia Warszawa	2275	Ekstraklasa 09/10	09/10	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3108	Śląsk Wrocław	2275	Ekstraklasa 09/10	09/10	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3111	Wisła Kraków	2275	Ekstraklasa 09/10	09/10	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3113	Zagłębie Lubin	2275	Ekstraklasa 09/10	09/10	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3114	MKS Odra Wodzisław Śląski	2275	Ekstraklasa 09/10	09/10	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3119	Polonia Warszawa	2275	Ekstraklasa 09/10	09/10	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3121	Lech Poznań	2275	Ekstraklasa 09/10	09/10	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3128	GKS Bełchatów	2275	Ekstraklasa 09/10	09/10	30	0	0.00	0	0	0.00	0	0.00	0	0.00
4901	Cracovia	2275	Ekstraklasa 09/10	09/10	30	0	0.00	0	0	0.00	0	0.00	0	0.00
5064	MZKS Arka Gdynia	2275	Ekstraklasa 09/10	09/10	30	0	0.00	0	0	0.00	0	0.00	0	0.00
5065	MKS Korona Kielce	2275	Ekstraklasa 09/10	09/10	30	0	0.00	0	0	0.00	0	0.00	0	0.00
7691	Jagiellonia Białystok	2275	Ekstraklasa 09/10	09/10	30	0	0.00	0	0	0.00	0	0.00	0	0.00
7692	Polonia Bytom	2275	Ekstraklasa 09/10	09/10	30	0	0.00	0	0	0.00	0	0.00	0	0.00
7913	KS Lechia Gdańsk	2275	Ekstraklasa 09/10	09/10	30	0	0.00	0	0	0.00	0	0.00	0	0.00
7918	Piast Gliwice	2275	Ekstraklasa 09/10	09/10	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3105	Ruch Chorzów	1691	Ekstraklasa 08/09	08/09	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3106	Legia Warszawa	1691	Ekstraklasa 08/09	08/09	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3108	Śląsk Wrocław	1691	Ekstraklasa 08/09	08/09	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3110	Górnik Zabrze	1691	Ekstraklasa 08/09	08/09	31	0	0.00	0	0	0.00	0	0.00	0	0.00
3111	Wisła Kraków	1691	Ekstraklasa 08/09	08/09	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3114	MKS Odra Wodzisław Śląski	1691	Ekstraklasa 08/09	08/09	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3119	Polonia Warszawa	1691	Ekstraklasa 08/09	08/09	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3121	Lech Poznań	1691	Ekstraklasa 08/09	08/09	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3123	ŁKS Łódź	1691	Ekstraklasa 08/09	08/09	30	0	0.00	0	0	0.00	0	0.00	0	0.00
3128	GKS Bełchatów	1691	Ekstraklasa 08/09	08/09	30	0	0.00	0	0	0.00	0	0.00	0	0.00
4901	Cracovia	1691	Ekstraklasa 08/09	08/09	30	0	0.00	0	0	0.00	0	0.00	0	0.00
5064	MZKS Arka Gdynia	1691	Ekstraklasa 08/09	08/09	30	0	0.00	0	0	0.00	0	0.00	0	0.00
7691	Jagiellonia Białystok	1691	Ekstraklasa 08/09	08/09	30	0	0.00	0	0	0.00	0	0.00	0	0.00
7692	Polonia Bytom	1691	Ekstraklasa 08/09	08/09	30	0	0.00	0	0	0.00	0	0.00	0	0.00
7913	KS Lechia Gdańsk	1691	Ekstraklasa 08/09	08/09	30	0	0.00	0	0	0.00	0	0.00	0	0.00
7918	Piast Gliwice	1691	Ekstraklasa 08/09	08/09	31	0	0.00	0	0	0.00	0	0.00	0	0.00
\.


--
-- Data for Name: mart_team_form; Type: TABLE DATA; Schema: gold; Owner: airflow
--

COPY gold.mart_team_form (team_id, team_name, season_id, season_name, season_year, last_5_results, points_last_5, wins_last_5, draws_last_5, losses_last_5, goals_for_last_5, goals_against_last_5, last_5_results_home, points_last_5_home, last_5_results_away, points_last_5_away, last_10_results, points_last_10, wins_last_10, draws_last_10, losses_last_10, goals_for_last_10, goals_against_last_10, last_15_results, points_last_15, wins_last_15, draws_last_15, losses_last_15, goals_for_last_15, goals_against_last_15, last_20_results, points_last_20, wins_last_20, draws_last_20, losses_last_20, goals_for_last_20, goals_against_last_20, halftime_leading_count, halftime_leading_wins, halftime_leading_draws, halftime_leading_losses, halftime_leading_win_pct, conceded_first_count, points_after_conceding_first, points_pct_after_conceding_first) FROM stdin;
7913	KS Lechia Gdańsk	76477	Ekstraklasa 25/26	25/26	WWDWL	13	3	1	1	15	8	WWWLD	10	DLWLW	5	WWDWLLWDLW	15	5	2	3	23	18	WWDWLLWDLWWLWLD	21	7	3	5	31	29	WWDWLLWDLWWLWLDDLL	25	7	4	7	37	37	7	4	2	1	57.1	16	19	39.6
7295	Radomiak Radom	76477	Ekstraklasa 25/26	25/26	DWLWW	10	3	1	1	12	7	WWDWW	12	DLWLD	7	DWLWWDLWDW	19	5	3	2	21	14	DWLWWDLWDWLLDLL	20	5	4	6	26	27	DWLWWDLWDWLLDLLWDW	29	7	5	6	35	30	5	4	1	0	80.0	15	20	44.4
3121	Lech Poznań	76477	Ekstraklasa 25/26	25/26	DDWLD	9	1	3	1	9	8	WDDDL	4	DDLDW	10	DDWLDDDWDD	16	2	7	1	16	14	DDWLDDDWDDWLWDW	24	5	8	2	24	19	DDWLDDDWDDWLWDWWL	26	6	8	3	29	26	6	4	1	1	66.7	13	18	46.2
3122	Wisła Płock	76477	Ekstraklasa 25/26	25/26	DDDDD	9	0	5	0	3	3	DDWWD	6	DDDDD	15	DDDDDWDWDD	21	2	8	0	11	7	DDDDDWDWDDLLWWD	31	4	9	2	15	11	DDDDDWDWDDLLWWDWWW	38	7	9	2	21	12	7	5	2	0	71.4	12	26	72.2
3112	GKS Katowice	76477	Ekstraklasa 25/26	25/26	LWLWW	8	3	0	2	7	4	WLWLL	9	LWWDL	5	LWLWWWLDLL	14	4	1	5	13	13	LWLWWWLDLLWLWLL	20	6	1	8	21	25	LWLWWWLDLLWLWLLDL	21	6	2	9	23	28	3	3	0	0	100.0	14	14	33.3
7691	Jagiellonia Białystok	76477	Ekstraklasa 25/26	25/26	DLDWL	8	1	2	2	5	6	LWWWW	13	DLDWL	7	DLDWLLWWDD	20	3	4	3	15	11	DLDWLLWWDDWDWWW	31	7	5	3	26	15	DLDWLLWWDDWDWWWWL	35	8	5	4	29	21	4	3	1	0	75.0	12	22	61.1
36851	Bruk-Bet Termalica Nieciecza	76477	Ekstraklasa 25/26	25/26	WLWWL	8	3	0	2	7	10	WWLDL	8	LWLLD	4	WLWWLDLLLL	10	3	1	6	13	24	WLWWLDLLLLDLDLW	19	4	3	8	19	32	WLWWLDLLLLDLDLWDLW	20	5	4	9	24	35	7	4	1	2	57.1	15	15	33.3
7918	Piast Gliwice	76477	Ekstraklasa 25/26	25/26	WWLWW	7	4	0	1	9	4	WLDLW	8	WWWLL	3	WWLWWDLLLW	11	5	1	4	16	12	WWLWWDLLLWLDDDD	17	5	5	5	19	16	WWLWWDLLLWLDDDDLL	18	5	5	7	19	19	2	2	0	0	100.0	12	11	30.6
5064	MZKS Arka Gdynia	76477	Ekstraklasa 25/26	25/26	WLLWL	7	2	0	3	6	12	WLWWW	13	LLLLL	0	WLLWLWLWLD	13	4	1	5	10	22	WLLWLWLWLDLWLLW	19	6	1	8	14	30	WLLWLWLWLDLWLLWDDL	22	6	3	9	15	32	3	2	1	0	66.7	14	13	31.0
35268	Raków Częstochowa	76477	Ekstraklasa 25/26	25/26	LWWLW	7	3	0	2	10	6	LWLWW	11	WWWLW	4	LWWLWWWLWW	15	7	0	3	17	10	LWWLWWWLWWDDLLW	17	8	2	5	23	18	LWWLWWWLWWDDLLWLLW	19	9	2	7	26	23	4	4	0	0	100.0	14	11	26.2
3113	Zagłębie Lubin	76477	Ekstraklasa 25/26	25/26	WWDLW	7	3	1	1	6	6	WDWWW	12	WLDDL	7	WWDLWDDWLW	19	5	3	2	15	11	WWDLWDDWLWDWDLW	23	7	5	3	28	20	WWDLWDDWLWDWDLWDDL	26	7	7	4	31	24	7	4	2	1	57.1	13	16	41.0
5065	MKS Korona Kielce	76477	Ekstraklasa 25/26	25/26	DLWLD	6	1	2	2	5	7	DLLDW	5	WDLLD	7	DLWLDLDLWD	12	2	4	4	10	12	DLWLDLDLWDWWWDW	25	6	5	4	20	14	DLWLDLDLWDWWWDWDLL	29	6	6	6	21	19	5	4	1	0	80.0	12	11	30.6
3106	Legia Warszawa	76477	Ekstraklasa 25/26	25/26	LLDDL	5	0	2	3	4	8	LDLDW	5	LDDLL	6	LLDDLDDLLW	11	1	4	5	8	15	LLDDLDDLLWDDWLL	17	2	6	7	14	20	LLDDLDDLLWDDWLLWDW	21	4	7	7	19	21	4	4	0	0	100.0	13	17	43.6
4901	Cracovia	76477	Ekstraklasa 25/26	25/26	DDWLL	5	1	2	2	4	7	DLDWD	4	DWLLL	4	DDWLLDLWLD	8	2	4	4	9	12	DDWLLDLWLDWWDWL	18	5	5	5	17	18	DDWLLDLWLDWWDWLDWW	22	7	6	5	25	21	7	5	0	2	71.4	10	5	16.7
3117	Pogoń Szczecin	76477	Ekstraklasa 25/26	25/26	DLWLL	4	1	1	3	8	9	DWLWW	10	LLDLL	3	DLWLLWDWLL	14	3	2	5	17	18	DLWLLWDWLLLWWLL	19	5	2	8	22	25	DLWLLWDWLLLWWLLDWL	25	6	3	9	28	32	5	2	2	1	40.0	17	22	43.1
3110	Górnik Zabrze	76477	Ekstraklasa 25/26	25/26	LLDLW	3	1	1	3	8	13	DWWWW	12	LLLDD	6	LLDLWWDWDW	18	4	3	3	18	19	LLDLWWDWDWWLWWL	25	7	3	5	25	21	LLDLWWDWDWWLWWLLWW	29	9	3	6	29	24	6	6	0	0	100.0	14	23	54.8
3115	Widzew Łódź	76477	Ekstraklasa 25/26	25/26	LWLLD	2	1	1	3	6	8	LDWLW	8	LWLLW	2	LWLLDLWWLL	7	3	1	6	15	19	LWLLDLWWLLWLLLD	11	4	2	9	20	25	LWLLDLWWLLWLLLDWLW	17	6	2	10	26	28	6	5	0	1	83.3	14	7	16.7
7915	Motor Lublin	76477	Ekstraklasa 25/26	25/26	DLDWD	1	1	3	1	5	5	DDDWL	4	LWDLD	7	DLDWDDWLLD	8	2	5	3	14	16	DLDWDDWLLDDDWLD	12	3	8	4	18	21	DLDWDDWLLDDDWLDDLW	18	4	9	5	23	28	3	1	2	0	33.3	14	11	26.2
3121	Lech Poznań	61236	Ekstraklasa 24/25	24/25	WDWWD	13	3	2	0	14	5	WWWWW	15	DWDWL	8	WDWWDWWWLL	20	6	2	2	22	12	WDWWDWWWLLWWWLL	28	9	2	4	31	16	WDWWDWWWLLWWWLLWLDWW	40	12	3	5	43	21	16	15	1	0	93.8	20	34	56.7
35268	Raków Częstochowa	61236	Ekstraklasa 24/25	24/25	WDLWW	11	3	1	1	9	4	WLWWW	13	DWLDW	8	WDLWWLWDWW	21	6	2	2	17	9	WDLWWLWDWWWWWWL	30	10	2	3	26	12	WDLWWLWDWWWWWWLDDWDD	37	11	6	3	34	19	15	12	3	0	80.0	17	30	58.8
7913	KS Lechia Gdańsk	61236	Ekstraklasa 24/25	24/25	LDWWW	11	3	1	1	13	9	LWWWW	13	DWLLL	4	LDWWWLWLWL	17	5	1	4	19	17	LDWWWLWLWLLLLWW	23	7	1	7	25	25	LDWWWLWLWLLLLWWDWLLD	33	8	3	9	27	31	9	6	1	2	66.7	26	27	34.6
7295	Radomiak Radom	61236	Ekstraklasa 24/25	24/25	LDWDD	10	1	3	1	8	7	LWDLW	8	DDDLW	10	LDWDDDLLWW	18	3	4	3	16	14	LDWDDDLLWWWDWLD	22	5	6	4	25	21	LDWDDDLLWWWDWLDLWDLL	24	6	7	7	29	31	6	5	1	0	83.3	28	24	28.6
5065	MKS Korona Kielce	61236	Ekstraklasa 24/25	24/25	DDLWW	9	2	2	1	9	7	DWWWL	10	DLDLD	9	DDLWWDWLLD	19	3	4	3	14	15	DDLWWDWLLDWWWDW	32	7	5	3	21	17	DDLWWDWLLDWWWDWDDLDD	39	7	9	4	25	23	7	3	4	0	42.9	25	46	61.3
38732	Stal Mielec	61236	Ekstraklasa 24/25	24/25	DDWLD	8	1	3	1	9	10	DLDDL	2	DWDLL	7	DDWLDDLDLL	9	1	5	4	14	22	DDWLDDLDLLLLDLW	17	2	6	7	20	31	DDWLDDLDLLLLDLWLLDWW	21	4	7	9	27	37	8	3	4	1	37.5	29	26	29.9
3115	Widzew Łódź	61236	Ekstraklasa 24/25	24/25	LWLLD	7	1	1	3	4	6	WLLWW	11	LLDLW	4	LWLLDLLWWW	15	4	1	5	11	10	LWLLDLLWWWLDLLD	20	4	3	8	13	20	LWLLDLLWWWLDLLDLWLLW	27	6	3	11	20	30	8	7	1	0	87.5	25	27	36.0
3117	Pogoń Szczecin	61236	Ekstraklasa 24/25	24/25	DDWLW	7	2	2	1	12	10	DWWWW	12	DLWLD	7	DDWLWWLWDW	19	5	3	2	23	14	DDWLWWLWDWDLWWW	28	8	4	3	33	19	DDWLWWLWDWDLWWWWDDWL	36	10	6	4	38	21	12	10	2	0	83.3	20	22	36.7
4901	Cracovia	61236	Ekstraklasa 24/25	24/25	WWLLW	6	3	0	2	7	6	WLLWL	9	WLWLD	5	WWLLWLLDWL	13	4	1	5	16	19	WWLLWLLDWLLWDDD	18	5	4	6	22	25	WWLLWLLDWLLWDDDDDDLL	22	5	7	8	28	33	7	5	1	1	71.4	27	32	39.5
3108	Śląsk Wrocław	61236	Ekstraklasa 24/25	24/25	DDLWL	6	1	2	2	5	8	DWLDW	7	DLLWW	5	DDLWLLWDWW	12	4	3	3	17	15	DDLWLLWDWWDLLWD	18	5	5	5	23	22	DDLWLLWDWWDLLWDLLLLD	24	5	6	9	27	31	8	3	2	3	37.5	29	26	29.9
7915	Motor Lublin	61236	Ekstraklasa 24/25	24/25	WWLLL	6	2	0	3	5	10	WLLLW	9	WLWDL	5	WWLLLWLDWL	14	4	1	5	13	19	WWLLLWLDWLDWWLL	18	6	2	7	20	28	WWLLLWLDWLDWWLLDDWWW	26	9	4	7	29	34	10	10	0	0	100.0	26	28	35.9
3110	Górnik Zabrze	61236	Ekstraklasa 24/25	24/25	DLWDD	6	1	3	1	4	4	DWDLW	7	LDDLL	6	DLWDDDLLLW	13	2	4	4	11	10	DLWDDDLLLWWLLWL	18	4	4	7	16	18	DLWDDDLLLWWLLWLDWWWW	26	8	5	7	25	22	10	6	1	3	60.0	22	23	34.8
3112	GKS Katowice	61236	Ekstraklasa 24/25	24/25	WDWLL	5	2	1	2	9	10	DWLWW	10	WLWLL	2	WDWLLWWLWL	12	5	1	4	16	17	WDWLLWWLWLWLLDW	16	7	2	6	21	22	WDWLLWWLWLWLLDWWDWLW	26	10	3	7	29	28	10	8	2	0	80.0	24	27	37.5
3113	Zagłębie Lubin	61236	Ekstraklasa 24/25	24/25	LLWLD	4	1	1	3	6	9	LWDWL	8	LLWWL	2	LLWLDWWWLD	10	4	2	4	13	14	LLWLDWWWLDLLLLW	13	5	2	8	17	23	LLWLDWWWLDLLLLWLLDLL	18	5	3	12	19	32	7	4	3	0	57.1	27	25	30.9
7918	Piast Gliwice	61236	Ekstraklasa 24/25	24/25	LWWDL	4	2	1	2	7	5	WDDWL	7	LWLDL	4	LWWDLDWDLL	11	3	3	4	12	12	LWWDLDWDLLLWDDW	19	5	5	5	16	17	LWWDLDWDLLLWDDWWDDLL	21	6	7	7	21	22	9	9	0	0	100.0	22	16	24.2
7691	Jagiellonia Białystok	61236	Ekstraklasa 24/25	24/25	DDWDL	4	1	3	1	6	7	DDLDW	4	DWLWL	5	DDWDLLWDLW	9	3	4	3	11	13	DDWDLLWDLWWWDWL	19	6	5	4	19	17	DDWDLLWDLWWWDWLWDDDD	28	7	9	4	30	23	15	12	3	0	80.0	23	26	37.7
3106	Legia Warszawa	61236	Ekstraklasa 24/25	24/25	DLWLW	3	2	1	2	8	7	DLWLD	5	LWWWL	3	DLWLWWLWDL	8	4	2	4	14	13	DLWLWWLWDLDWLWL	17	6	3	6	23	21	DLWLWWLWDLDWLWLDWDWL	24	8	5	7	34	31	8	8	0	0	100.0	27	42	51.9
38729	Puszcza Niepołomice	61236	Ekstraklasa 24/25	24/25	DLLLL	2	0	1	4	8	19	DLLDD	2	LLLLL	0	DLLLLDLDLW	5	1	3	6	15	29	DLLLLDLDLWLLWLL	8	2	3	10	19	36	DLLLLDLDLWLLWLLDDWWL	15	4	5	11	24	40	9	5	2	2	55.6	26	18	23.1
3117	Pogoń Szczecin	52176	Ekstraklasa 23/24	23/24	WDLWD	12	2	2	1	5	4	WWLWW	13	DLDLD	9	WDLWDLWLWD	22	4	3	3	15	10	WDLWDLWLWDLDWWW	31	7	4	4	25	15	WDLWDLWLWDLDWWWWDLLD	33	8	6	6	33	24	8	7	0	1	87.5	22	29	43.9
4901	Cracovia	52176	Ekstraklasa 23/24	23/24	LWLWD	9	2	1	2	7	6	WWLDD	7	LLDWL	4	LWLWDLWDLD	11	3	3	4	15	15	LWLWDLWDLDDLDDW	24	4	6	5	23	18	LWLWDLWDLDDLDDWWLDDD	30	5	9	6	32	27	12	8	4	0	66.7	23	21	30.4
7918	Piast Gliwice	52176	Ekstraklasa 23/24	23/24	LDWDW	9	2	2	1	8	3	DWWWD	9	LDWLL	4	LDWDWWWLDL	13	4	3	3	15	9	LDWDWWWLDLWLLDL	17	5	4	6	19	18	LDWDWWWLDLWLLDLLWWDD	28	7	6	7	27	24	8	5	3	0	62.5	19	26	45.6
7691	Jagiellonia Białystok	52176	Ekstraklasa 23/24	23/24	WDWLD	9	2	2	1	11	6	WWDLW	10	DLWDW	8	WDWLDWLDWW	18	5	3	2	23	11	WDWLDWLDWWWLDLW	23	7	4	4	32	18	WDWLDWLDWWWLDLWDWWDD	33	9	7	4	43	26	15	13	2	0	86.7	23	39	56.5
3108	Śląsk Wrocław	52176	Ekstraklasa 23/24	23/24	WWWWL	9	4	0	1	12	5	WWLWD	10	WWDLD	8	WWWWLDLWDD	18	5	3	2	16	10	WWWWLDLWDDLWDLL	26	6	4	5	19	16	WWWWLDLWDDLWDLLWDDWW	29	9	6	5	24	18	12	10	2	0	83.3	19	28	49.1
38729	Puszcza Niepołomice	52176	Ekstraklasa 23/24	23/24	WDWLD	9	2	2	1	4	3	WWDWD	9	DLWDD	10	WDWLDWWDDD	19	4	5	1	8	5	WDWLDWWDDDLDLDD	22	4	8	3	14	13	WDWLDWWDDDLDLDDLDWWW	29	7	9	4	23	19	11	4	5	2	36.4	24	20	27.8
3113	Zagłębie Lubin	52176	Ekstraklasa 23/24	23/24	LWWWW	8	4	0	1	12	7	WWLLD	8	LWWLD	5	LWWWWLLLDD	13	4	2	4	15	14	LWWWWLLLDDWWDDL	20	6	4	5	21	19	LWWWWLLLDDWWDDLLDLWD	26	7	6	7	27	27	13	8	5	0	61.5	23	19	27.5
3105	Ruch Chorzów	52176	Ekstraklasa 23/24	23/24	WLWWW	8	4	0	1	9	5	WWLDL	8	LWWLD	5	WLWWWLLDDL	13	4	2	4	13	16	WLWWWLLDDLLWDDL	20	5	4	6	18	21	WLWWWLLDDLLWDDLDDDDL	26	5	8	7	27	31	6	3	2	1	50.0	25	28	37.3
5065	MKS Korona Kielce	52176	Ekstraklasa 23/24	23/24	WWLDD	7	2	2	1	6	6	WDWWD	9	WLDLL	4	WWLDDWLWLD	13	4	3	3	14	12	WWLDDWLWLDLDLDL	14	4	5	6	19	22	WWLDDWLWLDLDLDLWLDLD	24	5	7	8	22	26	8	6	2	0	75.0	26	20	25.6
38732	Stal Mielec	52176	Ekstraklasa 23/24	23/24	LDDWL	7	1	2	2	7	9	DWLDD	4	LDLLD	6	LDDWLLDLDD	10	1	5	4	9	15	LDDWLLDLDDWLWDW	17	4	6	5	15	18	LDDWLLDLDDWLWDWWLDWW	27	7	7	6	24	27	7	7	0	0	100.0	24	32	44.4
3106	Legia Warszawa	52176	Ekstraklasa 23/24	23/24	WWWLW	7	4	0	1	8	6	WLDDW	7	WWWDW	7	WWWLWDDDWW	14	6	3	1	16	10	WWWLWDDDWWLDDDW	18	7	6	2	22	16	WWWLWDDDWWLDDDWLWDWD	25	9	8	3	30	21	12	9	3	0	75.0	24	34	47.2
3121	Lech Poznań	52176	Ekstraklasa 23/24	23/24	LDLLD	5	0	2	3	4	7	LLDWW	8	DLWLD	7	LDLLDWLWDW	15	3	3	4	11	11	LDLLDWLWDWDLDWW	22	5	5	5	15	16	LDLLDWLWDWDLDWWDLWLD	31	6	7	7	19	22	13	9	3	1	69.2	21	30	47.6
35268	Raków Częstochowa	52176	Ekstraklasa 23/24	23/24	LLWLW	5	2	0	3	4	7	LWLDD	5	LLWLD	4	LLWLWLDLDD	9	2	3	5	8	13	LLWLWLDLDDWDWDW	22	5	5	5	18	15	LLWLWLDLDDWDWDWLWLDD	28	6	7	7	24	23	13	9	3	1	69.2	23	22	31.9
7295	Radomiak Radom	52176	Ekstraklasa 23/24	23/24	LLLWL	4	1	0	4	7	11	LLLWL	7	LWLLD	4	LLLWLLLWDL	11	2	1	7	12	22	LLLWLLLWDLWWDLL	19	4	2	9	17	35	LLLWLLLWDLWWDLLDDWLD	24	5	5	10	23	39	8	7	0	1	87.5	26	22	28.2
7922	Warta Poznań	52176	Ekstraklasa 23/24	23/24	LLLWL	4	1	0	4	2	8	LWWWD	10	LLLLL	0	LLLWLWWLDL	10	3	1	6	10	15	LLLWLWWLDLLWDDW	18	5	3	7	13	17	LLLWLWWLDLLWDDWLDLDL	26	5	5	10	19	29	10	5	5	0	50.0	24	27	37.5
3123	ŁKS Łódź	52176	Ekstraklasa 23/24	23/24	WLLLL	4	1	0	4	6	14	WLLWD	8	LLLDL	3	WLLLLLWDLD	11	2	2	6	14	28	WLLLLLWDLDWWLLL	16	4	2	9	20	37	WLLLLLWDLDWWLLLLDDLD	17	4	5	11	26	46	5	3	2	0	60.0	30	22	24.4
3110	Górnik Zabrze	52176	Ekstraklasa 23/24	23/24	LDDLW	3	1	2	2	6	9	DDWWL	7	LLWWW	3	LDDLWWWWLW	10	5	2	3	14	14	LDDLWWWWLWDWLWW	17	8	3	4	23	20	LDDLWWWWLWDWLWWWDWLL	26	10	4	6	30	25	14	10	3	1	71.4	22	26	39.4
3115	Widzew Łódź	52176	Ekstraklasa 23/24	23/24	WDLLL	3	1	1	3	6	8	DLLWW	8	WLWDD	8	WDLLLWDWWD	16	4	3	3	15	13	WDLLLWDWWDWLWWL	24	7	3	5	23	19	WDLLLWDWWDWLWWLLLLWW	30	9	3	8	29	27	8	6	1	1	75.0	25	34	45.3
3117	Pogoń Szczecin	42004	Ekstraklasa 22/23	22/23	WLWWD	12	3	1	1	10	5	WWWWW	15	LDWDW	8	WLWWDWWWDD	22	6	3	1	20	11	WLWWDWWWDDWLWWL	28	9	3	3	25	16	WLWWDWWWDDWLWWLLDWLW	35	11	4	5	35	28	11	9	2	0	81.8	25	37	49.3
3110	Górnik Zabrze	42004	Ekstraklasa 22/23	22/23	DWWWW	11	4	1	0	8	3	WWWDW	12	DWWWL	6	DWWWWWWDLW	18	7	2	1	16	7	DWWWWWWDLWLLWLD	20	8	3	4	18	12	DWWWWWWDLWLLWLDDLLLW	22	9	4	7	24	21	10	7	2	1	70.0	22	20	30.3
3113	Zagłębie Lubin	42004	Ekstraklasa 22/23	22/23	DWWWW	11	4	1	0	9	2	WWLDL	8	DWWDL	8	DWWWWDLLDD	18	4	4	2	13	10	DWWWWDLLDDLWWWL	25	7	4	4	18	15	DWWWWDLLDDLWWWLLWLLL	29	8	4	8	23	24	8	6	2	0	75.0	25	29	38.7
3108	Śląsk Wrocław	42004	Ekstraklasa 22/23	22/23	LWWDL	10	2	1	2	9	8	WWLLD	8	LDLLD	6	LWWDLLLLDD	14	2	3	5	11	15	LWWDLLLLDDLDWLD	20	3	5	7	16	23	LWWDLLLLDDLDWLDWLDLW	23	5	6	9	20	28	6	4	2	0	66.7	28	33	39.3
7918	Piast Gliwice	42004	Ekstraklasa 22/23	22/23	WDWWD	10	3	2	0	4	3	WWDWW	12	DWWWW	7	WDWWDWWWWW	19	8	2	0	11	5	WDWWDWWWWWDWWLW	25	11	3	1	18	8	WDWWDWWWWWDWWLWLDWLD	30	12	5	3	23	14	9	8	1	0	88.9	23	32	46.4
3121	Lech Poznań	42004	Ekstraklasa 22/23	22/23	WWWWL	9	4	0	1	10	1	WWLWD	10	WWDDW	9	WWWWLDDWDW	19	6	3	1	19	7	WWWWLDDWDWDWLLW	27	8	4	3	28	12	WWWWLDDWDWDWLLWWDDWW	40	11	6	3	36	17	12	12	0	0	100.0	17	29	56.9
3106	Legia Warszawa	42004	Ekstraklasa 22/23	22/23	WLWLW	9	3	0	2	11	5	WWWDW	12	LLLDW	4	WLWLWLDDWW	16	5	2	3	20	11	WLWLWLDDWWWWDWD	21	8	4	3	28	15	WLWLWLDDWWWWDWDWWDWW	32	12	5	3	40	21	14	11	3	0	78.6	21	24	38.1
38732	Stal Mielec	42004	Ekstraklasa 22/23	22/23	WLDDW	9	2	2	1	3	3	WDWDD	6	LDLWD	7	WLDDWLDWDD	13	3	5	2	10	10	WLDDWLDWDDLLLLD	15	3	6	6	11	17	WLDDWLDWDDLLLLDLDDWL	21	4	8	8	15	20	10	8	1	1	80.0	22	17	25.8
7913	KS Lechia Gdańsk	42004	Ekstraklasa 22/23	22/23	LWDLL	7	1	1	3	3	7	WLLLD	6	LDLLL	3	LWDLLLLLDL	9	1	2	7	4	13	LWDLLLLLDLWLLLD	13	2	3	10	9	22	LWDLLLLLDLWLLLDDWWLL	23	4	4	12	15	29	3	2	0	1	66.7	22	15	22.7
4901	Cracovia	42004	Ekstraklasa 22/23	22/23	WDLLD	7	1	2	2	5	6	WLDWD	7	DLWLL	4	WDLLDWWLDL	11	3	3	4	14	15	WDLLDWWLDLDDLWD	20	4	6	5	20	21	WDLLDWWLDLDDLWDLWLWW	27	7	6	7	26	24	9	7	2	0	77.8	22	20	30.3
7295	Radomiak Radom	42004	Ekstraklasa 22/23	22/23	LWWLW	6	3	0	2	6	7	WLDDL	5	LWWLD	5	LWWLWDLDDL	10	3	3	4	8	14	LWWLWDLDDLLLWDD	15	4	5	6	12	18	LWWLWDLDDLLLWDDWDLWL	24	6	6	8	19	24	9	8	1	0	88.9	24	25	34.7
35268	Raków Częstochowa	42004	Ekstraklasa 22/23	22/23	DWLLW	5	2	1	2	7	5	DLWWW	10	WLWDL	5	DWLLWWWDLW	15	5	2	3	16	9	DWLLWWWDLWWWWWD	26	9	3	3	26	11	DWLLWWWDLWWWWWDWDWWW	37	13	4	3	39	15	15	14	1	0	93.3	17	21	41.2
5065	MKS Korona Kielce	42004	Ekstraklasa 22/23	22/23	WLLWL	5	2	0	3	6	7	LWDWW	10	WLLDD	7	WLLWLDWDWD	17	4	3	3	12	11	WLLWLDWDWDWWLWD	29	7	4	4	18	18	WLLWLDWDWDWWLWDWLLLD	33	8	5	7	25	27	10	8	2	0	80.0	24	30	41.7
35330	Miedź Legnica	42004	Ekstraklasa 22/23	22/23	DLLLD	4	0	2	3	5	9	DLLDL	3	LLDDL	6	DLLLDLDDLL	9	0	4	6	8	16	DLLLDLDDLLLDLWD	15	1	6	8	13	25	DLLLDLDDLLLDLWDLDDWW	19	3	8	9	19	28	6	3	2	1	50.0	29	22	25.3
3115	Widzew Łódź	42004	Ekstraklasa 22/23	22/23	LLLWL	3	1	0	4	4	11	LLLLL	5	LWLLD	4	LLLWLLLLDL	9	1	1	8	8	21	LLLWLLLLDLDLDWD	22	2	4	9	12	26	LLLWLLLLDLDLDWDDDWLL	24	3	6	11	18	36	5	5	0	0	100.0	21	22	34.9
7691	Jagiellonia Białystok	42004	Ekstraklasa 22/23	22/23	LDLDW	3	1	2	2	6	10	DDWWD	6	LLWLD	4	LDLDWWLWDD	10	3	4	3	15	17	LDLDWWLWDDWDLDW	23	5	6	4	21	21	LDLDWWLWDDWDLDWDDLLL	31	5	8	7	26	31	9	3	4	2	33.3	28	44	52.4
7922	Warta Poznań	42004	Ekstraklasa 22/23	22/23	LDLLL	1	0	1	4	3	9	DLWWW	10	LLLLD	3	LDLLLWWLDW	13	3	2	5	9	12	LDLLLWWLDWDLWWL	17	5	3	7	17	17	LDLLLWWLDWDLWWLDDDWW	19	7	6	7	25	22	9	8	1	0	88.9	20	12	20.0
3122	Wisła Płock	42004	Ekstraklasa 22/23	22/23	LLLDL	1	0	1	4	2	10	LDLWD	5	LLLLL	0	LLLDLLLWDL	5	1	2	7	9	19	LLLDLLLWDLDWLLL	9	2	3	10	12	24	LLLDLLLWDLDWLLLLLWLL	14	3	3	14	15	35	9	3	3	3	33.3	27	24	29.6
7295	Radomiak Radom	37062	Ekstraklasa 21/22	21/22	DWLDL	11	1	2	2	6	10	WLLDD	5	DDLDD	12	DWLDLLDDDD	17	1	6	3	10	15	DWLDLLDDDDLWLLD	21	2	7	6	14	24	DWLDLLDDDDLWLLDWDWWW	27	6	8	6	24	27	12	8	3	1	66.7	25	31	41.3
36851	Bruk-Bet Termalica Nieciecza	37062	Ekstraklasa 21/22	21/22	DLDWW	11	2	2	1	8	4	LWLDL	6	DDWLD	10	DLDWWLLDDL	15	2	4	4	11	15	DLDWWLLDDLLWWDL	20	4	5	6	14	23	DLDWWLLDDLLWWDLWLLLL	24	5	5	10	18	33	8	3	3	2	37.5	28	32	38.1
3121	Lech Poznań	37062	Ekstraklasa 21/22	21/22	WWWWW	11	5	0	0	12	4	WWWDW	12	WWWWD	7	WWWWWWDWWD	19	8	2	0	19	6	WWWWWWDWWDLWLWD	27	10	3	2	30	11	WWWWWWDWWDLWLWDWLWWW	37	14	3	3	39	16	13	12	1	0	92.3	18	29	53.7
3117	Pogoń Szczecin	37062	Ekstraklasa 21/22	21/22	DDDWL	10	1	3	1	7	6	DWLLW	8	DDWWD	11	DDDWLWLWWD	19	4	4	2	19	11	DDDWLWLWWDWLWWW	28	8	4	3	28	15	DDDWLWLWWDWLWWWDDWWW	38	11	6	3	41	21	16	11	4	1	68.8	24	47	65.3
3106	Legia Warszawa	37062	Ekstraklasa 21/22	21/22	WDWLL	9	2	1	2	12	10	WWLWW	13	DLLDD	9	WDWLLLDWDW	22	4	3	3	20	15	WDWLLLDWDWWWWDL	33	7	4	4	24	17	WDWLLLDWDWWWWDLWLWLL	38	9	4	7	31	23	10	9	1	0	90.0	26	32	41.0
7913	KS Lechia Gdańsk	37062	Ekstraklasa 21/22	21/22	LDWDW	9	2	2	1	7	7	DWWWW	12	LDWLL	4	LDWDWWWLWL	16	5	2	3	15	11	LDWDWWWLWLDLWLW	22	7	3	5	19	16	LDWDWWWLWLDLWLWLLWLD	29	8	4	8	27	28	15	10	5	0	66.7	21	26	41.3
3108	Śląsk Wrocław	37062	Ekstraklasa 21/22	21/22	LDDDL	8	0	3	2	6	11	LDLDL	3	DDDWL	10	LDDDLDDLWD	13	1	6	3	10	15	LDDDLDDLWDLDLDL	17	1	8	6	12	22	LDDDLDDLWDLDLDLLLLWL	21	2	8	10	17	32	10	4	5	1	40.0	28	33	39.3
35268	Raków Częstochowa	37062	Ekstraklasa 21/22	21/22	WLDWW	7	3	1	1	8	4	WDWDD	6	LWWWW	4	WLDWWWDWDW	12	6	3	1	17	7	WLDWWWDWDWWWDWW	23	10	4	1	24	8	WLDWWWDWDWWWDWWWLWLW	33	13	4	3	36	13	13	9	2	2	69.2	19	20	35.1
4901	Cracovia	37062	Ekstraklasa 21/22	21/22	LWDDW	7	2	2	1	5	4	WDWLD	7	LDWLW	5	LWDDWWLWLD	12	4	3	3	9	8	LWDDWWLWLDLLDWD	19	5	5	5	15	16	LWDDWWLWLDLLDWDWLWLW	27	8	5	7	20	20	8	8	0	0	100.0	23	20	29.0
7918	Piast Gliwice	37062	Ekstraklasa 21/22	21/22	DWLWW	6	3	1	1	8	6	DLWWW	10	WWWDW	7	DWLWWWWDWW	17	7	2	1	14	8	DWLWWWWDWWDDWWL	23	9	4	2	19	11	DWLWWWWDWWDDWWLDDLWL	29	10	6	4	24	17	9	6	3	0	66.7	22	31	47.0
3122	Wisła Płock	37062	Ekstraklasa 21/22	21/22	WLLLW	5	2	0	3	7	10	WLLWL	9	LLWWW	3	WLLLWLWWLW	12	5	0	5	14	16	WLLLWLWWLWWLLLD	19	6	1	8	19	25	WLLLWLWWLWWLLLDWWLWW	29	10	1	9	26	29	14	12	0	2	85.7	24	19	26.4
3111	Wisła Kraków	37062	Ekstraklasa 21/22	21/22	LLDDL	5	0	2	3	5	9	LDLWD	5	LDDLD	9	LLDDLDWDLD	11	1	5	4	14	18	LLDDLDWDLDDLDLL	15	1	7	7	16	24	LLDDLDWDLDDLDLLWLDLL	22	2	8	10	22	31	9	4	2	3	44.4	26	23	29.5
3110	Górnik Zabrze	37062	Ekstraklasa 21/22	21/22	WWLDW	5	3	1	1	15	12	WDLDW	7	WLWLL	2	WWLDWLLLDL	6	3	2	5	21	25	WWLDWLLLDLWDDLW	14	5	4	6	28	29	WWLDWLLLDLWDDLWLWDWW	19	8	5	7	38	36	8	6	1	1	75.0	26	28	35.9
3113	Zagłębie Lubin	37062	Ekstraklasa 21/22	21/22	LWWDL	5	2	1	2	12	9	WDLWL	8	LWLLW	2	LWWDLLWLLW	10	4	1	5	18	17	LWWDLLWLLWDDWLL	17	5	3	7	23	23	LWWDLLWLLWDDWLLLLWLL	21	6	3	11	28	37	6	3	0	3	50.0	24	20	27.8
7922	Warta Poznań	37062	Ekstraklasa 21/22	21/22	WLWLL	4	2	0	3	7	7	LLWLW	9	WWLWW	4	WLWLLWWLWW	13	6	0	4	15	10	WLWLLWWLWWLDWWD	20	8	2	5	21	14	WLWLLWWLWWLDWWDDWDLL	27	9	4	7	26	21	7	7	0	0	100.0	23	22	31.9
7691	Jagiellonia Białystok	37062	Ekstraklasa 21/22	21/22	WDDDL	4	1	3	1	5	5	DDLWL	5	WDLDL	7	WDDDLLDWLL	12	2	4	4	10	14	WDDDLLDWLLDDDWL	16	3	7	5	15	19	WDDDLLDWLLDDDWLLWLLW	21	5	7	8	21	29	2	2	0	0	100.0	26	24	30.8
38732	Stal Mielec	37062	Ekstraklasa 21/22	21/22	LDLWL	3	1	1	3	6	11	DWLLD	5	LLLLD	3	LDLWLLLLDL	8	1	2	7	10	20	LDLWLLLLDLDLLWL	11	2	3	10	13	26	LDLWLLLLDLDLLWLDWWLD	20	4	5	11	21	33	12	8	2	2	66.7	26	30	38.5
3125	Górnik Łęczna	37062	Ekstraklasa 21/22	21/22	LLDLL	1	0	1	4	4	11	LDWLL	6	LLLLL	0	LLDLLWLLLL	6	1	1	8	5	19	LLDLLWLLLLLWDDD	15	2	4	9	10	24	LLDLLWLLLLLWDDDWWWLD	24	5	5	10	18	29	6	3	2	1	50.0	26	20	25.6
4901	Cracovia	29222	Ekstraklasa 20/21	20/21	LDWDW	13	2	2	1	3	2	LWWWD	10	DDDLL	9	LDWDWDLWLD	19	3	4	3	7	8	LDWDWDLWLDDLDDL	26	3	7	5	10	14	LDWDWDLWLDDLDDLLLWDW	29	5	8	7	14	19	7	5	2	0	71.4	21	25	39.7
35268	Raków Częstochowa	29222	Ekstraklasa 20/21	20/21	WWWDW	11	4	1	0	7	1	WWWDD	9	WWDWW	7	WWWDWWWWDD	19	7	3	0	16	5	WWWDWWWWDDDWWLL	24	9	4	2	19	9	WWWDWWWWDDDWWLLLDWLW	34	11	5	4	23	13	12	10	2	0	83.3	18	30	55.6
7922	Warta Poznań	29222	Ekstraklasa 20/21	20/21	WLDWL	9	2	1	2	6	6	LWLDW	8	WDWWL	6	WLDWLWDWWL	14	5	2	3	13	10	WLDWLWDWWLWLWWD	25	8	3	4	19	13	WLDWLWDWWLWLWWDWLLLL	29	9	3	8	25	22	6	4	0	2	66.7	19	19	33.3
38732	Stal Mielec	29222	Ekstraklasa 20/21	20/21	DDLWW	8	2	2	1	4	3	DLWLW	8	DWDDL	10	DDLWWDLDLW	18	3	4	3	10	12	DDLWWDLDLWLDLDL	19	3	6	6	14	19	DDLWWDLDLWLDLDLDWDLW	23	5	8	7	21	25	5	2	1	2	40.0	25	32	42.7
3106	Legia Warszawa	29222	Ekstraklasa 20/21	20/21	WDDWW	8	3	2	0	3	0	WDDWW	9	DWWDW	9	WDDWWDDWWW	18	6	4	0	14	4	WDDWWDDWWWWWWDW	29	10	5	0	25	8	WDDWWDDWWWWWWDWLLWWD	34	12	6	2	33	15	9	9	0	0	100.0	15	27	60.0
7918	Piast Gliwice	29222	Ekstraklasa 20/21	20/21	LLWDL	8	1	1	3	6	7	LWLWW	11	LDDWD	10	LLWDLDWWWD	21	4	3	3	13	9	LLWDLDWWWDWWLDW	32	7	4	4	18	11	LLWDLDWWWDWWLDWWDWDD	37	9	7	4	30	17	8	7	1	0	87.5	18	20	37.0
3122	Wisła Płock	29222	Ekstraklasa 20/21	20/21	WDLWL	8	2	1	2	8	5	WLDLD	5	DWLLD	7	WDLWLDLLDD	12	2	4	4	12	12	WDLWLDLLDDLDLLW	19	3	5	7	18	24	WDLWLDLLDDLDLLWWWWLD	25	6	6	8	25	26	6	4	2	0	66.7	21	22	34.9
3117	Pogoń Szczecin	29222	Ekstraklasa 20/21	20/21	LDDLW	7	1	2	2	4	6	LDWWW	10	DLWLW	5	LDDLWWWLWW	15	5	2	3	12	10	LDDLWWWLWWLLLDW	19	6	3	6	15	15	LDDLWWWLWWLLLDWWWWWW	28	11	3	6	25	16	10	9	1	0	90.0	13	6	15.4
3110	Górnik Zabrze	29222	Ekstraklasa 20/21	20/21	DWLLL	7	1	1	3	4	6	WLDLW	8	DLLLD	6	DWLLLDLLDW	14	2	3	5	8	11	DWLLLDLLDWDLLWL	21	3	4	8	12	18	DWLLLDLLDWDLLWLDLLWW	26	5	5	10	16	23	8	5	2	1	62.5	21	22	34.9
3113	Zagłębie Lubin	29222	Ekstraklasa 20/21	20/21	LDDDW	6	1	3	1	7	8	DDWWL	7	LDWLL	4	LDDDWWWLLL	11	3	3	4	12	18	LDDDWWWLLLWWLLD	19	5	4	6	20	23	LDDDWWWLLLWWLLDLLWDW	27	7	5	8	25	29	7	4	3	0	57.1	23	20	29.0
3121	Lech Poznań	29222	Ekstraklasa 20/21	20/21	DWLLW	5	2	1	2	7	5	DLWDL	5	WLLLW	2	DWLLWLDLLD	6	2	3	5	11	13	DWLLWLDLLDWWWLD	11	5	4	6	15	15	DWLLWLDLLDWWWLDDLLDW	22	6	6	8	21	22	9	4	2	3	44.4	21	16	25.4
3111	Wisła Kraków	29222	Ekstraklasa 20/21	20/21	WLDDL	5	1	2	2	5	8	LDLLW	6	WDLLL	4	WLDDLLLLWL	10	2	2	6	9	16	WLDDLLLLWLDWWDW	20	5	4	6	17	19	WLDDLLLLWLDWWDWLWLDL	27	6	5	9	24	28	7	4	0	3	57.1	21	29	46.0
3108	Śląsk Wrocław	29222	Ekstraklasa 20/21	20/21	DWDLW	4	2	2	1	8	8	DDWDD	3	WLDWD	8	DWDLWDDWDD	11	3	6	1	12	11	DWDLWDDWDDLWLDL	15	4	7	4	15	17	DWDLWDDWDDLWLDLDWLWW	25	7	8	5	21	20	9	6	1	2	66.7	21	21	33.3
7919	Podbeskidzie Bielsko-Biała	29222	Ekstraklasa 20/21	20/21	LDLWL	3	1	1	3	5	8	DWLWD	7	LLLLL	0	LDLWLLLWLL	7	2	1	7	9	16	LDLWLLLWLLDLDDW	13	3	4	8	15	22	LDLWLLLWLLDLDDWWLLLL	18	4	4	12	17	37	8	3	3	2	37.5	26	20	25.6
7691	Jagiellonia Białystok	29222	Ekstraklasa 20/21	20/21	WLDLD	3	1	2	2	6	9	WDDWL	7	LLDWL	4	WLDLDDWLWL	12	3	3	4	13	16	WLDLDDWLWLLLDDL	16	3	5	7	15	24	WLDLDDWLWLLLDDLWWLWL	23	6	5	9	25	33	8	6	2	0	75.0	26	27	34.6
7913	KS Lechia Gdańsk	29222	Ekstraklasa 20/21	20/21	LDWLL	2	1	1	3	5	8	DLDWW	7	LWLDL	4	LDWLLDDWLW	11	3	3	4	13	13	LDWLLDDWLWDWWWD	19	6	5	4	20	16	LDWLLDDWLWDWWWDLWLLL	23	7	5	8	23	22	9	7	1	1	77.8	23	26	37.7
3121	Lech Poznań	23666	Ekstraklasa 19/20	19/20	WWWWD	13	4	1	0	13	6	WWWDW	12	WDWWD	9	WWWWDDWWWD	21	7	3	0	25	9	WWWWDDWWWDLDWDW	34	9	5	1	33	13	WWWWDDWWWDLDWDWLWDDW	43	11	7	2	41	17	14	12	1	1	85.7	23	38	55.1
3122	Wisła Płock	23666	Ekstraklasa 19/20	19/20	LWWWW	10	4	0	1	8	3	WWWDL	10	LWLDD	7	LWWWWLDDLD	17	4	3	3	12	9	LWWWWLDDLDLWLDD	23	5	5	5	18	19	LWWWWLDDLDLWLDDDLWLL	30	6	6	8	23	28	12	7	2	3	58.3	29	39	44.8
7918	Piast Gliwice	23666	Ekstraklasa 19/20	19/20	DLWWD	9	2	2	1	5	3	DWWLD	7	LDLWW	5	DLWWDLLWDW	12	4	3	3	9	7	DLWWDLLWDWWWWLW	22	8	3	4	17	10	DLWWDLLWDWWWWLWLWLWL	28	10	3	7	22	15	12	10	1	1	83.3	22	21	31.8
3113	Zagłębie Lubin	23666	Ekstraklasa 19/20	19/20	WWLWW	9	4	0	1	9	4	WLWWD	10	WWLLW	3	WWLWWLWLDD	12	5	2	3	17	13	WWLWWLWLDDWDLWD	19	7	4	4	30	22	WWLWWLWLDDWDLWDLLWLW	24	9	4	7	34	28	14	12	2	0	85.7	30	28	31.1
4901	Cracovia	23666	Ekstraklasa 19/20	19/20	DLLWW	8	2	1	2	7	6	LWLDL	6	DLWLW	5	DLLWWLLDWL	10	3	2	5	14	14	DLLWWLLDWLLLLLL	12	3	2	10	17	23	DLLWWLLDWLLLLLLWWWLW	22	7	2	11	25	25	9	8	1	0	88.9	26	24	30.8
5064	MZKS Arka Gdynia	23666	Ekstraklasa 19/20	19/20	WLWDL	8	2	1	2	8	8	LWWDW	10	WDLDL	7	WLWDLWDDLW	17	4	3	3	14	16	WLWDLWDDLWLLLDW	21	5	4	6	22	26	WLWDLWDDLWLLLDWLLDWW	29	7	5	8	26	31	8	5	3	0	62.5	29	27	31.0
7691	Jagiellonia Białystok	23666	Ekstraklasa 19/20	19/20	LWLDL	7	1	1	3	5	11	WLDLD	5	LLDWW	5	LWLDLDWLWD	10	3	3	4	12	16	LWLDLDWLWDWWWDL	15	6	4	5	17	22	LWLDLDWLWDWWWDLDLLWL	19	7	5	8	20	29	13	8	2	3	61.5	26	34	43.6
3106	Legia Warszawa	23666	Ekstraklasa 19/20	19/20	LDWLD	7	1	2	2	5	5	LWDWW	10	DLDLW	7	LDWLDDWLWW	17	4	3	3	15	9	LDWLDDWLWWWLWWW	26	8	3	4	25	12	LDWLDDWLWWWLWWWDWLWW	36	11	4	5	37	18	14	13	0	1	92.9	23	32	46.4
35268	Raków Częstochowa	23666	Ekstraklasa 19/20	19/20	WLLLW	7	2	0	3	9	12	WLWWW	13	LLWLD	4	WLLLWWWWLD	14	5	1	4	18	18	WLLLWWWWLDDDWWL	21	7	3	5	25	22	WLLLWWWWLDDDWWLDLWWL	25	9	4	7	32	31	13	8	1	4	61.5	28	33	39.3
3117	Pogoń Szczecin	23666	Ekstraklasa 19/20	19/20	WWDDL	7	2	2	1	8	7	WDLDW	7	WDLDL	7	WWDDLDLDLW	14	3	4	3	10	13	WWDDLDLDLWLDLLD	22	3	6	6	12	21	WWDDLDLDLWLDLLDDWLLW	27	5	7	8	16	25	10	7	3	0	70.0	23	22	31.9
3110	Górnik Zabrze	23666	Ekstraklasa 19/20	19/20	LWWLL	6	2	0	3	6	6	LWLWW	11	WLWDW	6	LWWLLWWWDD	16	5	2	3	16	11	LWWLLWWWDDWWLWL	23	8	2	5	25	20	LWWLLWWWDDWWLWLWDWLW	35	11	3	6	35	24	9	8	1	0	88.9	27	32	39.5
5065	MKS Korona Kielce	23666	Ekstraklasa 19/20	19/20	WLDDL	6	1	2	2	6	7	WDLLL	6	LDLLD	6	WLDDLLLLDL	12	1	3	6	10	17	WLDDLLLLDLWWLLL	17	3	3	9	17	24	WLDDLLLLDLWWLLLDDWWL	25	5	5	10	19	25	7	4	2	1	57.1	26	19	24.4
3123	ŁKS Łódź	23666	Ekstraklasa 19/20	19/20	LWLLL	4	1	0	4	6	11	WLLLL	7	LLLLL	0	LWLLLLLLLD	9	1	1	8	8	23	LWLLLLLLLDLLWDD	16	2	3	10	12	28	LWLLLLLLLDLLWDDDLLLL	17	2	4	14	16	39	7	4	1	2	57.1	32	29	30.2
3111	Wisła Kraków	23666	Ekstraklasa 19/20	19/20	LLDWW	3	2	1	2	5	6	LDWWL	8	LWWLD	5	LLDWWWLDWL	13	4	2	4	11	14	LLDWWWLDWLLDWDW	17	6	4	5	18	21	LLDWWWLDWLLDWDWWWWWL	25	10	4	6	29	27	10	7	1	2	70.0	26	18	23.1
7913	KS Lechia Gdańsk	23666	Ekstraklasa 19/20	19/20	WDLLW	3	2	1	2	6	8	DLWLW	8	WLWWD	6	WDLLWWWDLD	14	4	3	3	12	14	WDLLWWWDLDWDLWL	22	6	4	5	22	26	WDLLWWWDLDWDLWLWDLLW	32	8	5	7	27	34	11	8	3	0	72.7	28	36	42.9
3108	Śląsk Wrocław	23666	Ekstraklasa 19/20	19/20	LLDLD	1	0	2	3	6	9	LDDWW	7	LLLWL	1	LLDLDWLWWL	8	3	2	5	16	16	LLDLDWLWWLDLWLW	14	5	3	7	22	23	LLDLDWLWWLDLWLWDDLDL	18	5	6	9	25	31	12	8	3	1	66.7	30	31	34.4
7918	Piast Gliwice	17361	Ekstraklasa 18/19	18/19	WDWWW	13	4	1	0	7	2	WWWWW	15	DWWDL	8	WDWWWWWWDW	26	8	2	0	17	4	WDWWWWWWDWLWWWW	34	12	2	1	25	8	WDWWWWWWDWLWWWWWLDLD	40	13	4	3	33	15	17	16	1	0	94.1	21	33	52.4
3113	Zagłębie Lubin	17361	Ekstraklasa 18/19	18/19	DLDDW	13	1	3	1	7	6	LWLWD	8	DDDLW	10	DLDDWLLWWD	18	3	4	3	15	12	DLDDWLLWWDWDWWL	23	6	5	4	21	15	DLDDWLLWWDWDWWLWWLWD	29	9	6	5	33	20	13	10	1	2	76.9	28	34	40.5
3108	Śląsk Wrocław	17361	Ekstraklasa 18/19	18/19	WWWWD	11	4	1	0	13	4	WWLLD	8	WWDLL	5	WWWWDLLLLD	13	4	2	4	14	11	WWWWDLLLLDWLWLW	20	7	2	6	20	14	WWWWDLLLLDWLWLWLWLDL	23	8	3	9	24	20	12	7	3	2	58.3	27	33	40.7
5064	MZKS Arka Gdynia	17361	Ekstraklasa 18/19	18/19	LWWDW	10	3	1	1	8	6	WWWDD	9	LDWLD	7	LWWDWWLDDD	16	4	4	2	14	11	LWWDWWLDDDLDLLL	22	4	5	6	16	18	LWWDWWLDDDLDLLLLLDDL	27	4	7	9	23	30	6	4	0	2	66.7	28	30	35.7
35330	Miedź Legnica	17361	Ekstraklasa 18/19	18/19	WLLDW	9	2	1	2	8	9	LLWDW	8	WDLDD	10	WLLDWLDDWD	18	3	4	3	13	15	WLLDWLDDWDLLWLW	25	5	4	6	19	24	WLLDWLDDWDLLWLWLLDDW	30	6	6	8	22	31	9	6	2	1	66.7	29	29	33.3
4901	Cracovia	17361	Ekstraklasa 18/19	18/19	LWWWL	8	3	0	2	6	7	LWWLW	11	WLLLW	2	LWWWLLLWLW	15	5	0	5	13	14	LWWWLLLWLWWLWLW	22	8	0	7	21	21	LWWWLLLWLWWLWLWWWWWW	31	13	0	7	32	24	8	8	0	0	100.0	25	30	40.0
3110	Górnik Zabrze	17361	Ekstraklasa 18/19	18/19	WLWLW	7	3	0	2	9	3	LLWWL	9	WWWWD	7	WLWLWWWWLD	16	6	1	3	15	7	WLWLWWWWLDLWLDW	25	8	2	5	22	13	WLWLWWWWLDLWLDWLWLDL	29	9	3	8	27	24	12	6	4	2	50.0	28	25	29.8
7691	Jagiellonia Białystok	17361	Ekstraklasa 18/19	18/19	LWLWL	6	2	0	3	6	8	WWDWL	10	LLLWW	2	LWLWLWDWWL	11	5	1	4	14	15	LWLWLWDWWLDLLDL	15	5	3	7	17	23	LWLWLWDWWLDLLDLWWDLD	26	7	5	8	24	30	13	11	2	0	84.6	28	37	44.0
3121	Lech Poznań	17361	Ekstraklasa 18/19	18/19	LWLDD	6	1	2	2	4	5	WDWLW	10	LLDDL	6	LWLDDWDLLW	16	3	3	4	11	13	LWLDDWDLLWDLLWW	26	5	4	6	16	19	LWLDDWDLLWDLLWWLLWWW	32	8	4	8	26	25	14	10	3	1	71.4	27	33	40.7
3111	Wisła Kraków	17361	Ekstraklasa 18/19	18/19	LLWWD	5	2	1	2	9	10	LWDLD	5	LWLLL	1	LLWWDLLLDL	6	2	2	6	18	24	LLWWDLLLDLWWWLL	14	5	2	8	33	32	LLWWDLLLDLWWWLLWLLWD	19	7	3	10	38	38	13	8	3	2	61.5	30	24	26.7
7693	Zagłębie Sosnowiec	17361	Ekstraklasa 18/19	18/19	DLLLL	5	0	1	4	4	14	LLWLW	9	DLLDL	6	DLLLLWDLLW	15	2	2	6	14	25	DLLLLWDLLWWLLWL	20	4	2	9	22	31	DLLLLWDLLWWLLWLWLLLL	25	5	2	13	27	45	8	4	2	2	50.0	33	33	33.3
7913	KS Lechia Gdańsk	17361	Ekstraklasa 18/19	18/19	WLDLL	4	1	1	3	5	8	WDLLW	8	LLWLD	4	WLDLLWLLWD	12	3	2	5	12	17	WLDLLWLLWDWWDLW	19	6	3	6	18	20	WLDLLWLLWDWWDLWDWWDD	31	8	6	6	24	21	18	15	2	1	83.3	19	19	33.3
3117	Pogoń Szczecin	17361	Ekstraklasa 18/19	18/19	WDDLD	4	1	3	1	7	6	DDLDD	1	WDLWL	5	WDDLDLWLDL	6	2	4	4	19	21	WDDLDLWLDLDWLWD	12	4	6	5	25	27	WDDLDLWLDLDWLWDWLWLW	21	7	6	7	33	33	17	9	5	3	52.9	27	28	34.6
5065	MKS Korona Kielce	17361	Ekstraklasa 18/19	18/19	LWLDL	3	1	1	3	4	8	LDLWL	6	WLLLL	1	LWLDLLWLLL	7	2	1	7	8	18	LWLDLLWLLLDWLLD	9	3	3	9	15	30	LWLDLLWLLLDWLLDDWDDD	13	4	7	9	20	34	9	7	1	1	77.8	29	34	39.1
3106	Legia Warszawa	17361	Ekstraklasa 18/19	18/19	DLDLW	2	1	2	2	6	6	DDLWW	7	LWLWL	2	DLDLWLWWWW	12	5	2	3	15	9	DLDLWLWWWWLWWWL	19	8	2	5	20	16	DLDLWLWWWWLWWWLLWWWD	28	11	3	6	26	20	11	10	1	0	90.9	23	20	29.0
3122	Wisła Płock	17361	Ekstraklasa 18/19	18/19	DWLDL	1	1	2	2	5	6	DDWWL	7	WLLWW	3	DWLDLWWWWL	9	5	2	3	15	11	DWLDLWWWWLLLDWL	17	6	3	6	20	19	DWLDLWWWWLLLDWLLLDLD	25	6	5	9	26	28	9	6	3	0	66.7	31	35	37.6
3108	Śląsk Wrocław	13350	Ekstraklasa 17/18	17/18	WWWDW	13	4	1	0	12	5	WWWWD	12	WDWLL	5	WWWDWWWDLD	17	6	3	1	19	11	WWWDWWWDLDLDLDL	17	6	5	4	23	21	WWWDWWWDLDLDLDLLWLDL	20	7	6	7	29	30	11	9	1	1	81.8	29	33	37.9
3106	Legia Warszawa	13350	Ekstraklasa 17/18	17/18	WWWDW	13	4	1	0	11	3	WWWLW	13	WDWLW	6	WWWDWWLWLL	19	6	1	3	15	7	WWWDWWLWLLWWLDW	30	9	2	4	24	12	WWWDWWLWLLWWLDWWLWWD	39	12	3	5	33	18	17	16	0	1	94.1	22	28	42.4
36766	Sandecja Nowy Sącz	13350	Ekstraklasa 17/18	17/18	DLDWL	10	1	2	2	4	6	LWWDL	8	DDLLD	9	DLDWLWLDDL	16	2	4	4	10	12	DLDWLWLDDLLDLLD	21	2	6	7	13	20	DLDWLWLDDLLDLLDLDDLD	25	2	9	9	20	31	6	2	3	1	33.3	31	32	34.4
3121	Lech Poznań	13350	Ekstraklasa 17/18	17/18	LDLDL	9	0	2	3	3	10	LLLLW	7	DDWWL	8	LDLDLWLWWW	18	4	2	4	13	13	LDLDLWLWWWWLWLW	27	7	2	6	23	18	LDLDLWLWWWWLWLWDWDWD	42	9	5	6	27	19	12	11	1	0	91.7	22	33	50.0
3117	Pogoń Szczecin	13350	Ekstraklasa 17/18	17/18	WDLWW	7	3	1	1	10	6	DWWWW	12	WLDLW	5	WDLWWDWLWW	17	6	2	2	19	13	WDLWWDWLWWLDDWL	27	7	4	4	21	19	WDLWWDWLWWLDDWLWWWDL	34	10	5	5	32	25	10	7	1	2	70.0	27	22	27.2
7691	Jagiellonia Białystok	13350	Ekstraklasa 17/18	17/18	WWWDL	6	3	1	1	6	3	WDLLL	6	WWWLL	3	WWWDLWLLLW	12	5	1	4	14	11	WWWDLWLLLWLWWWW	22	9	1	5	24	17	WWWDLWLLLWLWWWWWLWWW	30	13	1	6	33	19	10	9	1	0	90.0	23	32	46.4
3111	Wisła Kraków	13350	Ekstraklasa 17/18	17/18	LDWWW	5	3	1	1	8	3	DWLLW	8	LWWDD	8	LDWWWLDDLW	14	4	3	3	13	9	LDWWWLDDLWWLDDW	23	6	5	4	20	15	LDWWWLDDLWWLDDWDLWLL	30	7	6	7	28	23	11	6	4	1	54.5	24	29	40.3
7918	Piast Gliwice	13350	Ekstraklasa 17/18	17/18	WLLLW	5	2	0	3	11	8	WLDDD	4	LLWLL	1	WLLLWDLDLD	5	2	3	5	13	12	WLLLWDLDLDWDDWL	11	4	5	6	18	14	WLLLWDLDLDWDDWLDLDDD	21	4	9	7	23	20	5	4	1	0	80.0	25	25	33.3
5065	MKS Korona Kielce	13350	Ekstraklasa 17/18	17/18	LLDLL	5	0	1	4	4	14	LLLWD	6	LDLWD	7	LLDLLLWDWD	13	2	3	5	9	20	LLDLLLWDWDLDDWD	22	3	6	6	14	26	LLDLLLWDWDLDDWDWDLLD	27	4	8	8	21	37	12	9	3	0	75.0	25	39	52.0
4901	Cracovia	13350	Ekstraklasa 17/18	17/18	LWLDW	5	2	1	2	9	11	LDWWD	7	WLDLW	5	LWLDWDWDLW	14	4	3	3	15	17	LWLDWDWDLWWWWDL	19	7	4	4	21	19	LWLDWDWDLWWWWDLWWLLD	24	9	5	6	30	27	11	7	3	1	63.6	29	29	33.3
3110	Górnik Zabrze	13350	Ekstraklasa 17/18	17/18	WLDWW	5	3	1	1	10	6	WDLDD	4	LWWWL	3	WLDWWLWLDD	10	4	3	3	17	15	WLDWWLWLDDDDDWL	16	5	6	4	25	22	WLDWWLWLDDDDDWLLLDWW	21	7	7	6	32	31	14	8	6	0	57.1	30	32	35.6
7913	KS Lechia Gdańsk	13350	Ekstraklasa 17/18	17/18	DDWLL	5	1	2	2	5	6	DLDWL	5	DWLWL	5	DDWLLDWWLL	9	3	3	4	11	13	DDWLLDWWLLLDDLL	14	3	5	7	15	24	DDWLLDWWLLLDDLLDDLDW	24	4	8	8	23	32	7	6	1	0	85.7	29	27	31.0
5064	MZKS Arka Gdynia	13350	Ekstraklasa 17/18	17/18	LLWLL	5	1	0	4	6	11	LWLLW	9	LLLLL	0	LLWLLLLLWL	9	2	0	8	13	23	LLWLLLLLWLWLDDL	15	3	2	10	20	28	LLWLLLLLWLWLDDLDLWWL	19	5	3	12	24	31	8	8	0	0	100.0	24	18	25.0
36851	Bruk-Bet Termalica Nieciecza	13350	Ekstraklasa 17/18	17/18	LWDWL	4	2	1	2	6	10	WDLWL	8	LWLLD	4	LWDWLLLDWL	12	3	2	5	12	19	LWDWLLLDWLLLDWL	19	4	3	8	16	30	LWDWLLLDWLLLDWLLLWLL	23	5	3	12	21	44	5	1	1	3	20.0	32	32	33.3
3113	Zagłębie Lubin	13350	Ekstraklasa 17/18	17/18	WLLLW	4	2	0	3	5	8	LLLWD	6	WLWWD	6	WLLLWLWDWD	15	4	2	4	9	11	WLLLWLWDWDDDWDL	19	5	5	5	12	15	WLLLWLWDWDDDWDLLWDDW	27	7	7	6	23	24	9	8	1	0	88.9	23	31	44.9
3122	Wisła Płock	13350	Ekstraklasa 17/18	17/18	LWLDL	4	1	1	3	8	8	WDLDW	7	LLWWD	5	LWLDLWDWWD	12	4	3	3	16	12	LWLDLWDWWDWWLLW	20	7	3	5	23	16	LWLDLWDWWDWWLLWWWDWW	28	11	4	5	34	20	9	8	0	1	88.9	26	30	38.5
7913	KS Lechia Gdańsk	11734	Ekstraklasa 16/17	16/17	DWDWD	12	2	3	0	8	0	WWDWW	12	DDWLD	10	DWDWDWWLWD	22	5	4	1	15	5	DWDWDWWLWDWLLLW	29	7	4	4	22	12	DWDWDWWLWDWLLLWDWLWL	38	9	5	6	29	18	15	14	1	0	93.3	23	37	53.6
3106	Legia Warszawa	11734	Ekstraklasa 16/17	16/17	DWDWW	10	3	2	0	9	0	DWWDD	6	WDWWW	7	DWDWWWDWDW	13	6	4	0	16	3	DWDWWWDWDWWWWWD	21	10	5	0	25	6	DWDWWWDWDWWWWWDLWWWD	27	13	6	1	39	12	14	12	2	0	85.7	19	14	24.6
3108	Śląsk Wrocław	11734	Ekstraklasa 16/17	16/17	WWWLW	10	4	0	1	15	3	WWWLD	10	WLLDL	4	WWWLWLLDDL	14	4	2	4	18	11	WWWLWLLDDLWWLLL	19	6	2	7	27	22	WWWLWLLDDLWWLLLWDLLD	26	7	4	9	30	29	10	8	2	0	80.0	26	25	32.1
3113	Zagłębie Lubin	11734	Ekstraklasa 16/17	16/17	LWWWW	9	4	0	1	11	6	LWWDD	7	WWDLL	5	LWWWWDDDLL	13	4	3	3	18	15	LWWWWDDDLLLLDWL	19	5	4	6	21	21	LWWWWDDDLLLLDWLLWWDW	29	8	5	7	27	25	11	8	2	1	72.7	28	30	35.7
3121	Lech Poznań	11734	Ekstraklasa 16/17	16/17	DWDLW	9	2	2	1	6	5	WDWWW	12	DLWWD	8	DWDLWWWWWL	18	6	2	2	19	9	DWDLWWWWWLDDWWW	26	9	4	2	27	10	DWDLWWWWWLDDWWWWWDWL	36	12	5	3	36	13	15	14	1	0	93.3	17	23	45.1
5065	MKS Korona Kielce	11734	Ekstraklasa 16/17	16/17	LLWWD	8	2	1	2	5	6	LWDLW	8	LWDLD	7	LLWWDDLLDW	15	3	3	4	9	11	LLWWDDLLDWLWLWL	21	5	3	7	16	23	LLWWDDLLDWLWLWLWLWLL	27	7	3	10	22	29	8	6	0	2	75.0	29	28	32.2
7918	Piast Gliwice	11734	Ekstraklasa 16/17	16/17	WWWWL	8	4	0	1	11	4	WWWLD	10	WWLDL	5	WWWWLWDLLD	15	5	2	3	15	8	WWWWLWDLLDDWWLL	23	7	3	5	23	16	WWWWLWDLLDDWWLLLLLLW	28	8	3	9	27	28	9	7	1	1	77.8	28	28	33.3
4901	Cracovia	11734	Ekstraklasa 16/17	16/17	LLWLD	7	1	1	3	3	7	LWWLW	11	LLDDD	9	LLWLDWDLDW	20	3	3	4	9	11	LLWLDWDLDWLLDDL	20	3	5	7	14	24	LLWLDWDLDWLLDDLDWDDD	24	4	9	7	19	28	10	6	4	0	60.0	29	32	36.8
3125	Górnik Łęczna	11734	Ekstraklasa 16/17	16/17	DLLWL	7	1	1	3	7	8	LWLWL	9	DLLWD	7	DLLWLLWWDL	16	3	2	5	18	17	DLLWLLWWDLWDDLL	21	4	4	7	25	24	DLLWLLWWDLWDDLLWLLWD	30	6	5	9	30	35	8	4	2	2	50.0	27	29	35.8
36851	Bruk-Bet Termalica Nieciecza	11734	Ekstraklasa 16/17	16/17	WLLDL	6	1	1	3	4	12	LLLWL	7	WDLLW	5	WLLDLLLWWL	12	3	1	6	8	20	WLLDLLLWWLLLLDD	16	3	3	9	10	25	WLLDLLLWWLLLLDDDLWLL	20	4	4	12	13	33	10	10	0	0	100.0	28	27	32.1
5064	MZKS Arka Gdynia	11734	Ekstraklasa 16/17	16/17	WDLLW	5	2	1	2	6	7	DLWDD	4	WLLLL	1	WDLLWLDDLL	5	2	3	5	10	18	WDLLWLDDLLLLLDW	13	3	4	8	20	31	WDLLWLDDLLLLLDWLLWLW	17	5	4	11	26	37	11	7	3	1	63.6	28	17	20.2
3111	Wisła Kraków	11734	Ekstraklasa 16/17	16/17	LLWLL	4	1	0	4	8	9	LWLWD	8	LLLDL	3	LLWLLLDLWW	12	3	1	6	14	16	LLWLLLDLWWDWLWW	19	6	2	7	22	21	LLWLLLDLWWDWLWWLWLDW	25	8	3	9	28	24	11	8	1	2	72.7	29	31	35.6
3105	Ruch Chorzów	11734	Ekstraklasa 16/17	16/17	DDLLL	4	0	2	3	3	14	DLDLD	2	DLLDL	6	DDLLLDDLLL	8	0	4	6	6	22	DDLLLDDLLLDWWDW	18	3	6	6	11	23	DDLLLDDLLLDWWDWWLWLL	24	5	6	9	19	31	6	5	1	0	83.3	30	27	30.0
7691	Jagiellonia Białystok	11734	Ekstraklasa 16/17	16/17	DWDLW	4	2	2	1	6	7	DDWWD	6	WLDWW	6	DWDLWDWWDW	12	5	4	1	13	11	DWDLWDWWDWWDWWL	24	8	5	2	23	16	DWDLWDWWDWWDWWLWLLWW	32	11	5	4	34	24	17	16	0	1	94.1	23	34	49.3
3122	Wisła Płock	11734	Ekstraklasa 16/17	16/17	LLLWD	3	1	1	3	3	10	LLDDL	3	LWWDW	6	LLLWDWDDLW	9	3	3	4	11	19	LLLWDWDDLWWLWDW	21	6	4	5	21	25	LLLWDWDDLWWLWDWLDWWD	28	8	6	6	32	36	8	6	1	1	75.0	29	35	40.2
3117	Pogoń Szczecin	11734	Ekstraklasa 16/17	16/17	WLLDL	3	1	1	3	4	11	WDLWW	10	LLLLW	1	WLLDLLLWWW	11	4	1	5	14	17	WLLDLLLWWWLDDDL	15	4	4	7	17	25	WLLDLLLWWWLDDDLDWLDD	24	5	7	8	22	31	6	5	1	0	83.3	31	37	39.8
3110	Górnik Zabrze	10361	Ekstraklasa 15/16	15/16	DDDWD	12	1	4	0	3	2	DWWDD	6	DDDLL	9	DDDWDWLLDD	18	2	6	2	7	8	DDDWDWLLDDDLLDL	23	2	8	5	9	16	DDDWDWLLDDDLLDLLWDWW	28	5	9	6	21	25	4	2	2	0	50.0	28	25	29.8
3113	Zagłębie Lubin	10361	Ekstraklasa 15/16	15/16	WWWWW	11	5	0	0	13	2	WWWLW	13	WWLDW	6	WWWWWLLDWW	19	7	1	2	21	7	WWWWWLLDWWDWWWL	25	10	2	3	28	11	WWWWWLLDWWDWWWLDLLWL	33	11	3	6	32	19	13	10	2	1	76.9	24	33	45.8
3108	Śląsk Wrocław	10361	Ekstraklasa 15/16	15/16	WDWLW	10	3	1	1	9	7	WWWWD	12	DLWDW	8	WDWLWWDWWD	20	6	3	1	16	10	WDWLWWDWWDDLLDL	24	6	5	4	19	17	WDWLWWDWWDDLLDLWWWLD	34	9	6	5	24	20	11	7	4	0	63.6	28	41	48.8
5065	MKS Korona Kielce	10361	Ekstraklasa 15/16	15/16	LDDWD	10	1	3	1	6	7	LWDDW	7	DDDWD	13	LDDWDDDWWD	17	3	6	1	11	10	LDDWDDDWWDDDDLW	23	4	9	2	21	19	LDDWDDDWWDDDDLWLLDLL	28	4	10	6	27	30	9	5	3	1	55.6	25	27	36.0
3106	Legia Warszawa	10361	Ekstraklasa 15/16	15/16	WLWLW	9	3	0	2	11	4	WWWWD	12	LLDDW	7	WLWLWDWDDW	19	5	3	2	15	5	WLWLWDWDDWWWLWW	27	9	3	3	24	11	WLWLWDWDDWWWLWWWWDWW	35	13	4	3	36	14	17	14	3	0	82.4	22	25	37.9
7913	KS Lechia Gdańsk	10361	Ekstraklasa 15/16	15/16	LWWDL	9	2	1	2	4	6	WWWWD	12	LDLWD	7	LWWDLWWWDD	19	5	3	2	12	9	LWWDLWWWDDDWLWL	28	7	4	4	23	17	LWWDLWWWDDDWLWLWLWWL	37	10	4	6	32	21	10	9	1	0	90.0	24	30	41.7
7918	Piast Gliwice	10361	Ekstraklasa 15/16	15/16	LWLWW	8	3	0	2	8	6	LWWDW	10	WLDLD	7	LWLWWDDWLD	17	4	3	3	15	14	LWLWWDDWLDWWDLD	26	6	5	4	21	20	LWLWWDDWLDWWDLDDWDDL	35	7	8	5	28	28	18	15	2	1	83.3	22	35	53.0
3125	Górnik Łęczna	10361	Ekstraklasa 15/16	15/16	LWDWD	7	2	2	1	10	5	WDLLL	6	LWDLD	7	LWDWDLLLDL	13	2	3	5	10	13	LWDWDLLLDLLLLWD	20	3	4	8	15	21	LWDWDLLLDLLLLWDDWLLL	24	4	5	11	22	29	8	8	0	0	100.0	27	36	44.4
3117	Pogoń Szczecin	10361	Ekstraklasa 15/16	15/16	LWLLW	7	2	0	3	6	10	WLWDD	7	LLLDD	6	LWLLWLDDDD	10	2	4	4	10	16	LWLLWLDDDDDLDDD	20	2	8	5	14	21	LWLLWLDDDDDLDDDWWWWW	31	7	8	5	24	25	8	6	1	1	75.0	25	32	42.7
4901	Cracovia	10361	Ekstraklasa 15/16	15/16	WLWWL	7	3	0	2	7	7	WWWDL	10	LWLDL	4	WLWWLWDLDD	16	4	3	3	12	12	WLWWLWDLDDLLWLD	22	5	4	6	19	21	WLWWLWDLDDLLWLDWDDDW	34	7	7	6	32	28	13	10	1	2	76.9	26	39	50.0
36851	Bruk-Bet Termalica Nieciecza	10361	Ekstraklasa 15/16	15/16	DWLLD	5	1	2	2	5	7	DLDLL	3	WLDWL	5	DWLLDDWLLD	10	2	4	4	7	11	DWLLDDWLLDLWWDD	18	4	6	5	16	18	DWLLDDWLLDLWWDDLLWDL	25	5	7	8	20	26	6	6	0	0	100.0	25	24	32.0
7691	Jagiellonia Białystok	10361	Ekstraklasa 15/16	15/16	WLLWD	5	2	1	2	6	5	LWDWL	8	WLLLL	1	WLLWDLWLLL	9	3	1	6	10	18	WLLWDLWLLLWLDWW	16	6	2	7	16	24	WLLWDLWLLLWLDWWLDLWL	18	7	3	10	24	35	10	8	1	1	80.0	26	24	30.8
3111	Wisła Kraków	10361	Ekstraklasa 15/16	15/16	WDWLD	4	2	2	1	10	9	DWDWD	6	WLWWW	4	WDWLDWWDWW	12	6	3	1	25	14	WDWLDWWDWWWDDLD	17	7	6	2	33	21	WDWLDWWDWWWDDLDLLLLL	19	7	6	7	33	29	15	8	6	1	53.3	28	30	35.7
3121	Lech Poznań	10361	Ekstraklasa 15/16	15/16	WLLDL	3	1	1	3	3	6	WDDLL	5	LLLLW	1	WLLDLDLWLL	6	2	2	6	6	12	WLLDLDLWLLWWWLL	12	5	2	8	14	20	WLLDLDLWLLWWWLLWLWWW	22	9	2	9	24	24	12	11	1	0	91.7	24	18	25.0
3105	Ruch Chorzów	10361	Ekstraklasa 15/16	15/16	LLLLL	2	0	0	5	2	13	LLDLL	4	LLLDL	3	LLLLLDDLLD	9	0	3	7	5	19	LLLLLDDLLDLWLLW	13	2	3	10	13	29	LLLLLDDLLDLWLLWDWLDW	21	4	5	11	17	35	9	6	2	1	66.7	26	28	35.9
7919	Podbeskidzie Bielsko-Biała	10361	Ekstraklasa 15/16	15/16	LLDLL	2	0	1	4	8	15	LDLLW	6	LLLWL	1	LLDLLLLWWD	7	2	2	6	13	17	LLDLLLLWWDLDWWW	14	5	3	7	24	23	LLDLLLLWWDLDWWWLLLDL	15	5	4	11	26	36	7	3	3	1	42.9	28	19	22.6
5065	MKS Korona Kielce	8206	Ekstraklasa 14/15	14/15	WDWDL	13	2	2	1	9	8	WWLLW	11	DDLLD	9	WDWDLLLWLD	17	3	3	4	13	17	WDWDLLLWLDDWWDD	27	5	6	4	22	23	WDWDLLLWLDDWWDDWDDLL	32	6	8	6	26	29	8	5	3	0	62.5	31	38	40.9
3106	Legia Warszawa	8206	Ekstraklasa 14/15	14/15	WDWWW	13	4	1	0	5	0	WWWLW	13	DWDDL	10	WDWWWDLWDW	26	6	3	1	11	4	WDWWWDLWDWLWLDW	30	8	4	3	19	10	WDWWWDLWDWLWLDWWDLLW	38	10	5	5	28	16	11	11	0	0	100.0	19	18	31.6
7918	Piast Gliwice	8206	Ekstraklasa 14/15	14/15	LDLWW	10	2	1	2	9	9	LWWLW	11	DLDWL	7	LDLWWDLWWL	18	4	2	4	18	16	LDLWWDLWWLWLLLD	22	5	3	7	24	25	LDLWWDLWWLWLLLDLWLWL	28	7	3	10	29	33	8	5	1	2	62.5	28	33	39.3
7691	Jagiellonia Białystok	8206	Ekstraklasa 14/15	14/15	WWWWL	10	4	0	1	12	7	WWWDW	12	WLWDL	5	WWWWLWDWDW	20	7	2	1	20	10	WWWWLWDWDWLDLWL	23	8	3	4	24	18	WWWWLWDWDWLDLWLLWWWD	32	11	4	5	31	22	16	13	2	1	81.3	26	35	44.9
3125	Górnik Łęczna	8206	Ekstraklasa 14/15	14/15	WLLDW	8	2	1	2	5	4	WLLLD	6	LDWWL	5	WLLDWLWLLD	11	3	2	5	10	14	WLLDWLWLLDDLDLW	14	4	4	7	14	20	WLLDWLWLLDDLDLWWLDWD	25	6	6	8	19	23	9	8	1	0	88.9	29	25	28.7
4901	Cracovia	8206	Ekstraklasa 14/15	14/15	WWWDW	8	4	1	0	11	2	WDWDW	9	WWWWL	4	WWWDWWDWWL	14	7	2	1	21	5	WWWDWWDWWLLWLWL	20	9	2	4	29	15	WWWDWWDWWLLWLWLDDDWD	24	10	6	4	34	19	11	8	2	1	72.7	27	32	39.5
3121	Lech Poznań	8206	Ekstraklasa 14/15	14/15	DWWWW	8	4	1	0	12	2	DWWLW	10	WWWWD	7	DWWWWLWWWD	17	7	2	1	20	7	DWWWWLWWWDDWWLW	24	10	3	2	27	11	DWWWWLWWWDDWWLWDWDWW	37	13	5	2	33	14	17	11	5	1	64.7	24	35	48.6
3108	Śląsk Wrocław	8206	Ekstraklasa 14/15	14/15	WWWDL	7	3	1	1	5	5	WWDDW	9	WLDLL	4	WWWDLDDWLW	16	5	3	2	11	9	WWWDLDDWLWLDDDL	23	5	6	4	15	17	WWWDLDDWLWLDDDLDLDWW	34	7	8	5	22	23	7	6	1	0	85.7	26	37	47.4
3105	Ruch Chorzów	8206	Ekstraklasa 14/15	14/15	WLWLW	6	3	0	2	8	7	WLDDW	7	LWWWL	3	WLWLWDWLDD	10	4	3	3	11	10	WLWLWDWLDDWDLWW	21	7	4	4	20	15	WLWLWDWLDDWDLWWDLWLW	28	9	5	6	27	20	9	7	2	0	77.8	25	31	41.3
3117	Pogoń Szczecin	8206	Ekstraklasa 14/15	14/15	LLLLD	5	0	1	4	4	9	LLLWW	9	LLDLL	3	LLLLDLLLWW	10	2	1	7	10	17	LLLLDLLLWWWLWLL	17	4	1	10	17	22	LLLLDLLLWWWLWLLLDDLW	24	5	3	12	21	26	12	6	3	3	50.0	30	38	42.2
7919	Podbeskidzie Bielsko-Biała	8206	Ekstraklasa 14/15	14/15	LWLLL	5	1	0	4	3	10	WLLDL	6	LLWLD	4	LWLLLWDLLD	7	2	2	6	9	19	LWLLLWDLLDDDWDD	19	3	6	6	15	24	LWLLLWDLLDDDWDDLDWWL	23	5	7	8	20	32	7	5	1	1	71.4	29	22	25.3
3110	Górnik Zabrze	8206	Ekstraklasa 14/15	14/15	LLLDL	5	0	1	4	4	13	LLWWW	11	LLDLL	3	LLLDLWLWLW	14	3	1	6	12	21	LLLDLWLWLWDDLDD	20	3	5	7	20	30	LLLDLWLWLWDDLDDDWDLL	22	4	7	9	25	39	9	6	3	0	66.7	29	23	26.4
3111	Wisła Kraków	8206	Ekstraklasa 14/15	14/15	DLLLD	4	0	2	3	3	6	LDWWD	7	DLLDL	6	DLLLDDWLWD	16	2	4	4	13	12	DLLLDDWLWDDDWDL	26	3	7	5	20	19	DLLLDDWLWDDDWDLLDLWL	28	4	8	8	25	27	12	8	2	2	66.7	30	35	38.9
7913	KS Lechia Gdańsk	8206	Ekstraklasa 14/15	14/15	LDLLW	2	1	1	3	4	7	DLDWW	7	LLWWL	2	LDLLWDWLWL	6	3	2	5	13	16	LDLLWDWLWLWLWWW	16	7	2	6	19	19	LDLLWDWLWLWLWWWDDWLW	25	9	4	7	24	22	11	6	2	3	54.5	25	25	33.3
3128	GKS Bełchatów	8206	Ekstraklasa 14/15	14/15	LDLWL	2	1	1	3	10	15	DLLDL	3	LWLDL	4	LDLWLLDLDL	6	1	3	6	12	23	LDLWLLDLDLLLLLL	9	1	3	11	14	34	LDLWLLDLDLLLLLLWLLLD	13	2	4	14	21	43	12	8	1	3	66.7	28	20	23.8
35329	Zawisza Bydgoszcz	8206	Ekstraklasa 14/15	14/15	LDWDL	1	1	2	2	8	8	DDWLW	7	LWLDL	4	LDWDLWDLLL	8	2	3	5	14	18	LDWDLWDLLLWWWWW	17	7	3	5	24	21	LDWDLWDLLLWWWWWWDDLL	24	8	5	7	27	24	9	7	1	1	77.8	29	26	29.9
7919	Podbeskidzie Bielsko-Biała	6261	Ekstraklasa 13/14	13/14	DWWDL	12	2	2	1	9	5	WWWDD	9	DDLWW	8	DWWDLWWWDW	18	6	3	1	17	9	DWWDLWWWDWDLDDD	24	6	7	2	21	14	DWWDLWWWDWDLDDDWLDLW	30	8	8	4	26	19	4	3	1	0	75.0	21	24	38.1
5065	MKS Korona Kielce	6261	Ekstraklasa 13/14	13/14	LDDLW	11	1	2	2	9	13	LLWDW	8	DDDLD	12	LDDLWDDWLD	17	2	5	3	14	19	LDDLWDDWLDDDWDD	26	3	9	3	18	22	LDDLWDDWLDDDWDDLWDWW	38	6	10	4	24	26	4	1	3	0	25.0	29	36	41.4
3111	Wisła Kraków	6261	Ekstraklasa 13/14	13/14	WDLDL	10	1	2	2	8	13	WLWLL	9	DDLLL	6	WDLDLWLLLL	14	2	2	6	15	22	WDLDLWLLLLLDLDW	25	3	4	8	20	27	WDLDLWLLLLLDLDWWWLLW	32	6	4	10	28	35	15	9	3	3	60.0	22	29	43.9
7691	Jagiellonia Białystok	6261	Ekstraklasa 13/14	13/14	DDLDW	10	1	3	1	8	10	DLWWD	7	DDLLD	9	DDLDWLWDLD	16	2	5	3	18	25	DDLDWLWDLDDLWDL	19	3	7	5	22	30	DDLDWLWDLDDLWDLWDWLW	32	6	8	6	32	35	10	9	1	0	90.0	29	37	42.5
3117	Pogoń Szczecin	6261	Ekstraklasa 13/14	13/14	DLDLL	9	0	2	3	1	5	LLLDW	6	DDLDD	12	DLDLLLDWDD	18	1	5	4	8	16	DLDLLLDWDDWDDDW	30	3	8	4	17	19	DLDLLLDWDDWDDDWWLDDD	34	4	11	5	24	26	12	8	3	1	66.7	28	38	45.2
3106	Legia Warszawa	6261	Ekstraklasa 13/14	13/14	WWLWW	9	4	0	1	12	4	WLWWW	13	WWWWW	5	WWLWWWWWWW	20	9	0	1	22	5	WWLWWWWWWWWDDWW	28	12	2	1	31	9	WWLWWWWWWWWDDWWWLWLW	37	15	2	3	40	14	16	15	1	0	93.8	21	31	49.2
7913	KS Lechia Gdańsk	6261	Ekstraklasa 13/14	13/14	WDDWW	8	3	2	0	8	3	DWLWW	10	WDWDL	8	WDDWWLDLWW	18	5	3	2	13	7	WDDWWLDLWWLWLDW	22	7	4	4	19	10	WDDWWLDLWWLWLDWLDWLW	30	9	5	6	25	15	9	8	1	0	88.9	23	23	33.3
3108	Śląsk Wrocław	6261	Ekstraklasa 13/14	13/14	WWWDW	8	4	1	0	10	1	WDWWW	12	WWDDL	8	WWWDWDWWDL	20	6	3	1	15	5	WWWDWDWWDLDDDWL	25	7	6	2	22	12	WWWDWDWWDLDDDWLLDDDL	28	7	9	4	24	18	10	7	2	1	70.0	22	24	36.4
3115	Widzew Łódź	6261	Ekstraklasa 13/14	13/14	DWLDL	6	1	2	2	6	6	WDWWD	9	DLLDL	6	DWLDLWDLWD	18	3	4	3	13	11	DWLDLWDLWDDLDLD	18	3	7	5	17	18	DWLDLWDLWDDLDLDLLDLL	18	3	8	9	20	25	8	5	2	1	62.5	33	28	28.3
3121	Lech Poznań	6261	Ekstraklasa 13/14	13/14	LWDLW	6	2	1	2	7	5	WDWWW	12	LLWWL	2	LWDLWWWWWL	14	6	1	3	21	8	LWDLWWWWWLWWDWL	26	9	2	4	32	17	LWDLWWWWWLWWDWLWDWLD	35	11	4	5	39	22	17	13	3	1	76.5	26	37	47.4
7918	Piast Gliwice	6261	Ekstraklasa 13/14	13/14	DLWWW	5	3	1	1	11	5	DWDDL	4	LWWLD	5	DLWWWDLDDL	8	3	4	3	18	15	DLWWWDLDDLLWDLD	13	4	6	5	22	22	DLWWWDLDDLLWDLDLDDLW	20	5	8	7	25	30	8	5	3	0	62.5	26	18	23.1
3110	Górnik Zabrze	6261	Ekstraklasa 13/14	13/14	LWWLL	4	2	0	3	7	9	LLWLD	6	WWLDL	5	LWWLLWDLLD	11	3	2	5	14	19	LWWLLWDLLDDDLDL	15	3	5	7	17	27	LWWLLWDLLDDDLDLLDLWL	18	4	6	10	21	36	13	8	2	3	61.5	29	38	43.7
3105	Ruch Chorzów	6261	Ekstraklasa 13/14	13/14	DLWDW	4	2	2	1	7	8	DDWDW	6	LWLWL	2	DLWDWLDWWL	9	4	3	3	12	11	DLWDWLDWWLLLWWW	15	7	3	5	19	19	DLWDWLDWWLLLWWWWWWLW	25	11	3	6	27	25	9	8	0	1	88.9	26	25	32.1
4901	Cracovia	6261	Ekstraklasa 13/14	13/14	DLDWL	2	1	2	2	6	10	DDLLW	5	LWLLD	4	DLDWLLLLWD	6	2	3	5	9	15	DLDWLLLLWDDWDLL	16	3	5	7	12	20	DLDWLLLLWDDWDLLLLWWL	23	5	5	10	19	30	8	4	4	0	50.0	30	30	33.3
35329	Zawisza Bydgoszcz	6261	Ekstraklasa 13/14	13/14	LLDWL	2	1	1	3	4	7	LDLLW	6	LWLLL	1	LLDWLLLLLW	7	2	1	7	6	17	LLDWLLLLLWWDWLL	15	4	2	9	12	25	LLDWLLLLLWWDWLLWDDWD	25	6	5	9	23	28	3	2	1	0	66.7	28	32	38.1
3113	Zagłębie Lubin	6261	Ekstraklasa 13/14	13/14	DLLLL	1	0	1	4	1	10	DLDLW	5	LLLLL	0	DLLLLDLLLW	5	1	2	7	6	17	DLLLLDLLLWDDLWD	14	2	5	8	12	22	DLLLLDLLLWDDLWDWLLWD	24	4	6	10	20	29	10	5	4	1	50.0	30	28	31.1
3106	Legia Warszawa	4634	Ekstraklasa 12/13	12/13	WDDWW	13	3	2	0	10	1	WWWWW	15	DDWDW	11	WDDWWWDWWW	26	7	3	0	18	3	WDDWWWDWWWWWWDL	31	10	4	1	27	8	WDDWWWDWWWWWWDLLWWWL	39	13	4	3	35	12	13	12	1	0	92.3	16	27	56.3
3121	Lech Poznań	4634	Ekstraklasa 12/13	12/13	WDLLW	10	2	1	2	7	4	WLWWW	13	DLWWW	6	WDLLWWWWWW	21	7	1	2	19	7	WDLLWWWWWWWDWLW	25	10	2	3	26	8	WDLLWWWWWWWDWLWWLWLW	30	13	2	5	32	16	12	11	1	0	91.7	13	16	41.0
3128	GKS Bełchatów	4634	Ekstraklasa 12/13	12/13	WDDWW	8	3	2	0	9	6	DWWLW	10	WDWWD	9	WDDWWWWDLL	16	5	3	2	13	11	WDDWWWWDLLWDDDD	25	6	7	2	14	11	WDDWWWWDLLWDDDDLDDLL	30	6	9	5	18	19	8	3	4	1	37.5	22	22	33.3
3117	Pogoń Szczecin	4634	Ekstraklasa 12/13	12/13	WLWWL	8	3	0	2	8	6	WWLWD	10	LWLLL	1	WLWWLLWLDL	11	4	1	5	12	13	WLWWLLWLDLLLLDL	16	4	2	9	13	23	WLWWLLWLDLLLLDLLWDWW	26	7	3	10	17	25	10	8	0	2	80.0	23	20	29.0
7691	Jagiellonia Białystok	4634	Ekstraklasa 12/13	12/13	WDLLL	8	1	1	3	2	12	WLLLD	6	DLLWD	7	WDLLLLLDWW	13	3	2	5	8	20	WDLLLLLDWWDWLWL	20	5	3	7	14	28	WDLLLLLDWWDWLWLDDDDW	27	6	7	7	22	35	9	6	3	0	66.7	23	29	42.0
7918	Piast Gliwice	4634	Ekstraklasa 12/13	12/13	LDDWW	8	2	2	1	9	8	LDWDL	5	DWWDW	9	LDDWWWDDLW	14	4	4	2	14	14	LDDWWWDDLWDWWDL	18	6	6	3	20	17	LDDWWWDDLWDWWDLWDLWW	23	9	7	4	28	24	8	5	0	3	62.5	23	20	29.0
3105	Ruch Chorzów	4634	Ekstraklasa 12/13	12/13	LDDLD	7	0	3	2	7	9	DLLWL	6	LDDLW	7	LDDLDLLWWL	13	2	3	5	14	17	LDDLDLLWWLWLDWL	18	4	4	7	22	26	LDDLDLLWWLWLDWLDLLLL	20	4	5	11	24	34	3	2	1	0	66.7	26	24	30.8
3119	Polonia Warszawa	4634	Ekstraklasa 12/13	12/13	LDDWW	7	2	2	1	8	5	DWLDL	5	LDWDL	7	LDDWWDLLDL	11	2	4	4	14	14	LDDWWDLLDLLLLWD	14	3	5	7	18	21	LDDWWDLLDLLLLWDWDLDW	22	5	7	8	23	24	8	7	1	0	87.5	23	25	36.2
5065	MKS Korona Kielce	4634	Ekstraklasa 12/13	12/13	LDDWL	6	1	2	2	6	6	DWDWW	9	LDLLL	3	LDDWLDLWLW	12	3	3	4	11	11	LDDWLDLWLWDWLDW	21	5	5	5	20	19	LDDWLDLWLWDWLDWLLWDD	28	6	7	7	25	22	6	5	1	0	83.3	23	26	37.7
7919	Podbeskidzie Bielsko-Biała	4634	Ekstraklasa 12/13	12/13	WWWLL	6	3	0	2	8	6	WLDDD	4	WWLWW	4	WWWLLDWDWW	9	6	2	2	16	10	WWWLLDWDWWDDLDW	19	7	5	3	23	14	WWWLLDWDWWDDLDWDLLLL	21	7	6	7	27	23	11	6	0	5	54.5	26	17	21.8
3111	Wisła Kraków	4634	Ekstraklasa 12/13	12/13	LWDLW	5	2	1	2	5	5	LDWWL	8	WLLDD	7	LWDLWLWDLL	13	3	2	5	10	12	LWDLWLWDLLDWWDD	23	5	5	5	14	13	LWDLWLWDLLDWWDDLLWWD	31	7	6	7	20	22	7	5	1	1	71.4	20	21	35.0
3115	Widzew Łódź	4634	Ekstraklasa 12/13	12/13	LDDLL	5	0	2	3	3	9	LDLWD	5	DLLDL	6	LDDLLWLDDW	14	2	4	4	11	14	LDDLLWLDDWLDDLL	17	2	6	7	13	22	LDDLLWLDDWLDDLLDWLLL	24	3	7	10	16	28	9	6	2	1	66.7	22	21	31.8
3108	Śląsk Wrocław	4634	Ekstraklasa 12/13	12/13	LDWWL	4	2	1	2	9	9	DWWDW	9	LWLLD	4	LDWWLWLDDW	13	4	3	3	15	17	LDWWLWLDDWLDDDW	22	5	6	4	20	22	LDWWLWLDDWLDDDWWWDLL	27	7	7	6	28	29	8	3	4	1	37.5	22	27	40.9
3110	Górnik Zabrze	4634	Ekstraklasa 12/13	12/13	WLLLW	4	2	0	3	4	7	LLWLW	9	WLWLL	2	WLLLWLWLLL	8	3	0	7	7	13	WLLLWLWLLLWLLLW	16	5	0	10	12	20	WLLLWLWLLLWLLLWWWDDL	24	7	2	11	18	24	13	10	2	1	76.9	21	25	39.7
7913	KS Lechia Gdańsk	4634	Ekstraklasa 12/13	12/13	LWDWD	3	2	2	1	10	8	LDDLL	3	WWLDL	5	LWDWDLLDLL	8	2	3	5	16	19	LWDWDLLDLLDLWDD	14	3	6	6	21	25	LWDWDLLDLLDLWDDLDDWW	21	5	8	7	27	30	11	7	2	2	63.6	22	21	31.8
3113	Zagłębie Lubin	4634	Ekstraklasa 12/13	12/13	WLDLL	3	1	1	3	4	8	LDLWW	8	WLDLL	4	WLDLLDWLWL	12	3	2	5	12	15	WLDLLDWLWLLDWDW	25	5	4	6	20	20	WLDLLDWLWLLDWDWWDWWW	36	9	5	6	30	23	9	6	1	2	66.7	20	27	45.0
3121	Lech Poznań	3411	Ekstraklasa 11/12	11/12	DWWWW	13	4	1	0	5	1	WWWWW	15	DWDLD	10	DWWWWDWWWL	25	7	2	1	13	6	DWWWWDWWWLDLLWW	35	9	3	3	20	12	DWWWWDWWWLDLLWWLDLDD	42	9	6	5	20	14	8	8	0	0	100.0	14	21	50.0
3108	Śląsk Wrocław	3411	Ekstraklasa 11/12	11/12	WWWDD	13	3	2	0	8	4	WWWWL	13	WDDLL	7	WWWDDWLLWL	20	5	2	3	13	11	WWWDDWLLWLDLDWW	26	7	4	4	20	19	WWWDDWLLWLDLDWWLWWWW	35	11	4	5	29	21	11	10	1	0	90.9	19	25	43.9
3128	GKS Bełchatów	3411	Ekstraklasa 11/12	11/12	DDLDW	10	1	3	1	6	6	DLWLD	5	DDLDL	9	DDLDWLLDDL	14	1	5	4	10	14	DDLDWLLDDLWDWLD	18	3	7	5	15	18	DDLDWLLDDLWDWLDLWDWL	27	5	8	7	23	24	6	4	2	0	66.7	23	22	31.9
3110	Górnik Zabrze	3411	Ekstraklasa 11/12	11/12	LWWLD	9	2	1	2	7	4	WWWWD	12	LLDLW	4	LWWLDWWLWD	16	5	2	3	13	6	LWWLDWWLWDDDWLL	23	6	4	5	18	13	LWWLDWWLWDDDWLLWWDWL	34	9	5	6	27	17	11	7	2	2	63.6	20	25	41.7
7691	Jagiellonia Białystok	3411	Ekstraklasa 11/12	11/12	WLDWL	9	2	1	2	6	8	WWWWW	15	LDLLL	3	WLDWLWLWWL	18	5	1	4	15	15	WLDWLWLWWLLDLWL	24	6	2	7	16	20	WLDWLWLWWLLDLWLDLDLW	31	7	4	9	18	25	8	7	1	0	87.5	24	33	45.8
3119	Polonia Warszawa	3411	Ekstraklasa 11/12	11/12	DLLLW	8	1	1	3	3	8	LLWWW	11	DLLLD	6	DLLLWLWLDW	17	3	2	5	10	13	DLLLWLWLDWLLWWW	21	6	2	7	18	18	DLLLWLWLDWLLWWWWLWWD	31	9	3	8	22	20	9	6	3	0	66.7	20	22	36.7
3111	Wisła Kraków	3411	Ekstraklasa 11/12	11/12	LLWWW	8	3	0	2	7	6	LWWDD	7	LWLLD	4	LLWWWLDLDD	11	3	3	4	9	10	LLWWWLDLDDWLDLW	20	5	4	6	14	14	LLWWWLDLDDWLDLWWLLLW	24	7	4	9	17	18	6	6	0	0	100.0	20	29	48.3
3106	Legia Warszawa	3411	Ekstraklasa 11/12	11/12	WLDLD	7	1	2	2	3	4	WDLWD	7	LDDWW	8	WLDLDWDDDW	14	3	5	2	7	5	WLDLDWDDDWWWLDW	19	6	6	3	17	7	WLDLDWDDDWWWLDWLWWDD	31	8	8	4	23	8	13	11	1	1	84.6	13	11	28.2
3105	Ruch Chorzów	3411	Ekstraklasa 11/12	11/12	WWDWD	5	3	2	0	7	3	WDDWD	6	WWLWD	6	WWDWDLWWDD	12	5	4	1	13	9	WWDWDLWWDDWWDWD	25	8	6	1	23	12	WWDWDLWWDDWWDWDLWWLW	31	11	6	3	31	15	10	8	2	0	80.0	20	32	53.3
3115	Widzew Łódź	3411	Ekstraklasa 11/12	11/12	DWLDD	5	1	3	1	3	2	DLDLW	5	WDDLL	7	DWLDDDLLLW	12	2	4	4	7	10	DWLDDDLLLWDWLWL	17	4	5	6	13	15	DWLDDDLLLWDWLWLWDDWL	24	6	7	7	15	17	6	6	0	0	100.0	17	15	29.4
3113	Zagłębie Lubin	3411	Ekstraklasa 11/12	11/12	WWLDW	5	3	1	1	10	4	WDWWD	9	WLWWW	4	WWLDWWWWWD	13	7	2	1	17	7	WWLDWWWWWDWLDLL	15	8	3	4	23	17	WWLDWWWWWDWLDLLLLWLL	19	9	3	8	27	31	7	6	1	0	85.7	22	16	24.2
4901	Cracovia	3411	Ekstraklasa 11/12	11/12	DLLDL	4	0	2	3	3	7	LDWLL	6	DLLLL	3	DLLDLWLLLD	11	1	3	6	10	19	DLLDLWLLLDLDDDD	18	1	7	7	11	22	DLLDLWLLLDLDDDDWLWLD	24	3	8	9	14	26	4	2	1	1	50.0	23	26	37.7
5065	MKS Korona Kielce	3411	Ekstraklasa 11/12	11/12	LLWWL	4	2	0	3	4	5	LLDWW	8	LWWLD	5	LLWWLDLWDW	11	4	2	4	11	10	LLWWLDLWDWWWWLD	18	7	3	5	17	14	LLWWLDLWDWWWWLDWDDLL	25	8	5	7	21	21	12	9	3	0	75.0	16	12	25.0
3123	ŁKS Łódź	3411	Ekstraklasa 11/12	11/12	LDDLL	4	0	2	3	6	10	DLDLD	2	LDLWD	7	LDDLLDWLDD	9	1	5	4	11	15	LDDLLDWLDDLDLLL	11	1	6	8	12	25	LDDLLDWLDDLDLLLDLLWL	14	2	7	11	16	35	6	2	3	1	33.3	23	14	20.3
7913	KS Lechia Gdańsk	3411	Ekstraklasa 11/12	11/12	LWWDL	4	2	1	2	5	5	WDLLD	5	LWLWD	5	LWWDLLWLDD	10	3	3	4	12	12	LWWDLLWLDDLDDLL	19	3	5	7	14	19	LWWDLLWLDDLDDLLWLDLD	22	4	7	9	15	23	7	5	2	0	71.4	19	15	26.3
7919	Podbeskidzie Bielsko-Biała	3411	Ekstraklasa 11/12	11/12	DLLLD	1	0	2	3	3	9	DLDLL	3	LLLWD	4	DLLLDLLWDL	7	1	3	6	9	18	DLLLDLLWDLLWWWW	15	5	3	7	14	20	DLLLDLLWDLLWWWWLDDWL	16	6	5	9	17	24	5	4	0	1	80.0	20	10	16.7
3106	Legia Warszawa	2737	Ekstraklasa 10/11	10/11	WWWDD	13	3	2	0	12	3	WWWWD	12	WDDLL	7	WWWDDWWLLD	19	5	3	2	19	9	WWWDDWWLLDLLLWD	27	6	4	5	26	19	WWWDDWWLLDLLLWDWWLWW	37	10	4	6	34	24	9	8	0	1	88.9	20	24	40.0
3128	GKS Bełchatów	2737	Ekstraklasa 10/11	10/11	WDLLD	10	1	2	2	4	7	WLDWD	7	DLDDL	9	WDLLDDWDLD	16	2	5	3	8	12	WDLLDDWDLDDWLDD	25	3	8	4	12	15	WDLLDDWDLDDWLDDLWDLW	35	5	9	6	19	22	8	5	1	2	62.5	18	17	31.5
3119	Polonia Warszawa	2737	Ekstraklasa 10/11	10/11	WDWDW	8	3	2	0	7	0	DWLWW	10	WWDLW	6	WDWDWLLWWW	16	6	2	2	15	4	WDWDWLLWWWWLLLD	18	7	3	5	18	8	WDWDWLLWWWWLLLDLLWDL	26	8	4	8	26	17	8	7	1	0	87.5	16	18	37.5
3108	Śląsk Wrocław	2737	Ekstraklasa 10/11	10/11	WWLWW	8	4	0	1	13	6	WWDWL	10	WLWWD	6	WWLWWDWWLD	13	6	2	2	18	9	WWLWWDWWLDDWWDD	23	8	5	2	25	14	WWLWWDWWLDDWWDDDWWWW	36	12	6	2	37	18	6	4	2	0	66.7	19	27	47.4
3111	Wisła Kraków	2737	Ekstraklasa 10/11	10/11	LWLWW	8	3	0	2	5	4	LWWLW	11	WLWLD	5	LWLWWWLLWD	16	5	1	4	13	11	LWLWWWLLWDWDWWW	29	9	2	4	23	14	LWLWWWLLWDWDWWWWWWWL	37	13	2	5	31	18	12	10	2	0	83.3	16	23	47.9
5065	MKS Korona Kielce	2737	Ekstraklasa 10/11	10/11	LWLWL	7	2	0	3	4	11	WWLLD	8	LLLLW	1	LWLWLLLLWD	9	3	1	6	8	18	LWLWLLLLWDLLDLD	13	3	3	9	14	31	LWLWLLLLWDLLDLDDLDLW	14	4	5	11	18	36	5	4	0	1	80.0	22	18	27.3
3110	Górnik Zabrze	2737	Ekstraklasa 10/11	10/11	WLWWD	7	3	1	1	10	4	WWDDW	9	LWLWL	2	WLWWDLWLDD	11	4	3	3	13	9	WLWWDLWLDDWLDWD	20	6	5	4	21	15	WLWWDLWLDDWLDWDLWLDL	23	7	6	7	25	27	10	9	1	0	90.0	21	17	27.0
3115	Widzew Łódź	2737	Ekstraklasa 10/11	10/11	LWWWD	7	3	1	1	6	7	WWDWD	9	LWWLD	5	LWWWDWLWDD	14	5	3	2	14	12	LWWWDWLWDDDWLWL	18	7	4	4	18	16	LWWWDWLWDDDWLWLWLDLL	21	8	5	7	25	23	10	8	2	0	80.0	24	32	44.4
3121	Lech Poznań	2737	Ekstraklasa 10/11	10/11	WWLWL	7	3	0	2	8	4	WWWDW	12	WLLLL	1	WWLWLWLDWL	13	5	1	4	11	6	WWLWLWLDWLDWLWW	20	8	2	5	19	9	WWLWLWLDWLDWLWWDWWDL	29	10	4	6	24	12	9	7	1	1	77.8	17	9	17.6
7691	Jagiellonia Białystok	2737	Ekstraklasa 10/11	10/11	WLWDL	6	2	1	2	6	6	WWDLW	10	LLLWL	1	WLWDLLLWWW	14	5	1	4	14	12	WLWDLLLWWWLLLDD	18	5	3	7	16	19	WLWDLLLWWWLLLDDDWDLW	30	7	5	8	22	24	7	6	1	0	85.7	17	18	35.3
4901	Cracovia	2737	Ekstraklasa 10/11	10/11	LWLLW	5	2	0	3	6	5	WLWDW	10	LLWLL	1	LWLLWWLDLW	11	4	1	5	14	12	LWLLWWLDLWLWWDD	20	6	3	6	21	16	LWLLWWLDLWLWWDDWLDLL	28	7	4	9	28	26	8	6	1	1	75.0	23	16	23.2
5064	MZKS Arka Gdynia	2737	Ekstraklasa 10/11	10/11	LLWLL	5	1	0	4	4	14	LWLDW	8	LLDLL	3	LLWLLDDLWL	11	2	2	6	10	22	LLWLLDDLWLDDDLL	19	2	5	8	13	29	LLWLLDDLWLDDDLLDLLWD	25	3	7	10	17	37	6	4	2	0	66.7	22	16	24.2
7913	KS Lechia Gdańsk	2737	Ekstraklasa 10/11	10/11	LLWDW	5	2	1	2	6	6	LWDLW	8	LWDDL	7	LLWDWLDWDL	15	3	3	4	10	15	LLWDWLDWDLDLWWD	22	5	5	5	15	18	LLWDWLDWDLDLWWDLWLWL	27	7	5	8	21	26	5	4	0	1	80.0	20	25	41.7
3113	Zagłębie Lubin	2737	Ekstraklasa 10/11	10/11	WLWLL	4	2	0	3	5	7	LLWLW	9	WWLDD	8	WLWLLDWDLD	17	3	3	4	12	15	WLWLLDWDLDWDWLD	26	5	5	5	18	22	WLWLLDWDLDWDWLDWLDWL	32	7	6	7	24	28	5	4	0	1	80.0	21	26	41.3
7692	Polonia Bytom	2737	Ekstraklasa 10/11	10/11	LLLLL	3	0	0	5	4	12	LLLWL	7	LLDLW	4	LLLLLDWLLW	11	2	1	7	10	19	LLLLLDWLLWLDDLD	14	2	4	9	16	29	LLLLLDWLLWLDDLDLLWDW	22	4	5	11	20	32	4	2	2	0	50.0	23	18	26.1
3105	Ruch Chorzów	2737	Ekstraklasa 10/11	10/11	LLLLW	3	1	0	4	4	8	LLDWL	6	LLWWD	5	LLLLWDWWDL	11	3	2	5	8	12	LLLLWDWWDLWWWLD	18	6	3	6	17	18	LLLLWDWWDLWWWLDDLLWD	21	7	5	8	20	23	10	7	1	2	70.0	17	9	17.6
3128	GKS Bełchatów	2275	Ekstraklasa 09/10	09/10	DWLWD	12	2	2	1	8	5	WWWLD	10	DLDDD	12	DWLWDDDWLL	22	3	4	3	13	10	DWLWDDDWLLDWWLD	26	5	6	4	20	16	DWLWDDDWLLDWWLDLWWWW	35	9	6	5	27	17	10	9	1	0	90.0	18	22	40.7
5065	MKS Korona Kielce	2275	Ekstraklasa 09/10	09/10	WDWWL	11	3	1	1	7	3	WWLDD	7	DWWLD	8	WDWWLWDLDD	15	4	4	2	12	8	WDWWLWDLDDLWWLD	24	6	5	4	15	14	WDWWLWDLDDLWWLDDDDLL	31	6	8	6	23	26	8	5	3	0	62.5	22	20	30.3
3121	Lech Poznań	2275	Ekstraklasa 09/10	09/10	WWWWW	11	5	0	0	12	2	WWWWW	15	WWDDD	11	WWWWWDWWDW	26	8	2	0	17	2	WWWWWDWWDWDWWWD	36	11	4	0	27	5	WWWWWDWWDWDWWWDWWDWD	49	14	6	0	33	7	13	12	1	0	92.3	14	22	52.4
3108	Śląsk Wrocław	2275	Ekstraklasa 09/10	09/10	WWDLD	11	2	2	1	9	9	WLDDL	5	WDDLD	10	WWDLDDLDDD	17	2	6	2	11	12	WWDLDDLDDDLLDWL	25	3	7	5	14	17	WWDLDDLDDDLLDWLDWWLW	37	6	8	6	23	20	6	3	2	1	50.0	21	32	50.8
7692	Polonia Bytom	2275	Ekstraklasa 09/10	09/10	WDLWL	9	2	1	2	4	6	WWLLW	11	DLLDD	9	WDLWLLDDLL	17	2	3	5	8	14	WDLWLLDDLLWLDDD	23	3	6	6	12	18	WDLWLLDDLLWLDDDLDDLL	24	3	8	9	14	24	9	5	3	1	55.6	21	19	30.2
3114	MKS Odra Wodzisław Śląski	2275	Ekstraklasa 09/10	09/10	DLLWL	7	1	1	3	6	9	LWWDW	10	DLLLL	3	DLLWLWLLDD	13	2	3	5	11	17	DLLWLWLLDDWWDDD	20	4	6	5	17	20	DLLWLWLLDDWWDDDLLLLW	25	5	6	9	20	31	6	3	2	1	50.0	23	22	31.9
3105	Ruch Chorzów	2275	Ekstraklasa 09/10	09/10	LLLWW	7	2	0	3	4	7	LWWWD	10	LLDWD	7	LLLWWDWDWW	17	5	2	3	13	11	LLLWWDWDWWDLWWL	24	7	3	5	20	18	LLLWWDWDWWDLWWLDLWLW	28	9	4	7	27	25	11	11	0	0	100.0	17	21	41.2
3119	Polonia Warszawa	2275	Ekstraklasa 09/10	09/10	LWWWD	7	3	1	1	5	2	WWDLW	10	LWLWL	2	LWWWDLWLWL	12	5	1	4	10	8	LWWWDLWLWLDDLLD	16	5	4	6	13	15	LWWWDLWLWLDDLLDWDLLL	23	6	5	9	15	21	6	4	1	1	66.7	24	23	31.9
5064	MZKS Arka Gdynia	2275	Ekstraklasa 09/10	09/10	LWWLL	6	2	0	3	7	8	WWLDW	10	LLLLL	0	LWWLLLLDLW	10	3	1	6	13	16	LWWLLLLDLWLWLLD	13	4	2	9	15	23	LWWLLLLDLWLWLLDLDLWD	20	5	4	11	20	28	8	4	1	3	50.0	24	19	26.4
3111	Wisła Kraków	2275	Ekstraklasa 09/10	09/10	DDWLW	6	2	2	1	9	4	DLDWW	7	DWWWW	7	DDWLWDWWWW	14	6	3	1	17	5	DDWLWDWWWWDLLWW	22	8	4	3	21	8	DDWLWDWWWWDLLWWWLLWW	29	11	4	5	29	14	14	13	1	0	92.9	19	23	40.4
7691	Jagiellonia Białystok	2275	Ekstraklasa 09/10	09/10	LDWLW	6	2	1	2	3	5	DWWDW	9	LLLWL	1	LDWLWDLWWL	10	4	2	4	7	9	LDWLWDLWWLDWLWD	17	6	4	5	13	14	LDWLWDLWWLDWLWDDDLWD	26	7	7	6	17	20	7	6	1	0	85.7	15	20	44.4
4901	Cracovia	2275	Ekstraklasa 09/10	09/10	WDLLW	5	2	1	2	4	6	DLWLL	6	WLWDL	5	WDLLWWDLLL	11	3	2	5	7	14	WDLLWWDLLLWLLLW	18	5	2	8	13	20	WDLLWWDLLLWLLLWWWWLL	24	8	2	10	18	24	9	5	3	1	55.6	20	14	23.3
7913	KS Lechia Gdańsk	2275	Ekstraklasa 09/10	09/10	WLLLL	4	1	0	4	4	6	WLDDL	5	LLLDL	3	WLLLLDDDLL	8	1	3	6	9	15	WLLLLDDDLLWDDWD	18	3	6	6	13	17	WLLLLDDDLLWDDWDWLDWD	21	5	8	7	18	21	9	6	2	1	66.7	21	17	27.0
7918	Piast Gliwice	2275	Ekstraklasa 09/10	09/10	LLDWL	3	1	1	3	5	9	LDLLW	6	LWLLL	1	LLDWLLLWLW	10	3	1	6	7	16	LLDWLLLWLWLLDLD	18	3	3	9	11	24	LLDWLLLWLWLLDLDLDLLL	19	3	4	13	17	35	6	5	0	1	83.3	24	19	26.4
3113	Zagłębie Lubin	2275	Ekstraklasa 09/10	09/10	LDWLD	3	1	2	2	6	8	DWDDD	3	LLDWW	5	LDWLDDDDWW	10	3	5	2	13	11	LDWLDDDDWWWWDLD	12	5	7	3	18	13	LDWLDDDDWWWWDLDLDWWL	20	7	8	5	25	20	7	3	3	1	42.9	21	15	23.8
3106	Legia Warszawa	2275	Ekstraklasa 09/10	09/10	DLLLW	2	1	1	3	3	7	DLWWD	7	LLWLW	2	DLLLWWWLWD	9	4	2	4	12	12	DLLLWWWLWDLLWWD	17	6	3	6	15	15	DLLLWWWLWDLLWWDWDWWW	25	10	4	6	25	18	9	7	2	0	77.8	16	13	27.1
3106	Legia Warszawa	1691	Ekstraklasa 08/09	08/09	WDWLW	12	3	1	1	9	4	WWWDW	12	DLWWL	5	WDWLWDWWWD	17	6	3	1	16	5	WDWLWDWWWDLWDWW	27	9	4	2	27	9	WDWLWDWWWDLWDWWWWLLW	34	12	4	4	35	11	12	10	2	0	83.3	13	16	41.0
3111	Wisła Kraków	1691	Ekstraklasa 08/09	08/09	WWWWD	11	4	1	0	12	3	WWWWW	15	WWDWD	9	WWWWDWWWDW	24	8	2	0	22	6	WWWWDWWWDWDWDWL	36	10	4	1	28	10	WWWWDWWWDWDWDWLLWWDW	43	13	5	2	36	12	12	12	0	0	100.0	15	32	71.1
3110	Górnik Zabrze	1691	Ekstraklasa 08/09	08/09	LDWLW	10	2	1	2	4	3	LWWWD	10	DLLDL	6	LDWLWLWDLD	19	3	3	4	8	8	LDWLWLWDLDDDWWL	23	5	5	5	13	12	LDWLWLWDLDDDWWLLLLDL	28	5	6	9	15	20	5	4	1	0	80.0	19	8	14.0
4901	Cracovia	1691	Ekstraklasa 08/09	08/09	DDWLW	9	2	2	1	5	4	DWWDD	6	DLLLL	3	DDWLWLDLDL	9	2	4	4	7	14	DDWLWLDLDLWLWLW	18	5	4	6	17	21	DDWLWLDLDLWLWLWLWDLL	20	6	5	9	19	27	9	4	3	2	44.4	20	15	25.0
3105	Ruch Chorzów	1691	Ekstraklasa 08/09	08/09	LWWDD	7	2	2	1	6	6	WDLLL	6	LWDLD	7	LWWDDLLLDL	13	2	3	5	7	12	LWWDDLLLDLWLLLW	18	4	3	8	12	18	LWWDDLLLDLWLLLWLWLDL	21	5	4	11	14	23	4	4	0	0	100.0	18	16	29.6
3121	Lech Poznań	1691	Ekstraklasa 08/09	08/09	DDWWD	7	2	3	0	9	6	DWDDD	3	DWDWD	11	DDWWDDDWDD	11	3	7	0	14	10	DDWWDDDWDDDWWWW	22	7	8	0	23	13	DDWWDDDWDDDWWWWWWDWW	33	11	9	0	33	15	15	12	2	1	80.0	16	19	39.6
5064	MZKS Arka Gdynia	1691	Ekstraklasa 08/09	08/09	WDLLD	7	1	2	2	8	9	WLDLL	6	DLLLD	6	WDLLDLLLLD	12	1	3	6	9	16	WDLLDLLLLDLDLWD	22	2	5	8	13	23	WDLLDLLLLDLDLWDDWDDL	35	3	8	9	15	24	5	3	1	1	60.0	22	23	34.8
3123	ŁKS Łódź	1691	Ekstraklasa 08/09	08/09	WLLWL	7	2	0	3	4	7	WLWLW	11	LLDLW	4	WLLWLLDWLL	15	3	1	6	8	15	WLLWLLDWLLWWWWL	23	7	1	7	18	23	WLLWLLDWLLWWWWLWLLDD	28	8	3	9	22	28	7	5	1	1	71.4	20	17	28.3
7918	Piast Gliwice	1691	Ekstraklasa 08/09	08/09	LWLDD	6	1	2	2	3	4	LLDLL	4	WDWWL	6	LWLDDWLLWD	12	3	3	4	7	8	LWLDDWLLWDWWLLL	17	5	3	7	9	12	LWLDDWLLWDWWLLLDLLWW	25	7	4	9	11	14	6	5	1	0	83.3	18	10	18.5
7692	Polonia Bytom	1691	Ekstraklasa 08/09	08/09	LWLWL	6	2	0	3	5	9	WWWDL	10	LLLLL	0	LWLWLWLDLW	10	4	1	5	8	13	LWLWLWLDLWLLDLW	14	5	2	8	10	23	LWLWLWLDLWLLDLWLDDWL	21	6	4	10	16	30	5	5	0	0	100.0	23	14	20.3
7691	Jagiellonia Białystok	1691	Ekstraklasa 08/09	08/09	LLWLL	5	1	0	4	4	9	LWLWW	11	LLLLD	3	LLWLLLWLWD	14	3	1	6	10	13	LLWLLLWLWDWLWLL	20	5	1	9	15	18	LLWLLLWLWDWLWLLLDWDW	29	7	3	10	20	22	8	5	3	0	62.5	21	19	30.2
3108	Śląsk Wrocław	1691	Ekstraklasa 08/09	08/09	LDWLD	5	1	2	2	5	8	DLWDL	5	LWDDL	7	LDWLDWDDLL	12	2	4	4	10	13	LDWLDWDDLLDWDWW	27	5	6	4	20	15	LDWLDWDDLLDWDWWWLWLD	35	7	7	6	24	22	9	7	2	0	77.8	23	35	50.7
3114	MKS Odra Wodzisław Śląski	1691	Ekstraklasa 08/09	08/09	LLLWW	5	2	0	3	5	8	LWDWD	7	LLWLD	4	LLLWWDLDWW	12	4	2	4	9	13	LLLWWDLDWWDLLLL	14	4	3	8	10	22	LLLWWDLDWWDLLLLDWLDL	16	5	5	10	12	27	7	6	0	1	85.7	20	15	25.0
7913	KS Lechia Gdańsk	1691	Ekstraklasa 08/09	08/09	WLLWL	5	2	0	3	7	8	LWWLL	9	WLLDL	4	WLLWLWDLLL	13	3	1	6	11	14	WLLWLWDLLLLWDLL	17	4	2	9	18	23	WLLWLWDLLLLWDLLDLWLL	21	5	3	12	20	33	6	5	0	1	83.3	23	23	33.3
3128	GKS Bełchatów	1691	Ekstraklasa 08/09	08/09	WDLLW	4	2	1	2	6	4	DWWWD	9	WLLWW	3	WDLLWWWWWW	13	7	1	2	16	6	WDLLWWWWWWDLLLW	17	8	2	5	19	13	WDLLWWWWWWDLLLWWLWWW	27	12	2	6	28	17	7	7	0	0	100.0	17	13	25.5
3119	Polonia Warszawa	1691	Ekstraklasa 08/09	08/09	WDLWL	4	2	1	2	6	6	DWDWL	7	WLLDW	5	WDLWLDDWWW	12	5	3	2	13	9	WDLWLDDWWWLLDWD	14	6	5	4	17	14	WDLWLDDWWWLLDWDWLWDW	21	9	6	5	21	16	10	8	2	0	80.0	14	11	26.2
\.


--
-- Data for Name: mart_team_overview; Type: TABLE DATA; Schema: gold; Owner: airflow
--

COPY gold.mart_team_overview (season_id, season_name, season_year, team_id, team_name, matches_played, wins, draws, losses, total_points, points_per_game, goals_for, goals_against, goal_difference, goals_per_game, goals_conceded_per_game, clean_sheets, clean_sheet_percentage) FROM stdin;
76477	Ekstraklasa 25/26	25/26	3122	Wisła Płock	18	7	9	2	30	1.67	21	12	9	1.17	0.67	6	33.3
76477	Ekstraklasa 25/26	25/26	3110	Górnik Zabrze	18	9	3	6	30	1.67	29	24	5	1.61	1.33	4	22.2
76477	Ekstraklasa 25/26	25/26	7691	Jagiellonia Białystok	17	8	5	4	29	1.71	29	21	8	1.71	1.24	5	29.4
76477	Ekstraklasa 25/26	25/26	35268	Raków Częstochowa	18	9	2	7	29	1.61	26	23	3	1.44	1.28	4	22.2
76477	Ekstraklasa 25/26	25/26	3113	Zagłębie Lubin	18	7	7	4	28	1.56	31	24	7	1.72	1.33	5	27.8
76477	Ekstraklasa 25/26	25/26	4901	Cracovia	18	7	6	5	27	1.50	25	21	4	1.39	1.17	8	44.4
76477	Ekstraklasa 25/26	25/26	3121	Lech Poznań	17	6	8	3	26	1.53	29	26	3	1.71	1.53	4	23.5
76477	Ekstraklasa 25/26	25/26	7295	Radomiak Radom	18	7	5	6	26	1.44	35	30	5	1.94	1.67	3	16.7
76477	Ekstraklasa 25/26	25/26	7913	KS Lechia Gdańsk	18	7	4	7	25	1.39	37	37	0	2.06	2.06	2	11.1
76477	Ekstraklasa 25/26	25/26	5065	MKS Korona Kielce	18	6	6	6	24	1.33	21	19	2	1.17	1.06	6	33.3
76477	Ekstraklasa 25/26	25/26	7915	Motor Lublin	18	4	9	5	21	1.17	23	28	-5	1.28	1.56	4	22.2
76477	Ekstraklasa 25/26	25/26	3117	Pogoń Szczecin	18	6	3	9	21	1.17	28	32	-4	1.56	1.78	1	5.6
76477	Ekstraklasa 25/26	25/26	5064	MZKS Arka Gdynia	18	6	3	9	21	1.17	15	32	-17	0.83	1.78	4	22.2
76477	Ekstraklasa 25/26	25/26	3112	GKS Katowice	17	6	2	9	20	1.18	23	28	-5	1.35	1.65	3	17.6
76477	Ekstraklasa 25/26	25/26	7918	Piast Gliwice	17	5	5	7	20	1.18	19	19	0	1.12	1.12	5	29.4
76477	Ekstraklasa 25/26	25/26	3115	Widzew Łódź	18	6	2	10	20	1.11	26	28	-2	1.44	1.56	4	22.2
76477	Ekstraklasa 25/26	25/26	36851	Bruk-Bet Termalica Nieciecza	18	5	4	9	19	1.06	24	35	-11	1.33	1.94	3	16.7
76477	Ekstraklasa 25/26	25/26	3106	Legia Warszawa	18	4	7	7	19	1.06	19	21	-2	1.06	1.17	5	27.8
61236	Ekstraklasa 24/25	24/25	3121	Lech Poznań	33	21	4	8	67	2.03	66	31	35	2.00	0.94	13	39.4
61236	Ekstraklasa 24/25	24/25	35268	Raków Częstochowa	33	19	9	5	66	2.00	49	23	26	1.48	0.70	16	48.5
61236	Ekstraklasa 24/25	24/25	7691	Jagiellonia Białystok	33	16	10	7	58	1.76	54	42	12	1.64	1.27	10	30.3
61236	Ekstraklasa 24/25	24/25	3117	Pogoń Szczecin	33	16	7	10	55	1.67	56	40	16	1.70	1.21	13	39.4
61236	Ekstraklasa 24/25	24/25	3106	Legia Warszawa	33	14	9	10	51	1.55	58	45	13	1.76	1.36	6	18.2
61236	Ekstraklasa 24/25	24/25	4901	Cracovia	33	14	8	11	50	1.52	57	52	5	1.73	1.58	6	18.2
61236	Ekstraklasa 24/25	24/25	3112	GKS Katowice	33	14	7	12	49	1.48	48	45	3	1.45	1.36	9	27.3
61236	Ekstraklasa 24/25	24/25	3110	Górnik Zabrze	32	13	7	12	46	1.44	41	35	6	1.28	1.09	10	31.3
61236	Ekstraklasa 24/25	24/25	7915	Motor Lublin	32	13	7	12	46	1.44	46	57	-11	1.44	1.78	6	18.8
61236	Ekstraklasa 24/25	24/25	5065	MKS Korona Kielce	33	11	12	10	45	1.36	37	42	-5	1.12	1.27	8	24.2
61236	Ekstraklasa 24/25	24/25	7918	Piast Gliwice	33	11	11	11	44	1.33	36	35	1	1.09	1.06	11	33.3
61236	Ekstraklasa 24/25	24/25	3115	Widzew Łódź	33	11	6	16	39	1.18	37	48	-11	1.12	1.45	8	24.2
61236	Ekstraklasa 24/25	24/25	7295	Radomiak Radom	33	10	8	15	38	1.15	46	51	-5	1.39	1.55	5	15.2
61236	Ekstraklasa 24/25	24/25	7913	KS Lechia Gdańsk	32	10	6	16	36	1.13	43	56	-13	1.34	1.75	6	18.8
61236	Ekstraklasa 24/25	24/25	3113	Zagłębie Lubin	33	10	6	17	36	1.09	33	49	-16	1.00	1.48	6	18.2
61236	Ekstraklasa 24/25	24/25	38732	Stal Mielec	33	7	9	17	30	0.91	38	55	-17	1.15	1.67	4	12.1
61236	Ekstraklasa 24/25	24/25	3108	Śląsk Wrocław	33	6	11	16	29	0.88	37	52	-15	1.12	1.58	4	12.1
61236	Ekstraklasa 24/25	24/25	38729	Puszcza Niepołomice	32	6	9	17	27	0.84	35	59	-24	1.09	1.84	6	18.8
52176	Ekstraklasa 23/24	23/24	3108	Śląsk Wrocław	32	18	8	6	62	1.94	48	28	20	1.50	0.88	13	40.6
52176	Ekstraklasa 23/24	23/24	7691	Jagiellonia Białystok	32	17	9	6	60	1.88	73	41	32	2.28	1.28	9	28.1
52176	Ekstraklasa 23/24	23/24	3106	Legia Warszawa	33	15	11	7	56	1.70	48	39	9	1.45	1.18	9	27.3
52176	Ekstraklasa 23/24	23/24	3110	Górnik Zabrze	32	15	8	9	53	1.66	45	37	8	1.41	1.16	10	31.3
52176	Ekstraklasa 23/24	23/24	35268	Raków Częstochowa	33	13	10	10	49	1.48	51	39	12	1.55	1.18	10	30.3
52176	Ekstraklasa 23/24	23/24	3117	Pogoń Szczecin	32	14	7	11	49	1.53	56	37	19	1.75	1.16	10	31.3
52176	Ekstraklasa 23/24	23/24	3121	Lech Poznań	32	12	11	9	47	1.47	43	40	3	1.34	1.25	11	34.4
52176	Ekstraklasa 23/24	23/24	3115	Widzew Łódź	32	12	7	13	43	1.34	41	42	-1	1.28	1.31	7	21.9
52176	Ekstraklasa 23/24	23/24	7918	Piast Gliwice	32	9	15	8	42	1.31	37	33	4	1.16	1.03	13	40.6
52176	Ekstraklasa 23/24	23/24	38732	Stal Mielec	32	11	8	13	41	1.28	40	46	-6	1.25	1.44	8	25.0
52176	Ekstraklasa 23/24	23/24	3113	Zagłębie Lubin	32	11	8	13	41	1.28	39	48	-9	1.22	1.50	9	28.1
52176	Ekstraklasa 23/24	23/24	38729	Puszcza Niepołomice	32	9	13	10	40	1.25	36	42	-6	1.13	1.31	8	25.0
52176	Ekstraklasa 23/24	23/24	4901	Cracovia	33	8	14	11	38	1.15	43	44	-1	1.30	1.33	10	30.3
52176	Ekstraklasa 23/24	23/24	5065	MKS Korona Kielce	33	8	13	12	37	1.12	39	43	-4	1.18	1.30	7	21.2
52176	Ekstraklasa 23/24	23/24	7295	Radomiak Radom	32	9	8	15	35	1.09	39	56	-17	1.22	1.75	6	18.8
52176	Ekstraklasa 23/24	23/24	7922	Warta Poznań	32	8	10	14	34	1.06	31	42	-11	0.97	1.31	8	25.0
52176	Ekstraklasa 23/24	23/24	3105	Ruch Chorzów	32	5	14	13	29	0.91	37	53	-16	1.16	1.66	7	21.9
52176	Ekstraklasa 23/24	23/24	3123	ŁKS Łódź	32	6	6	20	24	0.75	34	70	-36	1.06	2.19	2	6.3
42004	Ekstraklasa 22/23	22/23	35268	Raków Częstochowa	33	22	6	5	72	2.18	62	24	38	1.88	0.73	16	48.5
42004	Ekstraklasa 22/23	22/23	3106	Legia Warszawa	33	19	8	6	65	1.97	56	36	20	1.70	1.09	12	36.4
42004	Ekstraklasa 22/23	22/23	3121	Lech Poznań	33	17	10	6	61	1.85	51	27	24	1.55	0.82	16	48.5
42004	Ekstraklasa 22/23	22/23	3117	Pogoń Szczecin	33	16	9	8	57	1.73	55	45	10	1.67	1.36	8	24.2
42004	Ekstraklasa 22/23	22/23	7918	Piast Gliwice	33	15	8	10	53	1.61	37	30	7	1.12	0.91	10	30.3
42004	Ekstraklasa 22/23	22/23	3110	Górnik Zabrze	33	13	9	11	48	1.45	45	41	4	1.36	1.24	11	33.3
42004	Ekstraklasa 22/23	22/23	7922	Warta Poznań	32	12	9	11	45	1.41	37	30	7	1.16	0.94	12	37.5
42004	Ekstraklasa 22/23	22/23	3113	Zagłębie Lubin	33	12	8	13	44	1.33	35	44	-9	1.06	1.33	8	24.2
42004	Ekstraklasa 22/23	22/23	7295	Radomiak Radom	33	12	7	14	43	1.30	33	40	-7	1.00	1.21	9	27.3
42004	Ekstraklasa 22/23	22/23	5065	MKS Korona Kielce	32	11	7	14	40	1.25	38	45	-7	1.19	1.41	8	25.0
42004	Ekstraklasa 22/23	22/23	4901	Cracovia	32	10	10	12	40	1.25	37	35	2	1.16	1.09	10	31.3
42004	Ekstraklasa 22/23	22/23	38732	Stal Mielec	33	10	10	13	40	1.21	34	40	-6	1.03	1.21	11	33.3
42004	Ekstraklasa 22/23	22/23	3115	Widzew Łódź	32	10	8	14	38	1.19	35	45	-10	1.09	1.41	11	34.4
42004	Ekstraklasa 22/23	22/23	7691	Jagiellonia Białystok	32	8	14	10	38	1.19	46	47	-1	1.44	1.47	4	12.5
42004	Ekstraklasa 22/23	22/23	3108	Śląsk Wrocław	33	9	10	14	37	1.12	35	48	-13	1.06	1.45	5	15.2
42004	Ekstraklasa 22/23	22/23	3122	Wisła Płock	32	8	7	17	31	0.97	34	50	-16	1.06	1.56	5	15.6
42004	Ekstraklasa 22/23	22/23	7913	KS Lechia Gdańsk	33	8	6	19	30	0.91	29	50	-21	0.88	1.52	11	33.3
42004	Ekstraklasa 22/23	22/23	35330	Miedź Legnica	33	4	10	19	22	0.67	32	54	-22	0.97	1.64	4	12.1
37062	Ekstraklasa 21/22	21/22	3121	Lech Poznań	32	21	7	4	70	2.19	64	23	41	2.00	0.72	14	43.8
37062	Ekstraklasa 21/22	21/22	35268	Raków Częstochowa	33	19	9	5	66	2.00	57	28	29	1.73	0.85	14	42.4
37062	Ekstraklasa 21/22	21/22	3117	Pogoń Szczecin	33	17	11	5	62	1.88	61	31	30	1.85	0.94	9	27.3
37062	Ekstraklasa 21/22	21/22	7913	KS Lechia Gdańsk	33	16	8	9	56	1.70	51	38	13	1.55	1.15	12	36.4
37062	Ekstraklasa 21/22	21/22	7918	Piast Gliwice	32	14	9	9	51	1.59	41	34	7	1.28	1.06	10	31.3
37062	Ekstraklasa 21/22	21/22	3122	Wisła Płock	33	15	3	15	48	1.45	48	50	-2	1.45	1.52	9	27.3
37062	Ekstraklasa 21/22	21/22	3110	Górnik Zabrze	32	13	8	11	47	1.47	54	50	4	1.69	1.56	6	18.8
37062	Ekstraklasa 21/22	21/22	7295	Radomiak Radom	33	11	14	8	47	1.42	42	40	2	1.27	1.21	8	24.2
37062	Ekstraklasa 21/22	21/22	4901	Cracovia	33	12	9	12	45	1.36	39	41	-2	1.18	1.24	10	30.3
37062	Ekstraklasa 21/22	21/22	7922	Warta Poznań	33	11	8	14	41	1.24	33	36	-3	1.00	1.09	10	30.3
37062	Ekstraklasa 21/22	21/22	3106	Legia Warszawa	33	12	4	17	40	1.21	45	48	-3	1.36	1.45	7	21.2
37062	Ekstraklasa 21/22	21/22	7691	Jagiellonia Białystok	33	9	12	12	39	1.18	38	49	-11	1.15	1.48	7	21.2
37062	Ekstraklasa 21/22	21/22	38732	Stal Mielec	32	9	9	14	36	1.13	38	49	-11	1.19	1.53	6	18.8
37062	Ekstraklasa 21/22	21/22	3113	Zagłębie Lubin	32	10	5	17	35	1.09	40	55	-15	1.25	1.72	8	25.0
37062	Ekstraklasa 21/22	21/22	3108	Śląsk Wrocław	33	7	13	13	34	1.03	40	50	-10	1.21	1.52	5	15.2
37062	Ekstraklasa 21/22	21/22	36851	Bruk-Bet Termalica Nieciecza	33	7	10	16	31	0.94	35	55	-20	1.06	1.67	5	15.2
37062	Ekstraklasa 21/22	21/22	3111	Wisła Kraków	33	6	10	17	28	0.85	34	54	-20	1.03	1.64	7	21.2
37062	Ekstraklasa 21/22	21/22	3125	Górnik Łęczna	32	6	9	17	27	0.84	27	56	-29	0.84	1.75	6	18.8
29222	Ekstraklasa 20/21	20/21	3106	Legia Warszawa	30	19	7	4	64	2.13	48	24	24	1.60	0.80	15	50.0
29222	Ekstraklasa 20/21	20/21	35268	Raków Częstochowa	30	17	8	5	59	1.97	46	25	21	1.53	0.83	12	40.0
29222	Ekstraklasa 20/21	20/21	3117	Pogoń Szczecin	30	15	7	8	52	1.73	36	23	13	1.20	0.77	17	56.7
29222	Ekstraklasa 20/21	20/21	3108	Śląsk Wrocław	30	11	10	9	43	1.43	36	32	4	1.20	1.07	9	30.0
29222	Ekstraklasa 20/21	20/21	7922	Warta Poznań	30	13	4	13	43	1.43	33	32	1	1.10	1.07	11	36.7
29222	Ekstraklasa 20/21	20/21	7918	Piast Gliwice	30	11	9	10	42	1.40	39	32	7	1.30	1.07	12	40.0
29222	Ekstraklasa 20/21	20/21	7913	KS Lechia Gdańsk	30	12	6	12	42	1.40	40	37	3	1.33	1.23	7	23.3
29222	Ekstraklasa 20/21	20/21	3113	Zagłębie Lubin	30	11	8	11	41	1.37	38	40	-2	1.27	1.33	7	23.3
29222	Ekstraklasa 20/21	20/21	4901	Cracovia	30	8	13	9	37	1.23	28	32	-4	0.93	1.07	9	30.0
29222	Ekstraklasa 20/21	20/21	7691	Jagiellonia Białystok	30	10	7	13	37	1.23	39	48	-9	1.30	1.60	4	13.3
29222	Ekstraklasa 20/21	20/21	3110	Górnik Zabrze	30	10	7	13	37	1.23	31	33	-2	1.03	1.10	9	30.0
29222	Ekstraklasa 20/21	20/21	3121	Lech Poznań	30	9	10	11	37	1.23	39	38	1	1.30	1.27	9	30.0
29222	Ekstraklasa 20/21	20/21	3111	Wisła Kraków	30	8	9	13	33	1.10	39	42	-3	1.30	1.40	9	30.0
29222	Ekstraklasa 20/21	20/21	3122	Wisła Płock	30	8	9	13	33	1.10	37	44	-7	1.23	1.47	9	30.0
29222	Ekstraklasa 20/21	20/21	38732	Stal Mielec	30	6	11	13	29	0.97	31	47	-16	1.03	1.57	5	16.7
29222	Ekstraklasa 20/21	20/21	7919	Podbeskidzie Bielsko-Biała	30	6	7	17	25	0.83	29	60	-31	0.97	2.00	4	13.3
23666	Ekstraklasa 19/20	19/20	3106	Legia Warszawa	37	21	6	10	69	1.86	70	35	35	1.89	0.95	14	37.8
23666	Ekstraklasa 19/20	19/20	3121	Lech Poznań	37	18	12	7	66	1.78	70	35	35	1.89	0.95	14	37.8
23666	Ekstraklasa 19/20	19/20	7918	Piast Gliwice	37	18	7	12	61	1.65	41	32	9	1.11	0.86	15	40.5
23666	Ekstraklasa 19/20	19/20	7913	KS Lechia Gdańsk	37	15	11	11	56	1.51	48	50	-2	1.30	1.35	9	24.3
23666	Ekstraklasa 19/20	19/20	3108	Śląsk Wrocław	37	14	12	11	54	1.46	51	46	5	1.38	1.24	7	18.9
23666	Ekstraklasa 19/20	19/20	3117	Pogoń Szczecin	37	14	12	11	54	1.46	37	39	-2	1.00	1.05	14	37.8
23666	Ekstraklasa 19/20	19/20	35268	Raków Częstochowa	37	16	5	16	53	1.43	51	56	-5	1.38	1.51	9	24.3
23666	Ekstraklasa 19/20	19/20	3110	Górnik Zabrze	37	14	11	12	53	1.43	51	47	4	1.38	1.27	10	27.0
23666	Ekstraklasa 19/20	19/20	3113	Zagłębie Lubin	37	15	8	14	53	1.43	61	53	8	1.65	1.43	7	18.9
23666	Ekstraklasa 19/20	19/20	4901	Cracovia	37	16	5	16	53	1.43	49	40	9	1.32	1.08	11	29.7
23666	Ekstraklasa 19/20	19/20	7691	Jagiellonia Białystok	37	14	10	13	52	1.41	48	51	-3	1.30	1.38	11	29.7
23666	Ekstraklasa 19/20	19/20	3122	Wisła Płock	37	14	9	14	51	1.38	45	54	-9	1.22	1.46	8	21.6
23666	Ekstraklasa 19/20	19/20	3111	Wisła Kraków	37	13	6	18	45	1.22	44	56	-12	1.19	1.51	11	29.7
23666	Ekstraklasa 19/20	19/20	5064	MZKS Arka Gdynia	37	10	10	17	40	1.08	39	57	-18	1.05	1.54	8	21.6
23666	Ekstraklasa 19/20	19/20	5065	MKS Korona Kielce	37	9	8	20	35	0.95	29	48	-19	0.78	1.30	11	29.7
23666	Ekstraklasa 19/20	19/20	3123	ŁKS Łódź	37	6	6	25	24	0.65	33	68	-35	0.89	1.84	5	13.5
17361	Ekstraklasa 18/19	18/19	7918	Piast Gliwice	37	21	9	7	72	1.95	57	33	24	1.54	0.89	16	43.2
17361	Ekstraklasa 18/19	18/19	3106	Legia Warszawa	37	20	8	9	68	1.84	55	38	17	1.49	1.03	14	37.8
17361	Ekstraklasa 18/19	18/19	7913	KS Lechia Gdańsk	37	19	10	8	67	1.81	54	38	16	1.46	1.03	18	48.6
17361	Ekstraklasa 18/19	18/19	7691	Jagiellonia Białystok	37	16	9	12	57	1.54	55	52	3	1.49	1.41	9	24.3
17361	Ekstraklasa 18/19	18/19	4901	Cracovia	37	17	6	14	57	1.54	45	43	2	1.22	1.16	12	32.4
17361	Ekstraklasa 18/19	18/19	3113	Zagłębie Lubin	37	15	8	14	53	1.43	57	48	9	1.54	1.30	9	24.3
17361	Ekstraklasa 18/19	18/19	3117	Pogoń Szczecin	37	14	10	13	52	1.41	57	54	3	1.54	1.46	10	27.0
17361	Ekstraklasa 18/19	18/19	3121	Lech Poznań	37	15	7	15	52	1.41	49	48	1	1.32	1.30	10	27.0
17361	Ekstraklasa 18/19	18/19	3111	Wisła Kraków	37	14	7	16	49	1.32	67	63	4	1.81	1.70	7	18.9
17361	Ekstraklasa 18/19	18/19	5065	MKS Korona Kielce	37	12	11	14	47	1.27	42	54	-12	1.14	1.46	8	21.6
17361	Ekstraklasa 18/19	18/19	3110	Górnik Zabrze	37	12	10	15	46	1.24	48	53	-5	1.30	1.43	9	24.3
17361	Ekstraklasa 18/19	18/19	3108	Śląsk Wrocław	37	12	8	17	44	1.19	49	45	4	1.32	1.22	10	27.0
17361	Ekstraklasa 18/19	18/19	5064	MZKS Arka Gdynia	37	10	12	15	42	1.14	49	51	-2	1.32	1.38	9	24.3
17361	Ekstraklasa 18/19	18/19	3122	Wisła Płock	37	10	11	16	41	1.11	50	58	-8	1.35	1.57	6	16.2
17361	Ekstraklasa 18/19	18/19	35330	Miedź Legnica	37	10	10	17	40	1.08	40	65	-25	1.08	1.76	8	21.6
17361	Ekstraklasa 18/19	18/19	7693	Zagłębie Sosnowiec	37	7	8	22	29	0.78	49	80	-31	1.32	2.16	4	10.8
13350	Ekstraklasa 17/18	17/18	3106	Legia Warszawa	37	22	4	11	70	1.89	55	35	20	1.49	0.95	15	40.5
13350	Ekstraklasa 17/18	17/18	7691	Jagiellonia Białystok	37	20	7	10	67	1.81	55	41	14	1.49	1.11	14	37.8
13350	Ekstraklasa 17/18	17/18	3121	Lech Poznań	37	16	12	9	60	1.62	53	34	19	1.43	0.92	15	40.5
13350	Ekstraklasa 17/18	17/18	3110	Górnik Zabrze	36	15	12	9	57	1.58	65	54	11	1.81	1.50	6	16.7
13350	Ekstraklasa 17/18	17/18	3122	Wisła Płock	37	17	6	14	57	1.54	53	45	8	1.43	1.22	11	29.7
13350	Ekstraklasa 17/18	17/18	3111	Wisła Kraków	37	15	10	12	55	1.49	51	42	9	1.38	1.14	13	35.1
13350	Ekstraklasa 17/18	17/18	3113	Zagłębie Lubin	37	13	13	11	52	1.41	45	42	3	1.22	1.14	14	37.8
13350	Ekstraklasa 17/18	17/18	3108	Śląsk Wrocław	37	13	11	13	50	1.35	50	54	-4	1.35	1.46	8	21.6
13350	Ekstraklasa 17/18	17/18	4901	Cracovia	37	13	11	13	50	1.35	51	52	-1	1.38	1.41	8	21.6
13350	Ekstraklasa 17/18	17/18	5065	MKS Korona Kielce	37	12	13	12	49	1.32	49	54	-5	1.32	1.46	12	32.4
13350	Ekstraklasa 17/18	17/18	3117	Pogoń Szczecin	37	12	9	16	45	1.22	46	54	-8	1.24	1.46	10	27.0
13350	Ekstraklasa 17/18	17/18	5064	MZKS Arka Gdynia	37	11	10	16	43	1.16	46	48	-2	1.24	1.30	13	35.1
13350	Ekstraklasa 17/18	17/18	7913	KS Lechia Gdańsk	37	9	13	15	40	1.08	46	58	-12	1.24	1.57	8	21.6
13350	Ekstraklasa 17/18	17/18	7918	Piast Gliwice	36	8	13	15	37	1.03	40	45	-5	1.11	1.25	11	30.6
13350	Ekstraklasa 17/18	17/18	36851	Bruk-Bet Termalica Nieciecza	37	9	9	19	36	0.97	39	66	-27	1.05	1.78	5	13.5
13350	Ekstraklasa 17/18	17/18	36766	Sandecja Nowy Sącz	37	6	15	16	33	0.89	34	54	-20	0.92	1.46	6	16.2
11734	Ekstraklasa 16/17	16/17	3106	Legia Warszawa	37	21	10	6	73	1.97	70	31	39	1.89	0.84	18	48.6
11734	Ekstraklasa 16/17	16/17	7691	Jagiellonia Białystok	37	21	8	8	71	1.92	64	39	25	1.73	1.05	14	37.8
11734	Ekstraklasa 16/17	16/17	3121	Lech Poznań	37	20	9	8	69	1.86	62	29	33	1.68	0.78	20	54.1
11734	Ekstraklasa 16/17	16/17	7913	KS Lechia Gdańsk	37	20	8	9	68	1.84	57	37	20	1.54	1.00	14	37.8
11734	Ekstraklasa 16/17	16/17	3113	Zagłębie Lubin	37	14	11	12	53	1.43	51	45	6	1.38	1.22	9	24.3
11734	Ekstraklasa 16/17	16/17	3111	Wisła Kraków	37	14	6	17	48	1.30	54	57	-3	1.46	1.54	8	21.6
11734	Ekstraklasa 16/17	16/17	5065	MKS Korona Kielce	37	14	5	18	47	1.27	47	65	-18	1.27	1.76	8	21.6
11734	Ekstraklasa 16/17	16/17	3122	Wisła Płock	37	12	11	14	47	1.27	49	57	-8	1.32	1.54	8	21.6
11734	Ekstraklasa 16/17	16/17	36851	Bruk-Bet Termalica Nieciecza	37	13	7	17	46	1.24	35	55	-20	0.95	1.49	9	24.3
11734	Ekstraklasa 16/17	16/17	3108	Śląsk Wrocław	37	12	10	15	46	1.24	49	52	-3	1.32	1.41	11	29.7
11734	Ekstraklasa 16/17	16/17	3117	Pogoń Szczecin	37	11	13	13	46	1.24	51	54	-3	1.38	1.46	6	16.2
11734	Ekstraklasa 16/17	16/17	7918	Piast Gliwice	37	12	10	15	46	1.24	45	54	-9	1.22	1.46	9	24.3
11734	Ekstraklasa 16/17	16/17	4901	Cracovia	37	8	15	14	39	1.05	45	52	-7	1.22	1.41	8	21.6
11734	Ekstraklasa 16/17	16/17	5064	MZKS Arka Gdynia	37	10	9	18	39	1.05	44	60	-16	1.19	1.62	9	24.3
11734	Ekstraklasa 16/17	16/17	3105	Ruch Chorzów	37	10	8	19	38	1.03	42	62	-20	1.14	1.68	7	18.9
11734	Ekstraklasa 16/17	16/17	3125	Górnik Łęczna	37	9	10	18	37	1.00	47	63	-16	1.27	1.70	10	27.0
10361	Ekstraklasa 15/16	15/16	3106	Legia Warszawa	36	20	10	6	70	1.94	66	31	35	1.83	0.86	14	38.9
10361	Ekstraklasa 15/16	15/16	7918	Piast Gliwice	35	19	9	7	66	1.89	59	43	16	1.69	1.23	13	37.1
10361	Ekstraklasa 15/16	15/16	3113	Zagłębie Lubin	35	17	8	10	59	1.69	54	39	15	1.54	1.11	11	31.4
10361	Ekstraklasa 15/16	15/16	4901	Cracovia	35	15	9	11	54	1.54	64	49	15	1.83	1.40	9	25.7
10361	Ekstraklasa 15/16	15/16	7913	KS Lechia Gdańsk	35	14	10	11	52	1.49	52	41	11	1.49	1.17	11	31.4
10361	Ekstraklasa 15/16	15/16	3117	Pogoń Szczecin	36	11	17	8	50	1.39	41	42	-1	1.14	1.17	11	30.6
10361	Ekstraklasa 15/16	15/16	3111	Wisła Kraków	35	12	13	10	49	1.40	59	43	16	1.69	1.23	7	20.0
10361	Ekstraklasa 15/16	15/16	3108	Śląsk Wrocław	36	12	12	12	48	1.33	40	42	-2	1.11	1.17	8	22.2
10361	Ekstraklasa 15/16	15/16	3121	Lech Poznań	35	13	6	16	45	1.29	39	44	-5	1.11	1.26	11	31.4
10361	Ekstraklasa 15/16	15/16	36851	Bruk-Bet Termalica Nieciecza	35	10	12	13	42	1.20	39	47	-8	1.11	1.34	10	28.6
10361	Ekstraklasa 15/16	15/16	7691	Jagiellonia Białystok	35	12	6	17	42	1.20	42	59	-17	1.20	1.69	9	25.7
10361	Ekstraklasa 15/16	15/16	5065	MKS Korona Kielce	35	8	15	12	39	1.11	34	43	-9	0.97	1.23	10	28.6
10361	Ekstraklasa 15/16	15/16	3105	Ruch Chorzów	35	10	8	17	38	1.09	38	58	-20	1.09	1.66	9	25.7
10361	Ekstraklasa 15/16	15/16	7919	Podbeskidzie Bielsko-Biała	36	9	11	16	38	1.06	44	62	-18	1.22	1.72	8	22.2
10361	Ekstraklasa 15/16	15/16	3125	Górnik Łęczna	36	9	9	18	36	1.00	38	53	-15	1.06	1.47	9	25.0
10361	Ekstraklasa 15/16	15/16	3110	Górnik Zabrze	36	6	17	13	35	0.97	37	50	-13	1.03	1.39	8	22.2
8206	Ekstraklasa 14/15	14/15	3121	Lech Poznań	37	19	13	5	70	1.89	67	33	34	1.81	0.89	13	35.1
8206	Ekstraklasa 14/15	14/15	3106	Legia Warszawa	37	21	7	9	70	1.89	64	33	31	1.73	0.89	18	48.6
8206	Ekstraklasa 14/15	14/15	7691	Jagiellonia Białystok	37	19	8	10	65	1.76	59	44	15	1.59	1.19	11	29.7
8206	Ekstraklasa 14/15	14/15	3108	Śląsk Wrocław	37	15	13	9	58	1.57	50	43	7	1.35	1.16	11	29.7
8206	Ekstraklasa 14/15	14/15	4901	Cracovia	37	15	9	13	54	1.46	50	44	6	1.35	1.19	10	27.0
8206	Ekstraklasa 14/15	14/15	3111	Wisła Kraków	37	12	13	12	49	1.32	56	48	8	1.51	1.30	7	18.9
8206	Ekstraklasa 14/15	14/15	7913	KS Lechia Gdańsk	37	13	10	14	49	1.32	45	47	-2	1.22	1.27	12	32.4
8206	Ekstraklasa 14/15	14/15	7918	Piast Gliwice	37	13	8	16	47	1.27	50	56	-6	1.35	1.51	9	24.3
8206	Ekstraklasa 14/15	14/15	3110	Górnik Zabrze	37	12	11	14	47	1.27	50	60	-10	1.35	1.62	8	21.6
8206	Ekstraklasa 14/15	14/15	5065	MKS Korona Kielce	37	12	11	14	47	1.27	44	55	-11	1.19	1.49	6	16.2
8206	Ekstraklasa 14/15	14/15	3105	Ruch Chorzów	37	12	10	15	46	1.24	44	46	-2	1.19	1.24	12	32.4
8206	Ekstraklasa 14/15	14/15	7919	Podbeskidzie Bielsko-Biała	37	12	10	15	46	1.24	47	60	-13	1.27	1.62	8	21.6
8206	Ekstraklasa 14/15	14/15	3125	Górnik Łęczna	37	11	11	15	44	1.19	39	46	-7	1.05	1.24	8	21.6
8206	Ekstraklasa 14/15	14/15	3117	Pogoń Szczecin	37	11	9	17	42	1.14	45	52	-7	1.22	1.41	7	18.9
8206	Ekstraklasa 14/15	14/15	35329	Zawisza Bydgoszcz	37	10	8	19	38	1.03	45	63	-18	1.22	1.70	8	21.6
8206	Ekstraklasa 14/15	14/15	3128	GKS Bełchatów	37	9	9	19	36	0.97	35	60	-25	0.95	1.62	9	24.3
6261	Ekstraklasa 13/14	13/14	3106	Legia Warszawa	36	26	3	7	81	2.25	75	31	44	2.08	0.86	15	41.7
6261	Ekstraklasa 13/14	13/14	3121	Lech Poznań	37	19	9	9	66	1.78	68	40	28	1.84	1.08	11	29.7
6261	Ekstraklasa 13/14	13/14	3105	Ruch Chorzów	37	16	11	10	59	1.59	47	48	-1	1.27	1.30	11	29.7
6261	Ekstraklasa 13/14	13/14	3111	Wisła Kraków	37	14	11	12	53	1.43	51	46	5	1.38	1.24	15	40.5
6261	Ekstraklasa 13/14	13/14	7913	KS Lechia Gdańsk	37	13	13	11	52	1.41	46	41	5	1.24	1.11	14	37.8
6261	Ekstraklasa 13/14	13/14	3110	Górnik Zabrze	37	14	10	13	52	1.41	53	57	-4	1.43	1.54	8	21.6
6261	Ekstraklasa 13/14	13/14	3108	Śląsk Wrocław	37	12	15	10	51	1.38	49	41	8	1.32	1.11	15	40.5
6261	Ekstraklasa 13/14	13/14	3117	Pogoń Szczecin	37	11	17	9	50	1.35	50	50	0	1.35	1.35	9	24.3
6261	Ekstraklasa 13/14	13/14	35329	Zawisza Bydgoszcz	37	12	10	15	46	1.24	48	48	0	1.30	1.30	9	24.3
6261	Ekstraklasa 13/14	13/14	7919	Podbeskidzie Bielsko-Biała	37	10	15	12	45	1.22	39	45	-6	1.05	1.22	16	43.2
6261	Ekstraklasa 13/14	13/14	7918	Piast Gliwice	37	11	12	14	45	1.22	43	56	-13	1.16	1.51	11	29.7
6261	Ekstraklasa 13/14	13/14	7691	Jagiellonia Białystok	36	11	12	13	45	1.25	56	58	-2	1.56	1.61	7	19.4
6261	Ekstraklasa 13/14	13/14	5065	MKS Korona Kielce	37	10	14	13	44	1.19	47	56	-9	1.27	1.51	8	21.6
6261	Ekstraklasa 13/14	13/14	4901	Cracovia	37	12	8	17	44	1.19	43	56	-13	1.16	1.51	7	18.9
6261	Ekstraklasa 13/14	13/14	3115	Widzew Łódź	37	7	10	20	31	0.84	36	59	-23	0.97	1.59	4	10.8
6261	Ekstraklasa 13/14	13/14	3113	Zagłębie Lubin	37	7	10	20	31	0.84	32	51	-19	0.86	1.38	7	18.9
4634	Ekstraklasa 12/13	12/13	3106	Legia Warszawa	30	20	7	3	67	2.23	59	22	37	1.97	0.73	14	46.7
4634	Ekstraklasa 12/13	12/13	3121	Lech Poznań	30	19	4	7	61	2.03	46	22	24	1.53	0.73	17	56.7
4634	Ekstraklasa 12/13	12/13	3108	Śląsk Wrocław	30	13	8	9	47	1.57	44	42	2	1.47	1.40	8	26.7
4634	Ekstraklasa 12/13	12/13	7918	Piast Gliwice	30	13	7	10	46	1.53	41	41	0	1.37	1.37	7	23.3
4634	Ekstraklasa 12/13	12/13	3110	Górnik Zabrze	30	12	7	11	43	1.43	35	31	4	1.17	1.03	9	30.0
4634	Ekstraklasa 12/13	12/13	3119	Polonia Warszawa	30	11	9	10	42	1.40	45	34	11	1.50	1.13	7	23.3
4634	Ekstraklasa 12/13	12/13	3113	Zagłębie Lubin	30	11	7	12	40	1.33	38	37	1	1.27	1.23	10	33.3
4634	Ekstraklasa 12/13	12/13	7913	KS Lechia Gdańsk	30	10	8	12	38	1.27	42	43	-1	1.40	1.43	8	26.7
4634	Ekstraklasa 12/13	12/13	3111	Wisła Kraków	30	10	8	12	38	1.27	28	35	-7	0.93	1.17	10	33.3
4634	Ekstraklasa 12/13	12/13	7691	Jagiellonia Białystok	30	8	13	9	37	1.23	31	45	-14	1.03	1.50	7	23.3
4634	Ekstraklasa 12/13	12/13	5065	MKS Korona Kielce	30	9	9	12	36	1.20	32	37	-5	1.07	1.23	7	23.3
4634	Ekstraklasa 12/13	12/13	3117	Pogoń Szczecin	30	10	5	15	35	1.17	29	39	-10	0.97	1.30	7	23.3
4634	Ekstraklasa 12/13	12/13	3115	Widzew Łódź	30	8	9	13	33	1.10	30	41	-11	1.00	1.37	8	26.7
4634	Ekstraklasa 12/13	12/13	7919	Podbeskidzie Bielsko-Biała	30	8	8	14	32	1.07	39	43	-4	1.30	1.43	4	13.3
4634	Ekstraklasa 12/13	12/13	3128	GKS Bełchatów	30	7	10	13	31	1.03	24	38	-14	0.80	1.27	8	26.7
4634	Ekstraklasa 12/13	12/13	3105	Ruch Chorzów	30	8	7	15	31	1.03	35	48	-13	1.17	1.60	4	13.3
3411	Ekstraklasa 11/12	11/12	3108	Śląsk Wrocław	30	17	5	8	56	1.87	47	31	16	1.57	1.03	11	36.7
3411	Ekstraklasa 11/12	11/12	3105	Ruch Chorzów	30	16	7	7	55	1.83	44	28	16	1.47	0.93	10	33.3
3411	Ekstraklasa 11/12	11/12	3106	Legia Warszawa	30	15	8	7	53	1.77	42	17	25	1.40	0.57	17	56.7
3411	Ekstraklasa 11/12	11/12	3121	Lech Poznań	30	15	7	8	52	1.73	42	22	20	1.40	0.73	16	53.3
3411	Ekstraklasa 11/12	11/12	5065	MKS Korona Kielce	30	13	9	8	48	1.60	34	29	5	1.13	0.97	14	46.7
3411	Ekstraklasa 11/12	11/12	3119	Polonia Warszawa	30	13	6	11	45	1.50	33	32	1	1.10	1.07	10	33.3
3411	Ekstraklasa 11/12	11/12	3111	Wisła Kraków	30	12	7	11	43	1.43	29	26	3	0.97	0.87	10	33.3
3411	Ekstraklasa 11/12	11/12	3110	Górnik Zabrze	30	11	9	10	42	1.40	36	30	6	1.20	1.00	10	33.3
3411	Ekstraklasa 11/12	11/12	3113	Zagłębie Lubin	30	11	7	12	40	1.33	36	42	-6	1.20	1.40	8	26.7
3411	Ekstraklasa 11/12	11/12	3115	Widzew Łódź	30	9	12	9	39	1.30	25	26	-1	0.83	0.87	13	43.3
3411	Ekstraklasa 11/12	11/12	7691	Jagiellonia Białystok	30	11	6	13	39	1.30	35	45	-10	1.17	1.50	6	20.0
3411	Ekstraklasa 11/12	11/12	7919	Podbeskidzie Bielsko-Biała	30	9	8	13	35	1.17	26	39	-13	0.87	1.30	10	33.3
3411	Ekstraklasa 11/12	11/12	3128	GKS Bełchatów	30	7	10	13	31	1.03	34	36	-2	1.13	1.20	7	23.3
3411	Ekstraklasa 11/12	11/12	7913	KS Lechia Gdańsk	30	7	10	13	31	1.03	21	30	-9	0.70	1.00	11	36.7
3411	Ekstraklasa 11/12	11/12	3123	ŁKS Łódź	30	5	9	16	24	0.80	23	53	-30	0.77	1.77	7	23.3
3411	Ekstraklasa 11/12	11/12	4901	Cracovia	30	4	10	16	22	0.73	20	41	-21	0.67	1.37	7	23.3
2737	Ekstraklasa 10/11	10/11	3111	Wisła Kraków	30	17	5	8	56	1.87	44	29	15	1.47	0.97	14	46.7
2737	Ekstraklasa 10/11	10/11	3106	Legia Warszawa	30	15	4	11	49	1.63	45	38	7	1.50	1.27	10	33.3
2737	Ekstraklasa 10/11	10/11	3108	Śląsk Wrocław	30	13	10	7	49	1.63	46	34	12	1.53	1.13	11	36.7
2737	Ekstraklasa 10/11	10/11	7691	Jagiellonia Białystok	30	14	6	10	48	1.60	38	32	6	1.27	1.07	13	43.3
2737	Ekstraklasa 10/11	10/11	3110	Górnik Zabrze	30	13	6	11	45	1.50	36	40	-4	1.20	1.33	9	30.0
2737	Ekstraklasa 10/11	10/11	3121	Lech Poznań	30	13	6	11	45	1.50	37	23	14	1.23	0.77	13	43.3
2737	Ekstraklasa 10/11	10/11	3119	Polonia Warszawa	30	12	8	10	44	1.47	41	26	15	1.37	0.87	14	46.7
2737	Ekstraklasa 10/11	10/11	7913	KS Lechia Gdańsk	30	12	7	11	43	1.43	37	36	1	1.23	1.20	10	33.3
2737	Ekstraklasa 10/11	10/11	3115	Widzew Łódź	30	11	10	9	43	1.43	41	34	7	1.37	1.13	6	20.0
2737	Ekstraklasa 10/11	10/11	3128	GKS Bełchatów	30	10	10	10	40	1.33	31	33	-2	1.03	1.10	12	40.0
2737	Ekstraklasa 10/11	10/11	3113	Zagłębie Lubin	30	10	9	11	39	1.30	31	38	-7	1.03	1.27	9	30.0
2737	Ekstraklasa 10/11	10/11	3105	Ruch Chorzów	30	10	8	12	38	1.27	29	32	-3	0.97	1.07	13	43.3
2737	Ekstraklasa 10/11	10/11	5065	MKS Korona Kielce	30	10	7	13	37	1.23	34	48	-14	1.13	1.60	8	26.7
2737	Ekstraklasa 10/11	10/11	4901	Cracovia	30	8	5	17	29	0.97	37	47	-10	1.23	1.57	7	23.3
2737	Ekstraklasa 10/11	10/11	5064	MZKS Arka Gdynia	30	6	10	14	28	0.93	22	43	-21	0.73	1.43	8	26.7
2737	Ekstraklasa 10/11	10/11	7692	Polonia Bytom	30	6	9	15	27	0.90	29	45	-16	0.97	1.50	7	23.3
2275	Ekstraklasa 09/10	09/10	3121	Lech Poznań	30	19	8	3	65	2.17	51	20	31	1.70	0.67	16	53.3
2275	Ekstraklasa 09/10	09/10	3111	Wisła Kraków	30	19	5	6	62	2.07	48	20	28	1.60	0.67	11	36.7
2275	Ekstraklasa 09/10	09/10	3105	Ruch Chorzów	30	16	5	9	53	1.77	40	30	10	1.33	1.00	13	43.3
2275	Ekstraklasa 09/10	09/10	3106	Legia Warszawa	30	15	7	8	52	1.73	36	22	14	1.20	0.73	14	46.7
2275	Ekstraklasa 09/10	09/10	3128	GKS Bełchatów	30	13	9	8	48	1.60	37	27	10	1.23	0.90	12	40.0
2275	Ekstraklasa 09/10	09/10	7691	Jagiellonia Białystok	30	11	11	8	44	1.47	29	27	2	0.97	0.90	15	50.0
2275	Ekstraklasa 09/10	09/10	7913	KS Lechia Gdańsk	30	9	10	11	37	1.23	30	32	-2	1.00	1.07	9	30.0
2275	Ekstraklasa 09/10	09/10	5065	MKS Korona Kielce	30	9	10	11	37	1.23	35	41	-6	1.17	1.37	8	26.7
2275	Ekstraklasa 09/10	09/10	7692	Polonia Bytom	30	9	10	11	37	1.23	29	31	-2	0.97	1.03	9	30.0
2275	Ekstraklasa 09/10	09/10	3108	Śląsk Wrocław	30	8	12	10	36	1.20	32	33	-1	1.07	1.10	9	30.0
2275	Ekstraklasa 09/10	09/10	3113	Zagłębie Lubin	30	8	11	11	35	1.17	30	38	-8	1.00	1.27	9	30.0
2275	Ekstraklasa 09/10	09/10	4901	Cracovia	30	9	7	14	34	1.13	25	39	-14	0.83	1.30	10	33.3
2275	Ekstraklasa 09/10	09/10	3119	Polonia Warszawa	30	9	6	15	33	1.10	25	38	-13	0.83	1.27	6	20.0
2275	Ekstraklasa 09/10	09/10	5064	MZKS Arka Gdynia	30	7	7	16	28	0.93	28	39	-11	0.93	1.30	6	20.0
2275	Ekstraklasa 09/10	09/10	7918	Piast Gliwice	30	7	6	17	27	0.90	30	50	-20	1.00	1.67	6	20.0
2275	Ekstraklasa 09/10	09/10	3114	MKS Odra Wodzisław Śląski	30	7	6	17	27	0.90	27	45	-18	0.90	1.50	7	23.3
1691	Ekstraklasa 08/09	08/09	3111	Wisła Kraków	30	19	7	4	64	2.13	53	21	32	1.77	0.70	15	50.0
1691	Ekstraklasa 08/09	08/09	3106	Legia Warszawa	30	18	7	5	61	2.03	52	17	35	1.73	0.57	17	56.7
1691	Ekstraklasa 08/09	08/09	3121	Lech Poznań	30	16	11	3	59	1.97	51	24	27	1.70	0.80	14	46.7
1691	Ekstraklasa 08/09	08/09	3128	GKS Bełchatów	30	17	3	10	54	1.80	40	28	12	1.33	0.93	13	43.3
1691	Ekstraklasa 08/09	08/09	3119	Polonia Warszawa	30	15	9	6	54	1.80	40	23	17	1.33	0.77	16	53.3
1691	Ekstraklasa 08/09	08/09	3108	Śląsk Wrocław	30	11	12	7	45	1.50	40	34	6	1.33	1.13	7	23.3
1691	Ekstraklasa 08/09	08/09	7692	Polonia Bytom	30	10	5	15	35	1.17	30	46	-16	1.00	1.53	7	23.3
1691	Ekstraklasa 08/09	08/09	3123	ŁKS Łódź	30	10	5	15	35	1.17	27	43	-16	0.90	1.43	10	33.3
1691	Ekstraklasa 08/09	08/09	3105	Ruch Chorzów	30	9	7	14	34	1.13	22	32	-10	0.73	1.07	12	40.0
1691	Ekstraklasa 08/09	08/09	7691	Jagiellonia Białystok	30	9	7	14	34	1.13	28	34	-6	0.93	1.13	9	30.0
1691	Ekstraklasa 08/09	08/09	7918	Piast Gliwice	31	9	6	15	33	1.06	17	26	-9	0.55	0.84	12	38.7
1691	Ekstraklasa 08/09	08/09	7913	KS Lechia Gdańsk	30	9	5	16	32	1.07	30	44	-14	1.00	1.47	7	23.3
1691	Ekstraklasa 08/09	08/09	3114	MKS Odra Wodzisław Śląski	30	8	8	14	32	1.07	23	40	-17	0.77	1.33	10	33.3
1691	Ekstraklasa 08/09	08/09	4901	Cracovia	30	7	9	14	30	1.00	24	40	-16	0.80	1.33	10	33.3
1691	Ekstraklasa 08/09	08/09	5064	MZKS Arka Gdynia	30	7	9	14	30	1.00	27	39	-12	0.90	1.30	8	26.7
1691	Ekstraklasa 08/09	08/09	3110	Górnik Zabrze	31	7	8	15	29	0.94	20	33	-13	0.65	1.06	11	35.5
\.


--
-- Data for Name: mart_team_possession; Type: TABLE DATA; Schema: gold; Owner: airflow
--

COPY gold.mart_team_possession (team_id, team_name, season_id, season_name, season_year, matches_played, avg_possession_pct, total_accurate_passes, total_passes, accurate_passes_per_game, total_passes_per_game, pass_accuracy_pct, total_accurate_long_balls, accurate_long_balls_per_game, total_accurate_crosses, accurate_crosses_per_game, total_final_third_entries, final_third_entries_per_game, total_touches_in_box, touches_in_box_per_game, total_dispossessed, dispossessed_per_game, total_throw_ins, throw_ins_per_game, total_goal_kicks, goal_kicks_per_game) FROM stdin;
7691	Jagiellonia Białystok	76477	Ekstraklasa 25/26	25/26	17	59.2	7069	8364	415.8	492.0	84.5	299	17.59	88	5.18	915	53.82	447	26.29	158	9.29	288	16.94	116	6.82
7918	Piast Gliwice	76477	Ekstraklasa 25/26	25/26	17	57.4	6321	7544	371.8	443.8	83.8	368	21.65	78	4.59	909	53.47	392	23.06	114	6.71	307	18.06	109	6.41
3121	Lech Poznań	76477	Ekstraklasa 25/26	25/26	17	56.4	6401	7618	376.5	448.1	84.0	405	23.82	67	3.94	1008	59.29	426	25.06	116	6.82	289	17.00	128	7.53
3106	Legia Warszawa	76477	Ekstraklasa 25/26	25/26	18	56.2	6357	7773	353.2	431.8	81.8	408	22.67	104	5.78	1147	63.72	500	27.78	143	7.94	329	18.28	92	5.11
35268	Raków Częstochowa	76477	Ekstraklasa 25/26	25/26	18	54.3	6156	7461	342.0	414.5	82.5	404	22.44	102	5.67	858	47.67	444	24.67	137	7.61	282	15.67	113	6.28
7915	Motor Lublin	76477	Ekstraklasa 25/26	25/26	18	51.9	5674	6834	315.2	379.7	83.0	286	15.89	82	4.56	729	40.50	434	24.11	147	8.17	262	14.56	161	8.94
3117	Pogoń Szczecin	76477	Ekstraklasa 25/26	25/26	18	51.9	5747	7152	319.3	397.3	80.4	382	21.22	94	5.22	948	52.67	515	28.61	102	5.67	336	18.67	130	7.22
3110	Górnik Zabrze	76477	Ekstraklasa 25/26	25/26	18	49.6	5875	6970	326.4	387.2	84.3	450	25.00	76	4.22	812	45.11	455	25.28	124	6.89	320	17.78	105	5.83
4901	Cracovia	76477	Ekstraklasa 25/26	25/26	18	49.5	5553	6953	308.5	386.3	79.9	341	18.94	76	4.22	905	50.28	324	18.00	108	6.00	302	16.78	123	6.83
7295	Radomiak Radom	76477	Ekstraklasa 25/26	25/26	18	49.3	4996	6163	277.6	342.4	81.1	353	19.61	73	4.06	752	41.78	354	19.67	120	6.67	285	15.83	128	7.11
7913	KS Lechia Gdańsk	76477	Ekstraklasa 25/26	25/26	18	48.7	4881	6203	271.2	344.6	78.7	294	16.33	84	4.67	899	49.94	393	21.83	81	4.50	354	19.67	115	6.39
3115	Widzew Łódź	76477	Ekstraklasa 25/26	25/26	18	47.9	4923	6141	273.5	341.2	80.2	388	21.56	47	2.61	782	43.44	373	20.72	124	6.89	277	15.39	135	7.50
3112	GKS Katowice	76477	Ekstraklasa 25/26	25/26	17	47.4	4889	6199	287.6	364.6	78.9	385	22.65	69	4.06	804	47.29	368	21.65	101	5.94	318	18.71	134	7.88
5065	MKS Korona Kielce	76477	Ekstraklasa 25/26	25/26	18	46.4	4640	5948	257.8	330.4	78.0	374	20.78	84	4.67	884	49.11	466	25.89	124	6.89	295	16.39	137	7.61
36851	Bruk-Bet Termalica Nieciecza	76477	Ekstraklasa 25/26	25/26	18	45.6	4912	6254	272.9	347.4	78.5	408	22.67	79	4.39	869	48.28	349	19.39	144	8.00	290	16.11	140	7.78
5064	MZKS Arka Gdynia	76477	Ekstraklasa 25/26	25/26	18	45.5	4614	5813	256.3	322.9	79.4	304	16.89	67	3.72	757	42.06	279	15.50	118	6.56	289	16.06	149	8.28
3122	Wisła Płock	76477	Ekstraklasa 25/26	25/26	18	43.1	4901	6134	272.3	340.8	79.9	439	24.39	78	4.33	793	44.06	322	17.89	92	5.11	272	15.11	139	7.72
3113	Zagłębie Lubin	76477	Ekstraklasa 25/26	25/26	18	40.8	3982	5422	221.2	301.2	73.4	423	23.50	85	4.72	805	44.72	371	20.61	111	6.17	281	15.61	141	7.83
3121	Lech Poznań	61236	Ekstraklasa 24/25	24/25	33	59.1	14014	16617	424.7	503.5	84.3	677	20.52	145	4.39	1812	54.91	932	28.24	249	7.55	615	18.64	255	7.73
3110	Górnik Zabrze	61236	Ekstraklasa 24/25	24/25	32	56.8	14332	16734	447.9	522.9	85.6	1107	34.59	114	3.56	1612	50.38	725	22.66	214	6.69	542	16.94	259	8.09
3117	Pogoń Szczecin	61236	Ekstraklasa 24/25	24/25	33	55.9	12254	14928	371.3	452.4	82.1	830	25.15	188	5.70	1836	55.64	897	27.18	212	6.42	635	19.24	228	6.91
3106	Legia Warszawa	61236	Ekstraklasa 24/25	24/25	33	53.8	11804	14473	357.7	438.6	81.6	663	20.09	165	5.00	1836	55.64	1045	31.67	323	9.79	628	19.03	238	7.21
7691	Jagiellonia Białystok	61236	Ekstraklasa 24/25	24/25	33	53.8	12334	14878	373.8	450.8	82.9	687	20.82	135	4.09	1844	55.88	964	29.21	249	7.55	585	17.73	250	7.58
35268	Raków Częstochowa	61236	Ekstraklasa 24/25	24/25	33	52.3	11044	13607	334.7	412.3	81.2	760	23.03	174	5.27	1679	50.88	799	24.21	264	8.00	613	18.58	233	7.06
3115	Widzew Łódź	61236	Ekstraklasa 24/25	24/25	33	49.5	11046	13481	334.7	408.5	81.9	697	21.12	137	4.15	1564	47.39	653	19.79	276	8.36	622	18.85	260	7.88
38732	Stal Mielec	61236	Ekstraklasa 24/25	24/25	33	49.0	10932	13623	331.3	412.8	80.2	818	24.79	204	6.18	1579	47.85	757	22.94	274	8.30	639	19.36	280	8.48
3112	GKS Katowice	61236	Ekstraklasa 24/25	24/25	33	48.5	10626	13362	322.0	404.9	79.5	808	24.48	171	5.18	1526	46.24	814	24.67	262	7.94	552	16.73	322	9.76
7918	Piast Gliwice	61236	Ekstraklasa 24/25	24/25	33	48.4	10901	13838	330.3	419.3	78.8	781	23.67	146	4.42	1854	56.18	726	22.00	236	7.15	612	18.55	225	6.82
7913	KS Lechia Gdańsk	61236	Ekstraklasa 24/25	24/25	32	48.3	9691	12271	302.8	383.5	79.0	713	22.28	109	3.41	1757	54.91	760	23.75	204	6.38	692	21.63	258	8.06
3108	Śląsk Wrocław	61236	Ekstraklasa 24/25	24/25	33	48.2	9443	11984	286.2	363.2	78.8	788	23.88	155	4.70	1628	49.33	779	23.61	279	8.45	605	18.33	232	7.03
7295	Radomiak Radom	61236	Ekstraklasa 24/25	24/25	33	47.8	9255	11936	280.5	361.7	77.5	778	23.58	199	6.03	1573	47.67	768	23.27	242	7.33	623	18.88	279	8.45
7915	Motor Lublin	61236	Ekstraklasa 24/25	24/25	32	47.8	10402	12837	325.1	401.2	81.0	540	16.88	140	4.38	1632	51.00	722	22.56	227	7.09	609	19.03	247	7.72
5065	MKS Korona Kielce	61236	Ekstraklasa 24/25	24/25	33	47.1	9122	11824	276.4	358.3	77.1	694	21.03	142	4.30	1717	52.03	688	20.85	293	8.88	605	18.33	278	8.42
4901	Cracovia	61236	Ekstraklasa 24/25	24/25	33	47.0	9663	12377	292.8	375.1	78.1	726	22.00	165	5.00	1760	53.33	705	21.36	250	7.58	627	19.00	254	7.70
3113	Zagłębie Lubin	61236	Ekstraklasa 24/25	24/25	33	46.3	9187	12015	278.4	364.1	76.5	748	22.67	166	5.03	1707	51.73	789	23.91	233	7.06	635	19.24	263	7.97
38729	Puszcza Niepołomice	61236	Ekstraklasa 24/25	24/25	32	40.1	6472	9101	202.3	284.4	71.1	856	26.75	146	4.56	1670	52.19	700	21.88	181	5.66	514	16.06	316	9.88
3121	Lech Poznań	52176	Ekstraklasa 23/24	23/24	32	59.0	13307	15883	415.8	496.3	83.8	1015	31.72	146	4.56	1921	60.03	41	1.28	259	8.09	635	19.84	246	7.69
7691	Jagiellonia Białystok	52176	Ekstraklasa 23/24	23/24	32	57.9	13749	16276	429.7	508.6	84.5	713	22.28	139	4.34	1783	55.72	133	4.16	224	7.00	587	18.34	218	6.81
3106	Legia Warszawa	52176	Ekstraklasa 23/24	23/24	33	56.8	12909	15610	391.2	473.0	82.7	753	22.82	184	5.58	2009	60.88	63	1.91	274	8.30	682	20.67	236	7.15
35268	Raków Częstochowa	52176	Ekstraklasa 23/24	23/24	33	55.9	12209	15055	370.0	456.2	81.1	850	25.76	164	4.97	1946	58.97	78	2.36	265	8.03	682	20.67	206	6.24
3117	Pogoń Szczecin	52176	Ekstraklasa 23/24	23/24	32	55.8	12529	15288	391.5	477.8	82.0	859	26.84	182	5.69	1933	60.41	81	2.53	207	6.47	651	20.34	222	6.94
3115	Widzew Łódź	52176	Ekstraklasa 23/24	23/24	32	52.7	11723	14402	366.3	450.1	81.4	767	23.97	151	4.72	1860	58.13	48	1.50	234	7.31	700	21.88	239	7.47
3113	Zagłębie Lubin	52176	Ekstraklasa 23/24	23/24	32	50.2	11671	14383	364.7	449.5	81.1	859	26.84	147	4.59	1665	52.03	55	1.72	235	7.34	603	18.84	231	7.22
7918	Piast Gliwice	52176	Ekstraklasa 23/24	23/24	32	50.0	10346	13142	323.3	410.7	78.7	768	24.00	144	4.50	1912	59.75	36	1.13	221	6.91	666	20.81	219	6.84
5065	MKS Korona Kielce	52176	Ekstraklasa 23/24	23/24	33	49.4	9496	12540	287.8	380.0	75.7	1017	30.82	146	4.42	1931	58.52	78	2.36	227	6.88	774	23.45	241	7.30
3110	Górnik Zabrze	52176	Ekstraklasa 23/24	23/24	32	49.3	10813	13347	337.9	417.1	81.0	1061	33.16	101	3.16	1555	48.59	64	2.00	190	5.94	594	18.56	317	9.91
38732	Stal Mielec	52176	Ekstraklasa 23/24	23/24	32	48.7	10871	13784	339.7	430.8	78.9	815	25.47	116	3.63	1652	51.63	54	1.69	240	7.50	650	20.31	327	10.22
3123	ŁKS Łódź	52176	Ekstraklasa 23/24	23/24	32	48.6	10340	12932	323.1	404.1	80.0	847	26.47	94	2.94	1584	49.50	35	1.09	265	8.28	628	19.63	293	9.16
7295	Radomiak Radom	52176	Ekstraklasa 23/24	23/24	32	48.6	8914	11531	278.6	360.3	77.3	796	24.88	189	5.91	1711	53.47	38	1.19	212	6.63	644	20.13	238	7.44
3105	Ruch Chorzów	52176	Ekstraklasa 23/24	23/24	32	47.8	9121	11984	285.0	374.5	76.1	780	24.38	150	4.69	1602	50.06	53	1.66	213	6.66	716	22.38	290	9.06
4901	Cracovia	52176	Ekstraklasa 23/24	23/24	33	44.8	8878	11730	269.0	355.5	75.7	871	26.39	166	5.03	1870	56.67	97	2.94	211	6.39	680	20.61	272	8.24
3108	Śląsk Wrocław	52176	Ekstraklasa 23/24	23/24	32	44.4	9067	11648	283.3	364.0	77.8	1001	31.28	121	3.78	1673	52.28	81	2.53	270	8.44	582	18.19	286	8.94
7922	Warta Poznań	52176	Ekstraklasa 23/24	23/24	32	41.7	7683	10874	240.1	339.8	70.7	753	23.53	123	3.84	1929	60.28	68	2.13	230	7.19	688	21.50	240	7.50
38729	Puszcza Niepołomice	52176	Ekstraklasa 23/24	23/24	32	38.0	5830	8594	182.2	268.6	67.8	795	24.84	161	5.03	1581	49.41	79	2.47	188	5.88	606	18.94	314	9.81
3121	Lech Poznań	42004	Ekstraklasa 22/23	22/23	33	60.3	14387	17072	436.0	517.3	84.3	1163	35.24	130	3.94	2061	62.45	0	0.00	267	8.09	665	20.15	226	6.85
3106	Legia Warszawa	42004	Ekstraklasa 22/23	22/23	33	58.7	13510	16255	409.4	492.6	83.1	899	27.24	178	5.39	1808	54.79	0	0.00	266	8.06	630	19.09	229	6.94
3117	Pogoń Szczecin	42004	Ekstraklasa 22/23	22/23	33	58.1	13222	16190	400.7	490.6	81.7	867	26.27	138	4.18	1965	59.55	0	0.00	311	9.42	763	23.12	249	7.55
3122	Wisła Płock	42004	Ekstraklasa 22/23	22/23	32	55.0	11779	14706	368.1	459.6	80.1	853	26.66	126	3.94	1725	53.91	0	0.00	207	6.47	716	22.38	303	9.47
3110	Górnik Zabrze	42004	Ekstraklasa 22/23	22/23	33	54.6	12464	15554	377.7	471.3	80.1	1058	32.06	149	4.52	2004	60.73	0	0.00	252	7.64	702	21.27	267	8.09
35268	Raków Częstochowa	42004	Ekstraklasa 22/23	22/23	33	53.5	11627	14590	352.3	442.1	79.7	884	26.79	150	4.55	1979	59.97	0	0.00	306	9.27	659	19.97	187	5.67
7913	KS Lechia Gdańsk	42004	Ekstraklasa 22/23	22/23	33	52.5	11338	14097	343.6	427.2	80.4	850	25.76	156	4.73	1757	53.24	0	0.00	284	8.61	705	21.36	289	8.76
3115	Widzew Łódź	42004	Ekstraklasa 22/23	22/23	32	49.2	10340	13178	323.1	411.8	78.5	824	25.75	166	5.19	1615	50.47	0	0.00	256	8.00	660	20.63	309	9.66
38732	Stal Mielec	42004	Ekstraklasa 22/23	22/23	33	49.0	10368	13499	314.2	409.1	76.8	819	24.82	132	4.00	1757	53.24	0	0.00	245	7.42	703	21.30	302	9.15
3108	Śląsk Wrocław	42004	Ekstraklasa 22/23	22/23	33	47.6	10141	13059	307.3	395.7	77.7	997	30.21	114	3.45	1781	53.97	0	0.00	276	8.36	684	20.73	260	7.88
3113	Zagłębie Lubin	42004	Ekstraklasa 22/23	22/23	33	47.3	9905	12875	300.2	390.2	76.9	802	24.30	152	4.61	1842	55.82	0	0.00	226	6.85	725	21.97	294	8.91
7691	Jagiellonia Białystok	42004	Ekstraklasa 22/23	22/23	32	47.0	9211	12230	287.8	382.2	75.3	762	23.81	118	3.69	1588	49.63	0	0.00	260	8.13	654	20.44	304	9.50
7295	Radomiak Radom	42004	Ekstraklasa 22/23	22/23	33	46.5	8686	11625	263.2	352.3	74.7	963	29.18	169	5.12	1924	58.30	0	0.00	230	6.97	704	21.33	271	8.21
7918	Piast Gliwice	42004	Ekstraklasa 22/23	22/23	33	45.5	9559	12610	289.7	382.1	75.8	846	25.64	149	4.52	1905	57.73	0	0.00	224	6.79	684	20.73	246	7.45
7922	Warta Poznań	42004	Ekstraklasa 22/23	22/23	32	45.5	9393	12508	293.5	390.9	75.1	767	23.97	128	4.00	1860	58.13	0	0.00	230	7.19	596	18.63	237	7.41
4901	Cracovia	42004	Ekstraklasa 22/23	22/23	32	44.9	8515	11408	266.1	356.5	74.6	870	27.19	166	5.19	1786	55.81	0	0.00	220	6.88	675	21.09	283	8.84
35330	Miedź Legnica	42004	Ekstraklasa 22/23	22/23	33	43.3	8993	12073	272.5	365.8	74.5	846	25.64	130	3.94	1813	54.94	0	0.00	236	7.15	713	21.61	280	8.48
5065	MKS Korona Kielce	42004	Ekstraklasa 22/23	22/23	32	40.9	6929	9742	216.5	304.4	71.1	806	25.19	169	5.28	1654	51.69	0	0.00	246	7.69	731	22.84	264	8.25
3121	Lech Poznań	37062	Ekstraklasa 21/22	21/22	32	56.1	12454	15401	389.2	481.3	80.9	1159	36.22	135	4.22	2122	66.31	0	0.00	243	7.59	657	20.53	201	6.28
3106	Legia Warszawa	37062	Ekstraklasa 21/22	21/22	33	55.9	12522	15606	379.5	472.9	80.2	882	26.73	198	6.00	2032	61.58	0	0.00	276	8.36	687	20.82	215	6.52
3117	Pogoń Szczecin	37062	Ekstraklasa 21/22	21/22	33	55.0	11652	14658	353.1	444.2	79.5	847	25.67	180	5.45	1956	59.27	0	0.00	273	8.27	706	21.39	231	7.00
7913	KS Lechia Gdańsk	37062	Ekstraklasa 21/22	21/22	33	54.2	11242	14301	340.7	433.4	78.6	886	26.85	167	5.06	1825	55.30	0	0.00	258	7.82	735	22.27	262	7.94
3111	Wisła Kraków	37062	Ekstraklasa 21/22	21/22	33	53.4	11260	14493	341.2	439.2	77.7	951	28.82	127	3.85	1983	60.09	0	0.00	268	8.12	846	25.64	274	8.30
3110	Górnik Zabrze	37062	Ekstraklasa 21/22	21/22	32	51.8	10945	14285	342.0	446.4	76.6	1072	33.50	115	3.59	1837	57.41	0	0.00	231	7.22	713	22.28	251	7.84
36851	Bruk-Bet Termalica Nieciecza	37062	Ekstraklasa 21/22	21/22	33	51.8	10169	13225	308.2	400.8	76.9	923	27.97	164	4.97	1848	56.00	0	0.00	230	6.97	685	20.76	290	8.79
3122	Wisła Płock	37062	Ekstraklasa 21/22	21/22	33	50.5	10120	13356	306.7	404.7	75.8	861	26.09	138	4.18	1664	50.42	0	0.00	277	8.39	701	21.24	324	9.82
4901	Cracovia	37062	Ekstraklasa 21/22	21/22	33	49.1	9196	12436	278.7	376.8	73.9	913	27.67	162	4.91	1815	55.00	0	0.00	228	6.91	766	23.21	313	9.48
35268	Raków Częstochowa	37062	Ekstraklasa 21/22	21/22	33	48.9	9905	12854	300.2	389.5	77.1	749	22.70	172	5.21	1902	57.64	0	0.00	336	10.18	658	19.94	245	7.42
3113	Zagłębie Lubin	37062	Ekstraklasa 21/22	21/22	32	48.8	9663	12756	302.0	398.6	75.8	697	21.78	155	4.84	1781	55.66	0	0.00	279	8.72	759	23.72	259	8.09
7295	Radomiak Radom	37062	Ekstraklasa 21/22	21/22	33	48.5	9115	12173	276.2	368.9	74.9	962	29.15	142	4.30	1835	55.61	0	0.00	301	9.12	749	22.70	278	8.42
7691	Jagiellonia Białystok	37062	Ekstraklasa 21/22	21/22	33	48.3	10283	13404	311.6	406.2	76.7	795	24.09	149	4.52	1797	54.45	0	0.00	256	7.76	670	20.30	269	8.15
3108	Śląsk Wrocław	37062	Ekstraklasa 21/22	21/22	33	48.3	10392	13578	314.9	411.5	76.5	855	25.91	139	4.21	1856	56.24	0	0.00	286	8.67	682	20.67	263	7.97
7918	Piast Gliwice	37062	Ekstraklasa 21/22	21/22	32	47.1	9764	12795	305.1	399.8	76.3	857	26.78	167	5.22	1781	55.66	0	0.00	250	7.81	676	21.13	262	8.19
38732	Stal Mielec	37062	Ekstraklasa 21/22	21/22	32	45.3	8863	11888	277.0	371.5	74.6	805	25.16	106	3.31	1576	49.25	0	0.00	246	7.69	611	19.09	325	10.16
3125	Górnik Łęczna	37062	Ekstraklasa 21/22	21/22	32	44.3	8658	11611	270.6	362.8	74.6	800	25.00	140	4.38	1546	48.31	0	0.00	256	8.00	600	18.75	310	9.69
7922	Warta Poznań	37062	Ekstraklasa 21/22	21/22	33	42.5	8430	11638	255.5	352.7	72.4	786	23.82	112	3.39	1743	52.82	0	0.00	247	7.48	744	22.55	264	8.00
3106	Legia Warszawa	29222	Ekstraklasa 20/21	20/21	30	57.8	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	636	21.20	206	6.87
3121	Lech Poznań	29222	Ekstraklasa 20/21	20/21	30	56.6	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	596	19.87	221	7.37
3117	Pogoń Szczecin	29222	Ekstraklasa 20/21	20/21	30	55.0	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	563	18.77	209	6.97
3110	Górnik Zabrze	29222	Ekstraklasa 20/21	20/21	30	51.9	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	709	23.63	205	6.83
7918	Piast Gliwice	29222	Ekstraklasa 20/21	20/21	30	51.0	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	678	22.60	228	7.60
7913	KS Lechia Gdańsk	29222	Ekstraklasa 20/21	20/21	30	50.3	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	669	22.30	259	8.63
3111	Wisła Kraków	29222	Ekstraklasa 20/21	20/21	30	49.7	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	699	23.30	262	8.73
3122	Wisła Płock	29222	Ekstraklasa 20/21	20/21	30	49.5	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	772	25.73	209	6.97
35268	Raków Częstochowa	29222	Ekstraklasa 20/21	20/21	30	49.3	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	651	21.70	236	7.87
3113	Zagłębie Lubin	29222	Ekstraklasa 20/21	20/21	30	48.4	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	671	22.37	270	9.00
3108	Śląsk Wrocław	29222	Ekstraklasa 20/21	20/21	30	48.0	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	613	20.43	249	8.30
4901	Cracovia	29222	Ekstraklasa 20/21	20/21	30	47.8	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	651	21.70	269	8.97
7919	Podbeskidzie Bielsko-Biała	29222	Ekstraklasa 20/21	20/21	30	47.6	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	618	20.60	271	9.03
7691	Jagiellonia Białystok	29222	Ekstraklasa 20/21	20/21	30	47.6	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	590	19.67	295	9.83
38732	Stal Mielec	29222	Ekstraklasa 20/21	20/21	30	45.5	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	600	20.00	287	9.57
7922	Warta Poznań	29222	Ekstraklasa 20/21	20/21	30	44.2	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	670	22.33	273	9.10
3121	Lech Poznań	23666	Ekstraklasa 19/20	19/20	37	55.9	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	822	22.22	314	8.49
3106	Legia Warszawa	23666	Ekstraklasa 19/20	19/20	37	54.1	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	854	23.08	250	6.76
3117	Pogoń Szczecin	23666	Ekstraklasa 19/20	19/20	37	53.1	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	789	21.32	313	8.46
3123	ŁKS Łódź	23666	Ekstraklasa 19/20	19/20	37	51.7	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	801	21.65	351	9.49
3111	Wisła Kraków	23666	Ekstraklasa 19/20	19/20	37	51.1	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	805	21.76	367	9.92
3113	Zagłębie Lubin	23666	Ekstraklasa 19/20	19/20	37	50.9	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	857	23.16	318	8.59
7691	Jagiellonia Białystok	23666	Ekstraklasa 19/20	19/20	37	50.3	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	792	21.41	299	8.08
4901	Cracovia	23666	Ekstraklasa 19/20	19/20	37	49.5	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	759	20.51	310	8.38
3108	Śląsk Wrocław	23666	Ekstraklasa 19/20	19/20	37	49.3	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	859	23.22	302	8.16
5065	MKS Korona Kielce	23666	Ekstraklasa 19/20	19/20	37	49.0	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	757	20.46	302	8.16
3122	Wisła Płock	23666	Ekstraklasa 19/20	19/20	37	48.8	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	854	23.08	319	8.62
7918	Piast Gliwice	23666	Ekstraklasa 19/20	19/20	37	48.7	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	800	21.62	330	8.92
7913	KS Lechia Gdańsk	23666	Ekstraklasa 19/20	19/20	37	48.7	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	736	19.89	377	10.19
35268	Raków Częstochowa	23666	Ekstraklasa 19/20	19/20	37	47.4	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	763	20.62	311	8.41
3110	Górnik Zabrze	23666	Ekstraklasa 19/20	19/20	37	45.8	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	779	21.05	365	9.86
5064	MZKS Arka Gdynia	23666	Ekstraklasa 19/20	19/20	37	45.7	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	772	20.86	382	10.32
3111	Wisła Kraków	17361	Ekstraklasa 18/19	18/19	37	53.6	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	774	20.92	397	10.73
3106	Legia Warszawa	17361	Ekstraklasa 18/19	18/19	37	53.3	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	860	23.24	296	8.00
3121	Lech Poznań	17361	Ekstraklasa 18/19	18/19	37	52.7	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	817	22.08	349	9.43
3117	Pogoń Szczecin	17361	Ekstraklasa 18/19	18/19	37	52.6	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	860	23.24	271	7.32
5065	MKS Korona Kielce	17361	Ekstraklasa 18/19	18/19	37	51.1	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	838	22.65	251	6.78
4901	Cracovia	17361	Ekstraklasa 18/19	18/19	37	50.7	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	774	20.92	304	8.22
7918	Piast Gliwice	17361	Ekstraklasa 18/19	18/19	37	50.0	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	809	21.86	338	9.14
3122	Wisła Płock	17361	Ekstraklasa 18/19	18/19	37	49.7	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	909	24.57	313	8.46
3108	Śląsk Wrocław	17361	Ekstraklasa 18/19	18/19	37	49.3	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	914	24.70	312	8.43
3113	Zagłębie Lubin	17361	Ekstraklasa 18/19	18/19	37	48.7	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	852	23.03	332	8.97
35330	Miedź Legnica	17361	Ekstraklasa 18/19	18/19	37	48.4	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	726	19.62	334	9.03
7691	Jagiellonia Białystok	17361	Ekstraklasa 18/19	18/19	37	48.3	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	873	23.59	318	8.59
7913	KS Lechia Gdańsk	17361	Ekstraklasa 18/19	18/19	37	47.9	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	855	23.11	335	9.05
5064	MZKS Arka Gdynia	17361	Ekstraklasa 18/19	18/19	37	47.6	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	806	21.78	388	10.49
3110	Górnik Zabrze	17361	Ekstraklasa 18/19	18/19	37	47.5	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	846	22.86	331	8.95
7693	Zagłębie Sosnowiec	17361	Ekstraklasa 18/19	18/19	37	47.3	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	794	21.46	345	9.32
3106	Legia Warszawa	13350	Ekstraklasa 17/18	17/18	37	54.9	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	865	23.38	308	8.32
3121	Lech Poznań	13350	Ekstraklasa 17/18	17/18	37	53.8	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	958	25.89	268	7.24
3117	Pogoń Szczecin	13350	Ekstraklasa 17/18	17/18	37	52.7	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	924	24.97	263	7.11
7913	KS Lechia Gdańsk	13350	Ekstraklasa 17/18	17/18	37	52.1	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	991	26.78	315	8.51
3113	Zagłębie Lubin	13350	Ekstraklasa 17/18	17/18	37	51.6	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	934	25.24	330	8.92
3111	Wisła Kraków	13350	Ekstraklasa 17/18	17/18	37	51.5	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	902	24.38	346	9.35
7691	Jagiellonia Białystok	13350	Ekstraklasa 17/18	17/18	37	51.2	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	873	23.59	306	8.27
5065	MKS Korona Kielce	13350	Ekstraklasa 17/18	17/18	37	51.0	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	940	25.41	301	8.14
3122	Wisła Płock	13350	Ekstraklasa 17/18	17/18	37	50.3	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	989	26.73	294	7.95
3108	Śląsk Wrocław	13350	Ekstraklasa 17/18	17/18	37	49.6	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	813	21.97	364	9.84
36851	Bruk-Bet Termalica Nieciecza	13350	Ekstraklasa 17/18	17/18	37	49.1	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	942	25.46	358	9.68
7918	Piast Gliwice	13350	Ekstraklasa 17/18	17/18	36	48.2	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	861	23.92	374	10.39
5064	MZKS Arka Gdynia	13350	Ekstraklasa 17/18	17/18	37	47.3	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	965	26.08	379	10.24
36766	Sandecja Nowy Sącz	13350	Ekstraklasa 17/18	17/18	37	46.3	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	940	25.41	413	11.16
4901	Cracovia	13350	Ekstraklasa 17/18	17/18	37	46.0	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	907	24.51	393	10.62
3110	Górnik Zabrze	13350	Ekstraklasa 17/18	17/18	36	44.3	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	863	23.97	335	9.31
3106	Legia Warszawa	11734	Ekstraklasa 16/17	16/17	37	57.3	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	884	23.89	307	8.30
7913	KS Lechia Gdańsk	11734	Ekstraklasa 16/17	16/17	37	55.2	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	864	23.35	314	8.49
4901	Cracovia	11734	Ekstraklasa 16/17	16/17	37	53.6	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	929	25.11	345	9.32
3117	Pogoń Szczecin	11734	Ekstraklasa 16/17	16/17	37	53.3	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	858	23.19	316	8.54
3121	Lech Poznań	11734	Ekstraklasa 16/17	16/17	37	51.2	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	847	22.89	311	8.41
3111	Wisła Kraków	11734	Ekstraklasa 16/17	16/17	37	51.1	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	908	24.54	330	8.92
7918	Piast Gliwice	11734	Ekstraklasa 16/17	16/17	37	50.7	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	926	25.03	398	10.76
3108	Śląsk Wrocław	11734	Ekstraklasa 16/17	16/17	37	50.4	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	884	23.89	349	9.43
3113	Zagłębie Lubin	11734	Ekstraklasa 16/17	16/17	37	50.2	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	888	24.00	358	9.68
7691	Jagiellonia Białystok	11734	Ekstraklasa 16/17	16/17	37	47.9	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	910	24.59	317	8.57
3105	Ruch Chorzów	11734	Ekstraklasa 16/17	16/17	37	47.8	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	914	24.70	380	10.27
5065	MKS Korona Kielce	11734	Ekstraklasa 16/17	16/17	37	47.7	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	908	24.54	338	9.14
5064	MZKS Arka Gdynia	11734	Ekstraklasa 16/17	16/17	37	46.4	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	1055	28.51	335	9.05
3125	Górnik Łęczna	11734	Ekstraklasa 16/17	16/17	37	46.4	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	861	23.27	391	10.57
3122	Wisła Płock	11734	Ekstraklasa 16/17	16/17	37	46.2	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	915	24.73	374	10.11
36851	Bruk-Bet Termalica Nieciecza	11734	Ekstraklasa 16/17	16/17	37	44.9	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	963	26.03	384	10.38
3106	Legia Warszawa	10361	Ekstraklasa 15/16	15/16	36	54.6	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	996	27.67	296	8.22
3111	Wisła Kraków	10361	Ekstraklasa 15/16	15/16	35	54.5	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	776	22.17	319	9.11
7913	KS Lechia Gdańsk	10361	Ekstraklasa 15/16	15/16	35	54.4	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	879	25.11	269	7.69
4901	Cracovia	10361	Ekstraklasa 15/16	15/16	35	53.0	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	915	26.14	355	10.14
3121	Lech Poznań	10361	Ekstraklasa 15/16	15/16	35	52.9	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	919	26.26	285	8.14
7918	Piast Gliwice	10361	Ekstraklasa 15/16	15/16	35	52.3	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	771	22.03	363	10.37
3108	Śląsk Wrocław	10361	Ekstraklasa 15/16	15/16	36	49.4	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	972	27.00	300	8.33
36851	Bruk-Bet Termalica Nieciecza	10361	Ekstraklasa 15/16	15/16	35	49.4	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	845	24.14	315	9.00
3110	Górnik Zabrze	10361	Ekstraklasa 15/16	15/16	36	49.1	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	949	26.36	357	9.92
3105	Ruch Chorzów	10361	Ekstraklasa 15/16	15/16	35	48.8	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	844	24.11	339	9.69
3113	Zagłębie Lubin	10361	Ekstraklasa 15/16	15/16	35	48.6	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	896	25.60	340	9.71
7919	Podbeskidzie Bielsko-Biała	10361	Ekstraklasa 15/16	15/16	36	48.2	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	886	24.61	383	10.64
3117	Pogoń Szczecin	10361	Ekstraklasa 15/16	15/16	36	47.6	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	897	24.92	323	8.97
5065	MKS Korona Kielce	10361	Ekstraklasa 15/16	15/16	35	46.2	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	883	25.23	328	9.37
3125	Górnik Łęczna	10361	Ekstraklasa 15/16	15/16	36	46.1	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	782	21.72	349	9.69
7691	Jagiellonia Białystok	10361	Ekstraklasa 15/16	15/16	35	45.0	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	857	24.49	297	8.49
3106	Legia Warszawa	8206	Ekstraklasa 14/15	14/15	37	56.6	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	880	23.78	357	9.65
3121	Lech Poznań	8206	Ekstraklasa 14/15	14/15	37	53.7	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	922	24.92	278	7.51
7913	KS Lechia Gdańsk	8206	Ekstraklasa 14/15	14/15	37	53.7	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	1016	27.46	280	7.57
3111	Wisła Kraków	8206	Ekstraklasa 14/15	14/15	37	52.5	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	899	24.30	334	9.03
3108	Śląsk Wrocław	8206	Ekstraklasa 14/15	14/15	37	51.2	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	1010	27.30	343	9.27
35329	Zawisza Bydgoszcz	8206	Ekstraklasa 14/15	14/15	37	50.8	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	912	24.65	316	8.54
3110	Górnik Zabrze	8206	Ekstraklasa 14/15	14/15	37	49.8	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	909	24.57	372	10.05
4901	Cracovia	8206	Ekstraklasa 14/15	14/15	37	49.7	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	955	25.81	373	10.08
3117	Pogoń Szczecin	8206	Ekstraklasa 14/15	14/15	37	49.4	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	981	26.51	347	9.38
5065	MKS Korona Kielce	8206	Ekstraklasa 14/15	14/15	37	48.5	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	1011	27.32	337	9.11
3128	GKS Bełchatów	8206	Ekstraklasa 14/15	14/15	37	48.4	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	940	25.41	342	9.24
3105	Ruch Chorzów	8206	Ekstraklasa 14/15	14/15	37	48.2	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	913	24.68	374	10.11
3125	Górnik Łęczna	8206	Ekstraklasa 14/15	14/15	37	47.9	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	898	24.27	411	11.11
7918	Piast Gliwice	8206	Ekstraklasa 14/15	14/15	37	46.7	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	850	22.97	429	11.59
7919	Podbeskidzie Bielsko-Biała	8206	Ekstraklasa 14/15	14/15	37	46.5	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	993	26.84	332	8.97
7691	Jagiellonia Białystok	8206	Ekstraklasa 14/15	14/15	37	46.0	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	909	24.57	396	10.70
4901	Cracovia	6261	Ekstraklasa 13/14	13/14	37	60.5	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	529	14.30	187	5.05
3106	Legia Warszawa	6261	Ekstraklasa 13/14	13/14	36	58.1	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	695	19.31	225	6.25
3121	Lech Poznań	6261	Ekstraklasa 13/14	13/14	37	55.0	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	669	18.08	184	4.97
3108	Śląsk Wrocław	6261	Ekstraklasa 13/14	13/14	37	54.1	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	604	16.32	209	5.65
3105	Ruch Chorzów	6261	Ekstraklasa 13/14	13/14	37	51.5	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	661	17.86	256	6.92
3110	Górnik Zabrze	6261	Ekstraklasa 13/14	13/14	37	50.1	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	739	19.97	254	6.86
7691	Jagiellonia Białystok	6261	Ekstraklasa 13/14	13/14	36	49.9	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	561	15.58	236	6.56
3117	Pogoń Szczecin	6261	Ekstraklasa 13/14	13/14	37	49.3	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	643	17.38	255	6.89
3111	Wisła Kraków	6261	Ekstraklasa 13/14	13/14	37	49.2	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	591	15.97	289	7.81
35329	Zawisza Bydgoszcz	6261	Ekstraklasa 13/14	13/14	37	48.6	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	658	17.78	222	6.00
5065	MKS Korona Kielce	6261	Ekstraklasa 13/14	13/14	37	48.0	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	606	16.38	285	7.70
7913	KS Lechia Gdańsk	6261	Ekstraklasa 13/14	13/14	37	47.5	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	659	17.81	253	6.84
3113	Zagłębie Lubin	6261	Ekstraklasa 13/14	13/14	37	46.0	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	626	16.92	273	7.38
7919	Podbeskidzie Bielsko-Biała	6261	Ekstraklasa 13/14	13/14	37	44.3	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	615	16.62	245	6.62
3115	Widzew Łódź	6261	Ekstraklasa 13/14	13/14	37	43.6	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	507	13.70	230	6.22
7918	Piast Gliwice	6261	Ekstraklasa 13/14	13/14	37	43.0	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	629	17.00	248	6.70
7919	Podbeskidzie Bielsko-Biała	4634	Ekstraklasa 12/13	12/13	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3105	Ruch Chorzów	4634	Ekstraklasa 12/13	12/13	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3106	Legia Warszawa	4634	Ekstraklasa 12/13	12/13	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3108	Śląsk Wrocław	4634	Ekstraklasa 12/13	12/13	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3110	Górnik Zabrze	4634	Ekstraklasa 12/13	12/13	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3111	Wisła Kraków	4634	Ekstraklasa 12/13	12/13	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3113	Zagłębie Lubin	4634	Ekstraklasa 12/13	12/13	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3115	Widzew Łódź	4634	Ekstraklasa 12/13	12/13	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3117	Pogoń Szczecin	4634	Ekstraklasa 12/13	12/13	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3119	Polonia Warszawa	4634	Ekstraklasa 12/13	12/13	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3121	Lech Poznań	4634	Ekstraklasa 12/13	12/13	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3128	GKS Bełchatów	4634	Ekstraklasa 12/13	12/13	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
5065	MKS Korona Kielce	4634	Ekstraklasa 12/13	12/13	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
7691	Jagiellonia Białystok	4634	Ekstraklasa 12/13	12/13	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
7913	KS Lechia Gdańsk	4634	Ekstraklasa 12/13	12/13	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
7918	Piast Gliwice	4634	Ekstraklasa 12/13	12/13	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3105	Ruch Chorzów	3411	Ekstraklasa 11/12	11/12	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3106	Legia Warszawa	3411	Ekstraklasa 11/12	11/12	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3108	Śląsk Wrocław	3411	Ekstraklasa 11/12	11/12	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3110	Górnik Zabrze	3411	Ekstraklasa 11/12	11/12	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3111	Wisła Kraków	3411	Ekstraklasa 11/12	11/12	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3113	Zagłębie Lubin	3411	Ekstraklasa 11/12	11/12	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3115	Widzew Łódź	3411	Ekstraklasa 11/12	11/12	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3119	Polonia Warszawa	3411	Ekstraklasa 11/12	11/12	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3121	Lech Poznań	3411	Ekstraklasa 11/12	11/12	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3123	ŁKS Łódź	3411	Ekstraklasa 11/12	11/12	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3128	GKS Bełchatów	3411	Ekstraklasa 11/12	11/12	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
4901	Cracovia	3411	Ekstraklasa 11/12	11/12	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
5065	MKS Korona Kielce	3411	Ekstraklasa 11/12	11/12	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
7691	Jagiellonia Białystok	3411	Ekstraklasa 11/12	11/12	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
7913	KS Lechia Gdańsk	3411	Ekstraklasa 11/12	11/12	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
7919	Podbeskidzie Bielsko-Biała	3411	Ekstraklasa 11/12	11/12	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3105	Ruch Chorzów	2737	Ekstraklasa 10/11	10/11	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3106	Legia Warszawa	2737	Ekstraklasa 10/11	10/11	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3108	Śląsk Wrocław	2737	Ekstraklasa 10/11	10/11	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3110	Górnik Zabrze	2737	Ekstraklasa 10/11	10/11	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3111	Wisła Kraków	2737	Ekstraklasa 10/11	10/11	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3113	Zagłębie Lubin	2737	Ekstraklasa 10/11	10/11	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3115	Widzew Łódź	2737	Ekstraklasa 10/11	10/11	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3119	Polonia Warszawa	2737	Ekstraklasa 10/11	10/11	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3121	Lech Poznań	2737	Ekstraklasa 10/11	10/11	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3128	GKS Bełchatów	2737	Ekstraklasa 10/11	10/11	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
4901	Cracovia	2737	Ekstraklasa 10/11	10/11	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
5064	MZKS Arka Gdynia	2737	Ekstraklasa 10/11	10/11	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
5065	MKS Korona Kielce	2737	Ekstraklasa 10/11	10/11	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
7691	Jagiellonia Białystok	2737	Ekstraklasa 10/11	10/11	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
7692	Polonia Bytom	2737	Ekstraklasa 10/11	10/11	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
7913	KS Lechia Gdańsk	2737	Ekstraklasa 10/11	10/11	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3105	Ruch Chorzów	2275	Ekstraklasa 09/10	09/10	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3106	Legia Warszawa	2275	Ekstraklasa 09/10	09/10	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3108	Śląsk Wrocław	2275	Ekstraklasa 09/10	09/10	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3111	Wisła Kraków	2275	Ekstraklasa 09/10	09/10	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3113	Zagłębie Lubin	2275	Ekstraklasa 09/10	09/10	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3114	MKS Odra Wodzisław Śląski	2275	Ekstraklasa 09/10	09/10	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3119	Polonia Warszawa	2275	Ekstraklasa 09/10	09/10	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3121	Lech Poznań	2275	Ekstraklasa 09/10	09/10	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3128	GKS Bełchatów	2275	Ekstraklasa 09/10	09/10	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
4901	Cracovia	2275	Ekstraklasa 09/10	09/10	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
5064	MZKS Arka Gdynia	2275	Ekstraklasa 09/10	09/10	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
5065	MKS Korona Kielce	2275	Ekstraklasa 09/10	09/10	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
7691	Jagiellonia Białystok	2275	Ekstraklasa 09/10	09/10	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
7692	Polonia Bytom	2275	Ekstraklasa 09/10	09/10	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
7913	KS Lechia Gdańsk	2275	Ekstraklasa 09/10	09/10	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
7918	Piast Gliwice	2275	Ekstraklasa 09/10	09/10	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3105	Ruch Chorzów	1691	Ekstraklasa 08/09	08/09	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3106	Legia Warszawa	1691	Ekstraklasa 08/09	08/09	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3108	Śląsk Wrocław	1691	Ekstraklasa 08/09	08/09	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3110	Górnik Zabrze	1691	Ekstraklasa 08/09	08/09	31	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3111	Wisła Kraków	1691	Ekstraklasa 08/09	08/09	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3114	MKS Odra Wodzisław Śląski	1691	Ekstraklasa 08/09	08/09	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3119	Polonia Warszawa	1691	Ekstraklasa 08/09	08/09	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3121	Lech Poznań	1691	Ekstraklasa 08/09	08/09	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3123	ŁKS Łódź	1691	Ekstraklasa 08/09	08/09	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
3128	GKS Bełchatów	1691	Ekstraklasa 08/09	08/09	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
4901	Cracovia	1691	Ekstraklasa 08/09	08/09	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
5064	MZKS Arka Gdynia	1691	Ekstraklasa 08/09	08/09	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
7691	Jagiellonia Białystok	1691	Ekstraklasa 08/09	08/09	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
7692	Polonia Bytom	1691	Ekstraklasa 08/09	08/09	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
7913	KS Lechia Gdańsk	1691	Ekstraklasa 08/09	08/09	30	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
7918	Piast Gliwice	1691	Ekstraklasa 08/09	08/09	31	\N	0	0	0.0	0.0	\N	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00
\.


--
-- Data for Name: mart_team_season_summary; Type: TABLE DATA; Schema: gold; Owner: airflow
--

COPY gold.mart_team_season_summary (season_id, season_name, season_year, team_id, team_name, matches_played, wins, draws, losses, total_points, points_per_game, goals_for, goals_against, goal_difference, goals_per_game, goals_conceded_per_game, clean_sheets, clean_sheet_percentage, home_wins, home_draws, home_losses, away_wins, away_draws, away_losses, total_xg, xg_per_game, xg_difference, xg_diff_per_game, total_big_chances_created, big_chances_created_per_game, total_big_chances_missed, big_chances_missed_per_game, total_shots, shots_per_game, total_shots_on_target, shots_on_target_per_game, total_shots_inside_box, shots_inside_box_per_game, total_shots_outside_box, shots_outside_box_per_game, total_corners, corners_per_game, avg_dribbles_success_pct, total_hit_woodwork, total_saves, saves_per_game, total_tackles, tackles_per_game, avg_tackles_won_pct, total_interceptions, interceptions_per_game, total_clearances, clearances_per_game, total_blocked_shots, blocked_shots_per_game, total_ball_recoveries, ball_recoveries_per_game, avg_aerial_duels_pct, avg_ground_duels_pct, avg_duels_won_pct, total_errors_lead_to_goal, total_errors_lead_to_shot, avg_possession_pct, total_accurate_passes, total_passes, pass_accuracy_pct, accurate_passes_per_game, total_passes_per_game, total_accurate_long_balls, accurate_long_balls_per_game, total_accurate_crosses, accurate_crosses_per_game, total_final_third_entries, final_third_entries_per_game, total_touches_in_box_possession, touches_in_box_per_game_possession, total_dispossessed, dispossessed_per_game, total_yellow_cards, yellow_cards_per_game, total_red_cards, total_fouls, fouls_per_game, total_offsides, offsides_per_game, total_free_kicks, free_kicks_per_game, last_5_results, points_last_5, wins_last_5, draws_last_5, losses_last_5, goals_for_last_5, goals_against_last_5, halftime_leading_count, halftime_leading_wins, halftime_leading_win_pct, conceded_first_count, points_after_conceding_first, points_pct_after_conceding_first, home_scored_1h_pct, home_scored_2h_pct, home_scored_both_halves_pct, home_avg_goals_1h, home_avg_goals_2h, home_clean_sheet_1h_pct, home_clean_sheet_2h_pct, home_avg_conceded_1h, home_avg_conceded_2h, away_scored_1h_pct, away_scored_2h_pct, away_scored_both_halves_pct, away_avg_goals_1h, away_avg_goals_2h, away_clean_sheet_1h_pct, away_clean_sheet_2h_pct, away_avg_conceded_1h, away_avg_conceded_2h) FROM stdin;
76477	Ekstraklasa 25/26	25/26	3122	Wisła Płock	18	7	9	2	30	1.67	21	12	9	1.17	0.67	6	33.3	6	3	1	1	6	1	20.65	1.15	0.35	0.02	29	1.61	16	0.89	204	11.33	66	3.67	121	6.72	83	4.61	70	3.89	5.3	5	51	2.83	221	12.28	8.0	116	6.44	527	29.28	52	2.89	753	41.83	14.2	29.3	51.9	2	12	43.1	4901	6134	79.9	272.3	340.8	439	24.39	78	4.33	793	44.06	322	17.89	92	5.11	29	1.61	0	186	10.33	21	1.17	192	10.67	DDDDD	9	0	5	0	3	3	7	5	71.4	12	26	72.2	60.0	40.0	30.0	0.80	0.50	90.0	70.0	0.10	0.30	50.0	50.0	12.5	0.50	0.50	37.5	62.5	0.63	0.38
76477	Ekstraklasa 25/26	25/26	3110	Górnik Zabrze	18	9	3	6	30	1.67	29	24	5	1.61	1.33	4	22.2	6	1	2	3	2	4	23.06	1.28	5.94	0.33	32	1.78	18	1.00	281	15.61	80	4.44	169	9.39	112	6.22	103	5.72	7.7	6	32	1.78	232	12.89	8.6	124	6.89	389	21.61	90	5.00	778	43.22	11.4	31.5	50.5	6	8	49.6	5875	6970	84.3	326.4	387.2	450	25.00	76	4.22	812	45.11	455	25.28	124	6.89	29	1.61	0	175	9.72	17	0.94	181	10.06	LLDLW	3	1	1	3	8	13	6	6	100.0	14	23	54.8	66.7	77.8	66.7	0.89	1.22	66.7	33.3	0.33	0.67	22.2	55.6	0.0	0.33	0.78	55.6	44.4	0.78	0.89
76477	Ekstraklasa 25/26	25/26	35268	Raków Częstochowa	18	9	2	7	29	1.61	26	23	3	1.44	1.28	4	22.2	3	2	4	6	0	3	24.64	1.37	1.36	0.08	44	2.44	27	1.50	230	12.78	76	4.22	158	8.78	72	4.00	72	4.00	8.2	4	35	1.94	221	12.28	7.9	125	6.94	420	23.33	67	3.72	781	43.39	17.1	36.0	51.8	0	5	54.3	6156	7461	82.5	342.0	414.5	404	22.44	102	5.67	858	47.67	444	24.67	137	7.61	42	2.33	3	206	11.44	24	1.33	264	14.67	LWWLW	7	3	0	2	10	6	4	4	100.0	14	11	26.2	44.4	55.6	22.2	0.44	0.67	33.3	66.7	0.78	0.44	44.4	77.8	44.4	0.78	1.00	66.7	33.3	0.33	1.00
76477	Ekstraklasa 25/26	25/26	7691	Jagiellonia Białystok	17	8	5	4	29	1.71	29	21	8	1.71	1.24	5	29.4	5	0	2	3	5	2	24.93	1.47	4.07	0.24	32	1.88	15	0.88	255	15.00	92	5.41	164	9.65	91	5.35	86	5.06	6.9	7	61	3.59	236	13.88	8.6	123	7.24	398	23.41	71	4.18	796	46.82	12.9	34.2	49.7	1	11	59.2	7069	8364	84.5	415.8	492.0	299	17.59	88	5.18	915	53.82	447	26.29	158	9.29	38	2.24	0	194	11.41	38	2.24	239	14.06	DLDWL	8	1	2	2	5	6	4	3	75.0	12	22	61.1	71.4	71.4	57.1	0.86	1.71	42.9	42.9	1.00	0.57	60.0	50.0	30.0	0.60	0.50	50.0	60.0	0.50	0.50
76477	Ekstraklasa 25/26	25/26	3113	Zagłębie Lubin	18	7	7	4	28	1.56	31	24	7	1.72	1.33	5	27.8	5	4	0	2	3	4	26.98	1.50	4.02	0.22	41	2.28	23	1.28	227	12.61	81	4.50	153	8.50	74	4.11	70	3.89	4.8	4	53	2.94	281	15.61	8.8	181	10.06	643	35.72	55	3.06	805	44.72	21.3	31.9	51.8	2	7	40.8	3982	5422	73.4	221.2	301.2	423	23.50	85	4.72	805	44.72	371	20.61	111	6.17	36	2.00	1	237	13.17	30	1.67	221	12.28	WWDLW	7	3	1	1	6	6	7	4	57.1	13	16	41.0	66.7	77.8	55.6	1.22	1.22	66.7	44.4	0.33	0.67	33.3	55.6	11.1	0.44	0.56	55.6	44.4	0.78	0.89
76477	Ekstraklasa 25/26	25/26	4901	Cracovia	18	7	6	5	27	1.50	25	21	4	1.39	1.17	8	44.4	4	4	1	3	2	4	22.09	1.23	2.91	0.16	38	2.11	20	1.11	196	10.89	61	3.39	127	7.06	69	3.83	67	3.72	6.1	5	46	2.56	247	13.72	9.1	172	9.56	522	29.00	55	3.06	719	39.94	17.5	32.6	49.7	0	3	49.5	5553	6953	79.9	308.5	386.3	341	18.94	76	4.22	905	50.28	324	18.00	108	6.00	39	2.17	1	246	13.67	20	1.11	215	11.94	DDWLL	5	1	2	2	4	7	7	5	71.4	10	5	16.7	55.6	88.9	55.6	0.56	0.89	77.8	44.4	0.22	0.67	44.4	44.4	22.2	0.78	0.56	66.7	55.6	0.33	1.11
76477	Ekstraklasa 25/26	25/26	7295	Radomiak Radom	18	7	5	6	26	1.44	35	30	5	1.94	1.67	3	16.7	6	2	1	1	3	5	23.01	1.28	11.99	0.67	41	2.28	21	1.17	243	13.50	87	4.83	146	8.11	97	5.39	70	3.89	6.5	2	41	2.28	237	13.17	8.3	110	6.11	556	30.89	66	3.67	646	35.89	17.5	33.3	50.3	4	4	49.3	4996	6163	81.1	277.6	342.4	353	19.61	73	4.06	752	41.78	354	19.67	120	6.67	43	2.39	0	259	14.39	26	1.44	226	12.56	DWLWW	10	3	1	1	12	7	5	4	80.0	15	20	44.4	66.7	66.7	33.3	0.89	1.56	66.7	55.6	0.33	0.44	44.4	77.8	33.3	0.56	0.89	22.2	22.2	1.22	1.33
76477	Ekstraklasa 25/26	25/26	3121	Lech Poznań	17	6	8	3	26	1.53	29	26	3	1.71	1.53	4	23.5	3	4	2	3	4	1	29.74	1.75	-0.74	-0.04	28	1.65	15	0.88	254	14.94	89	5.24	152	8.94	102	6.00	101	5.94	7.4	5	41	2.41	188	11.06	7.4	88	5.18	374	22.00	83	4.88	677	39.82	13.4	30.3	50.3	4	7	56.4	6401	7618	84.0	376.5	448.1	405	23.82	67	3.94	1008	59.29	426	25.06	116	6.82	33	1.94	3	180	10.59	23	1.35	188	11.06	DDWLD	9	1	3	1	9	8	6	4	66.7	13	18	46.2	55.6	66.7	22.2	0.67	1.22	44.4	11.1	0.78	1.00	62.5	37.5	25.0	0.75	0.75	75.0	50.0	0.38	0.88
76477	Ekstraklasa 25/26	25/26	7913	KS Lechia Gdańsk	18	7	4	7	25	1.39	37	37	0	2.06	2.06	2	11.1	5	2	2	2	2	5	21.51	1.20	15.49	0.86	49	2.72	24	1.33	215	11.94	83	4.61	142	7.89	73	4.06	76	4.22	4.9	8	47	2.61	291	16.17	10.2	148	8.22	479	26.61	57	3.17	780	43.33	15.1	31.2	48.8	4	2	48.7	4881	6203	78.7	271.2	344.6	294	16.33	84	4.67	899	49.94	393	21.83	81	4.50	39	2.17	1	199	11.06	13	0.72	163	9.06	WWDWL	13	3	1	1	15	8	7	4	57.1	16	19	39.6	66.7	88.9	55.6	1.22	1.33	55.6	44.4	0.67	0.89	66.7	66.7	55.6	0.67	0.89	22.2	11.1	1.11	1.44
76477	Ekstraklasa 25/26	25/26	5065	MKS Korona Kielce	18	6	6	6	24	1.33	21	19	2	1.17	1.06	6	33.3	4	2	3	2	4	3	27.01	1.50	-6.01	-0.33	36	2.00	26	1.44	259	14.39	67	3.72	180	10.00	79	4.39	96	5.33	7.9	9	59	3.28	224	12.44	7.9	147	8.17	470	26.11	84	4.67	799	44.39	15.1	32.6	48.2	1	4	46.4	4640	5948	78.0	257.8	330.4	374	20.78	84	4.67	884	49.11	466	25.89	124	6.89	33	1.83	2	205	11.39	32	1.78	212	11.78	DLWLD	6	1	2	2	5	7	5	4	80.0	12	11	30.6	55.6	44.4	22.2	0.67	0.67	66.7	55.6	0.44	0.56	11.1	55.6	11.1	0.22	0.78	66.7	33.3	0.33	0.78
76477	Ekstraklasa 25/26	25/26	5064	MZKS Arka Gdynia	18	6	3	9	21	1.17	15	32	-17	0.83	1.78	4	22.2	6	2	1	0	1	8	15.59	0.87	-0.59	-0.03	23	1.28	15	0.83	170	9.44	51	2.83	100	5.56	70	3.89	67	3.72	5.1	4	48	2.67	234	13.00	7.5	134	7.44	501	27.83	47	2.61	641	35.61	15.2	31.4	49.2	4	10	45.5	4614	5813	79.4	256.3	322.9	304	16.89	67	3.72	757	42.06	279	15.50	118	6.56	38	2.11	1	234	13.00	25	1.39	227	12.61	WLLWL	7	2	0	3	6	12	3	2	66.7	14	13	31.0	44.4	66.7	22.2	0.56	0.89	55.6	66.7	0.67	0.33	11.1	11.1	0.0	0.11	0.11	33.3	22.2	1.11	1.44
76477	Ekstraklasa 25/26	25/26	3117	Pogoń Szczecin	18	6	3	9	21	1.17	28	32	-4	1.56	1.78	1	5.6	5	1	3	1	2	6	34.82	1.93	-6.82	-0.38	62	3.44	44	2.44	295	16.39	93	5.17	195	10.83	100	5.56	99	5.50	5.6	14	77	4.28	208	11.56	7.6	139	7.72	508	28.22	87	4.83	767	42.61	13.8	26.7	47.2	3	8	51.9	5747	7152	80.4	319.3	397.3	382	21.22	94	5.22	948	52.67	515	28.61	102	5.67	39	2.17	0	215	11.94	33	1.83	192	10.67	DLWLL	4	1	1	3	8	9	5	2	40.0	17	22	43.1	66.7	66.7	44.4	1.22	1.11	44.4	44.4	0.56	1.11	33.3	44.4	22.2	0.33	0.44	11.1	55.6	1.00	0.89
76477	Ekstraklasa 25/26	25/26	7915	Motor Lublin	18	4	9	5	21	1.17	23	28	-5	1.28	1.56	4	22.2	2	6	1	2	3	4	25.84	1.44	-2.84	-0.16	33	1.83	18	1.00	218	12.11	58	3.22	159	8.83	59	3.28	99	5.50	6.5	4	56	3.11	283	15.72	10.6	130	7.22	438	24.33	71	3.94	795	44.17	12.8	35.1	49.9	4	10	51.9	5674	6834	83.0	315.2	379.7	286	15.89	82	4.56	729	40.50	434	24.11	147	8.17	40	2.22	2	227	12.61	36	2.00	216	12.00	DLDWD	1	1	3	1	5	5	3	1	33.3	14	11	26.2	66.7	33.3	11.1	0.78	0.56	55.6	55.6	0.56	0.67	33.3	44.4	11.1	0.56	0.67	44.4	22.2	0.89	1.00
76477	Ekstraklasa 25/26	25/26	3115	Widzew Łódź	18	6	2	10	20	1.11	26	28	-2	1.44	1.56	4	22.2	4	2	3	2	0	7	26.02	1.45	-0.02	0.00	38	2.11	22	1.22	230	12.78	82	4.56	136	7.56	94	5.22	71	3.94	8.4	7	44	2.44	255	14.17	9.6	125	6.94	509	28.28	64	3.56	760	42.22	12.5	35.8	50.5	5	10	47.9	4923	6141	80.2	273.5	341.2	388	21.56	47	2.61	782	43.44	373	20.72	124	6.89	40	2.22	1	180	10.00	27	1.50	219	12.17	LWLLD	2	1	1	3	6	8	6	5	83.3	14	7	16.7	66.7	55.6	33.3	0.78	0.67	55.6	44.4	0.56	0.56	55.6	66.7	44.4	0.56	0.89	44.4	11.1	0.67	1.33
76477	Ekstraklasa 25/26	25/26	3112	GKS Katowice	17	6	2	9	20	1.18	23	28	-5	1.35	1.65	3	17.6	4	1	4	2	1	5	25.59	1.51	-2.59	-0.15	33	1.94	17	1.00	207	12.18	77	4.53	128	7.53	79	4.65	87	5.12	5.8	8	45	2.65	236	13.88	8.2	116	6.82	544	32.00	56	3.29	729	42.88	18.5	30.8	52.2	1	7	47.4	4889	6199	78.9	287.6	364.6	385	22.65	69	4.06	804	47.29	368	21.65	101	5.94	26	1.53	0	211	12.41	29	1.71	207	12.18	LWLWW	8	3	0	2	7	4	3	3	100.0	14	14	33.3	33.3	55.6	22.2	0.67	0.78	33.3	66.7	1.11	0.33	25.0	50.0	25.0	0.38	0.88	25.0	37.5	0.88	1.00
76477	Ekstraklasa 25/26	25/26	7918	Piast Gliwice	17	5	5	7	20	1.18	19	19	0	1.12	1.12	5	29.4	2	3	3	3	2	4	15.44	0.91	3.56	0.21	13	0.76	7	0.41	231	13.59	52	3.06	140	8.24	91	5.35	83	4.88	5.3	4	47	2.76	184	10.82	6.9	124	7.29	443	26.06	80	4.71	723	42.53	15.5	28.5	48.4	2	10	57.4	6321	7544	83.8	371.8	443.8	368	21.65	78	4.59	909	53.47	392	23.06	114	6.71	39	2.29	3	202	11.88	26	1.53	209	12.29	WWLWW	7	4	0	1	9	4	2	2	100.0	12	11	30.6	12.5	50.0	12.5	0.13	0.88	62.5	50.0	0.50	0.50	55.6	44.4	33.3	0.67	0.56	55.6	33.3	0.56	0.67
76477	Ekstraklasa 25/26	25/26	36851	Bruk-Bet Termalica Nieciecza	18	5	4	9	19	1.06	24	35	-11	1.33	1.94	3	16.7	2	2	5	3	2	4	25.23	1.40	-1.23	-0.07	41	2.28	28	1.56	203	11.28	72	4.00	133	7.39	70	3.89	78	4.33	6.4	6	72	4.00	261	14.50	9.2	126	7.00	497	27.61	59	3.28	772	42.89	17.3	32.6	50.1	5	5	45.6	4912	6254	78.5	272.9	347.4	408	22.67	79	4.39	869	48.28	349	19.39	144	8.00	33	1.83	0	215	11.94	19	1.06	203	11.28	WLWWL	8	3	0	2	7	10	7	4	57.1	15	15	33.3	66.7	55.6	44.4	0.67	0.56	44.4	22.2	0.56	1.44	66.7	44.4	22.2	1.00	0.44	33.3	55.6	1.00	0.89
76477	Ekstraklasa 25/26	25/26	3106	Legia Warszawa	18	4	7	7	19	1.06	19	21	-2	1.06	1.17	5	27.8	3	4	2	1	3	5	25.47	1.42	-6.47	-0.36	35	1.94	27	1.50	278	15.44	77	4.28	171	9.50	107	5.94	99	5.50	7.9	5	37	2.06	255	14.17	9.5	145	8.06	406	22.56	93	5.17	796	44.22	17.8	34.5	49.6	0	6	56.2	6357	7773	81.8	353.2	431.8	408	22.67	104	5.78	1147	63.72	500	27.78	143	7.94	34	1.89	1	265	14.72	16	0.89	213	11.83	LLDDL	5	0	2	3	4	8	4	4	100.0	13	17	43.6	33.3	44.4	22.2	0.33	0.89	77.8	44.4	0.22	0.56	33.3	55.6	11.1	0.33	0.56	33.3	44.4	0.89	0.67
61236	Ekstraklasa 24/25	24/25	3121	Lech Poznań	33	21	4	8	67	2.03	66	31	35	2.00	0.94	13	39.4	14	0	2	7	4	6	55.47	1.68	10.53	0.32	80	2.42	43	1.30	512	15.52	178	5.39	342	10.36	170	5.15	167	5.06	6.8	10	108	3.27	448	13.58	8.1	244	7.39	643	19.48	179	5.42	1570	47.58	11.7	32.0	50.1	5	10	59.1	14014	16617	84.3	424.7	503.5	677	20.52	145	4.39	1812	54.91	932	28.24	249	7.55	52	1.58	2	397	12.03	61	1.85	403	12.21	WDWWD	13	3	2	0	14	5	16	15	93.8	20	34	56.7	81.3	75.0	62.5	1.50	1.25	62.5	68.8	0.44	0.31	64.7	29.4	17.6	0.82	0.47	52.9	64.7	0.65	0.47
61236	Ekstraklasa 24/25	24/25	35268	Raków Częstochowa	33	19	9	5	66	2.00	49	23	26	1.48	0.70	16	48.5	10	3	4	9	6	1	48.86	1.48	0.14	0.00	65	1.97	34	1.03	457	13.85	158	4.79	277	8.39	180	5.45	167	5.06	8.9	8	82	2.48	442	13.39	8.1	314	9.52	649	19.67	125	3.79	1490	45.15	17.4	33.6	50.2	2	4	52.3	11044	13607	81.2	334.7	412.3	760	23.03	174	5.27	1679	50.88	799	24.21	264	8.00	68	2.06	5	401	12.15	52	1.58	395	11.97	WDLWW	11	3	1	1	9	4	15	12	80.0	17	30	58.8	58.8	58.8	35.3	0.82	0.82	76.5	41.2	0.24	0.65	50.0	50.0	25.0	0.56	0.75	81.3	75.0	0.19	0.31
61236	Ekstraklasa 24/25	24/25	7691	Jagiellonia Białystok	33	16	10	7	58	1.76	54	42	12	1.64	1.27	10	30.3	8	6	2	8	4	5	55.50	1.68	-1.50	-0.05	81	2.45	49	1.48	460	13.94	148	4.48	306	9.27	154	4.67	169	5.12	7.9	14	102	3.09	491	14.88	9.2	289	8.76	772	23.39	124	3.76	1521	46.09	13.4	35.1	50.5	2	11	53.8	12334	14878	82.9	373.8	450.8	687	20.82	135	4.09	1844	55.88	964	29.21	249	7.55	61	1.85	2	395	11.97	56	1.70	438	13.27	DDWDL	4	1	3	1	6	7	15	12	80.0	23	26	37.7	87.5	50.0	37.5	1.19	0.75	50.0	50.0	0.56	0.63	64.7	47.1	23.5	0.82	0.53	58.8	52.9	0.53	0.82
61236	Ekstraklasa 24/25	24/25	3117	Pogoń Szczecin	33	16	7	10	55	1.67	56	40	16	1.70	1.21	13	39.4	12	2	2	4	5	8	60.84	1.84	-4.84	-0.15	83	2.52	50	1.52	497	15.06	176	5.33	331	10.03	166	5.03	201	6.09	5.7	11	101	3.06	436	13.21	8.0	272	8.24	828	25.09	149	4.52	1515	45.91	14.9	28.0	50.7	4	9	55.9	12254	14928	82.1	371.3	452.4	830	25.15	188	5.70	1836	55.64	897	27.18	212	6.42	65	1.97	5	375	11.36	41	1.24	326	9.88	DDWLW	7	2	2	1	12	10	12	10	83.3	20	22	36.7	62.5	75.0	50.0	0.88	1.19	68.8	68.8	0.50	0.38	35.3	58.8	29.4	0.53	0.82	58.8	29.4	0.59	0.94
61236	Ekstraklasa 24/25	24/25	3106	Legia Warszawa	33	14	9	10	51	1.55	58	45	13	1.76	1.36	6	18.2	8	4	4	6	5	6	63.05	1.91	-5.05	-0.15	87	2.64	52	1.58	501	15.18	169	5.12	347	10.52	154	4.67	206	6.24	9.6	18	86	2.61	470	14.24	8.9	256	7.76	667	20.21	161	4.88	1677	50.82	15.5	34.4	49.8	10	18	53.8	11804	14473	81.6	357.7	438.6	663	20.09	165	5.00	1836	55.64	1045	31.67	323	9.79	79	2.39	3	441	13.36	49	1.48	359	10.88	DLWLW	3	2	1	2	8	7	8	8	100.0	27	42	51.9	68.8	43.8	37.5	1.06	0.81	31.3	62.5	0.69	0.44	52.9	52.9	17.6	0.88	0.76	41.2	47.1	0.82	0.76
61236	Ekstraklasa 24/25	24/25	4901	Cracovia	33	14	8	11	50	1.52	57	52	5	1.73	1.58	6	18.2	5	5	6	9	3	5	47.78	1.45	9.22	0.28	72	2.18	36	1.09	468	14.18	144	4.36	269	8.15	199	6.03	161	4.88	6.5	9	95	2.88	477	14.45	8.7	265	8.03	842	25.52	120	3.64	1597	48.39	17.9	32.1	50.2	2	7	47.0	9663	12377	78.1	292.8	375.1	726	22.00	165	5.00	1760	53.33	705	21.36	250	7.58	65	1.97	2	378	11.45	47	1.42	388	11.76	WWLLW	6	3	0	2	7	6	7	5	71.4	27	32	39.5	62.5	62.5	43.8	0.75	1.06	37.5	50.0	0.88	0.94	58.8	64.7	29.4	0.82	0.82	41.2	64.7	0.88	0.47
61236	Ekstraklasa 24/25	24/25	3112	GKS Katowice	33	14	7	12	49	1.48	48	45	3	1.45	1.36	9	27.3	8	5	3	6	2	9	53.43	1.62	-5.43	-0.16	71	2.15	44	1.33	479	14.52	150	4.55	301	9.12	178	5.39	147	4.45	6.2	10	112	3.39	436	13.21	8.2	272	8.24	916	27.76	123	3.73	1578	47.82	15.8	29.7	49.0	6	6	48.5	10626	13362	79.5	322.0	404.9	808	24.48	171	5.18	1526	46.24	814	24.67	262	7.94	48	1.45	1	352	10.67	65	1.97	373	11.30	WDWLL	5	2	1	2	9	10	10	8	80.0	24	27	37.5	50.0	56.3	31.3	0.63	0.81	50.0	62.5	0.56	0.38	58.8	41.2	35.3	0.76	0.71	41.2	23.5	0.71	1.06
61236	Ekstraklasa 24/25	24/25	3110	Górnik Zabrze	32	13	7	12	46	1.44	41	35	6	1.28	1.09	10	31.3	8	4	5	5	3	7	45.86	1.43	-4.86	-0.15	69	2.16	48	1.50	477	14.91	151	4.72	280	8.75	197	6.16	172	5.38	7.7	10	76	2.38	511	15.97	10.2	299	9.34	725	22.66	148	4.63	1572	49.13	10.2	36.4	52.9	3	11	56.8	14332	16734	85.6	447.9	522.9	1107	34.59	114	3.56	1612	50.38	725	22.66	214	6.69	62	1.94	5	303	9.47	54	1.69	425	13.28	DLWDD	6	1	3	1	4	4	10	6	60.0	22	23	34.8	47.1	52.9	29.4	0.59	0.82	70.6	64.7	0.41	0.47	40.0	33.3	6.7	0.47	0.67	46.7	46.7	0.53	0.80
61236	Ekstraklasa 24/25	24/25	7915	Motor Lublin	32	13	7	12	46	1.44	46	57	-11	1.44	1.78	6	18.8	7	4	5	6	3	7	51.51	1.61	-5.51	-0.17	76	2.38	51	1.59	419	13.09	130	4.06	277	8.66	142	4.44	162	5.06	6.4	20	118	3.69	440	13.75	8.7	272	8.50	751	23.47	115	3.59	1520	47.50	11.2	30.2	47.8	10	5	47.8	10402	12837	81.0	325.1	401.2	540	16.88	140	4.38	1632	51.00	722	22.56	227	7.09	66	2.06	2	398	12.44	62	1.94	338	10.56	WWLLL	6	2	0	3	5	10	10	10	100.0	26	28	35.9	50.0	62.5	31.3	0.75	0.88	43.8	43.8	0.81	0.69	56.3	50.0	43.8	0.69	0.56	43.8	25.0	0.69	1.38
61236	Ekstraklasa 24/25	24/25	5065	MKS Korona Kielce	33	11	12	10	45	1.36	37	42	-5	1.12	1.27	8	24.2	8	3	6	3	9	4	44.32	1.34	-7.32	-0.22	47	1.42	24	0.73	438	13.27	132	4.00	266	8.06	172	5.21	174	5.27	7.1	4	90	2.73	562	17.03	10.5	308	9.33	895	27.12	128	3.88	1611	48.82	14.6	37.3	49.4	1	5	47.1	9122	11824	77.1	276.4	358.3	694	21.03	142	4.30	1717	52.03	688	20.85	293	8.88	74	2.24	2	406	12.30	41	1.24	466	14.12	DDLWW	9	2	2	1	9	7	7	3	42.9	25	46	61.3	47.1	52.9	29.4	0.53	0.76	64.7	41.2	0.35	0.88	31.3	56.3	6.3	0.31	0.63	50.0	43.8	0.63	0.69
61236	Ekstraklasa 24/25	24/25	7918	Piast Gliwice	33	11	11	11	44	1.33	36	35	1	1.09	1.06	11	33.3	5	8	4	6	3	7	38.96	1.18	-2.96	-0.09	57	1.73	39	1.18	433	13.12	139	4.21	276	8.36	157	4.76	154	4.67	5.8	8	85	2.58	426	12.91	7.9	259	7.85	828	25.09	115	3.48	1642	49.76	18.4	30.8	48.5	3	5	48.4	10901	13838	78.8	330.3	419.3	781	23.67	146	4.42	1854	56.18	726	22.00	236	7.15	65	1.97	2	408	12.36	64	1.94	441	13.36	LWWDL	4	2	1	2	7	5	9	9	100.0	22	16	24.2	47.1	47.1	29.4	0.53	0.59	52.9	58.8	0.59	0.53	31.3	56.3	25.0	0.44	0.63	43.8	68.8	0.63	0.38
61236	Ekstraklasa 24/25	24/25	3115	Widzew Łódź	33	11	6	16	39	1.18	37	48	-11	1.12	1.45	8	24.2	8	2	7	3	4	9	41.75	1.27	-4.75	-0.14	59	1.79	40	1.21	413	12.52	117	3.55	243	7.36	170	5.15	153	4.64	6.8	11	91	2.76	493	14.94	9.1	288	8.73	817	24.76	123	3.73	1471	44.58	12.6	33.8	50.2	6	8	49.5	11046	13481	81.9	334.7	408.5	697	21.12	137	4.15	1564	47.39	653	19.79	276	8.36	69	2.09	4	344	10.42	44	1.33	422	12.79	LWLLD	7	1	1	3	4	6	8	7	87.5	25	27	36.0	47.1	41.2	23.5	0.65	0.47	41.2	64.7	0.76	0.41	43.8	43.8	18.8	0.63	0.50	25.0	50.0	1.06	0.69
61236	Ekstraklasa 24/25	24/25	7295	Radomiak Radom	33	10	8	15	38	1.15	46	51	-5	1.39	1.55	5	15.2	6	5	6	4	3	9	48.47	1.47	-2.47	-0.07	66	2.00	37	1.12	459	13.91	139	4.21	324	9.82	135	4.09	179	5.42	7.2	11	86	2.61	549	16.64	9.8	324	9.82	899	27.24	121	3.67	1527	46.27	19.5	35.1	51.4	2	12	47.8	9255	11936	77.5	280.5	361.7	778	23.58	199	6.03	1573	47.67	768	23.27	242	7.33	81	2.45	1	452	13.70	32	0.97	406	12.30	LDWDD	10	1	3	1	8	7	6	5	83.3	28	24	28.6	35.3	82.4	29.4	0.47	1.12	35.3	64.7	0.82	0.47	31.3	56.3	18.8	0.38	0.81	37.5	43.8	1.06	0.75
61236	Ekstraklasa 24/25	24/25	7913	KS Lechia Gdańsk	32	10	6	16	36	1.13	43	56	-13	1.34	1.75	6	18.8	7	2	7	3	4	9	47.59	1.49	-4.59	-0.14	59	1.84	33	1.03	416	13.00	139	4.34	255	7.97	161	5.03	147	4.59	7.5	10	93	2.91	505	15.78	9.6	294	9.19	798	24.94	123	3.84	1499	46.84	13.7	33.2	48.9	4	2	48.3	9691	12271	79.0	302.8	383.5	713	22.28	109	3.41	1757	54.91	760	23.75	204	6.38	67	2.09	1	364	11.38	30	0.94	332	10.38	LDWWW	11	3	1	1	13	9	9	6	66.7	26	27	34.6	43.8	56.3	18.8	0.56	0.69	68.8	37.5	0.50	0.94	50.0	62.5	31.3	0.69	0.75	37.5	31.3	1.06	1.00
61236	Ekstraklasa 24/25	24/25	3113	Zagłębie Lubin	33	10	6	17	36	1.09	33	49	-16	1.00	1.48	6	18.2	6	3	8	4	3	9	47.74	1.45	-14.74	-0.45	50	1.52	31	0.94	486	14.73	147	4.45	291	8.82	195	5.91	183	5.55	7.0	11	107	3.24	486	14.73	8.6	293	8.88	945	28.64	130	3.94	1626	49.27	17.8	31.2	48.8	3	13	46.3	9187	12015	76.5	278.4	364.1	748	22.67	166	5.03	1707	51.73	789	23.91	233	7.06	57	1.73	2	377	11.42	38	1.15	337	10.21	LLWLD	4	1	1	3	6	9	7	4	57.1	27	25	30.9	29.4	58.8	11.8	0.41	0.71	41.2	58.8	0.88	0.53	31.3	37.5	6.3	0.31	0.56	31.3	50.0	0.81	0.75
61236	Ekstraklasa 24/25	24/25	38732	Stal Mielec	33	7	9	17	30	0.91	38	55	-17	1.15	1.67	4	12.1	5	5	6	2	4	11	54.71	1.66	-16.71	-0.51	67	2.03	43	1.30	446	13.52	136	4.12	305	9.24	141	4.27	158	4.79	6.1	15	109	3.30	476	14.42	8.8	296	8.97	850	25.76	127	3.85	1564	47.39	15.6	30.9	50.5	8	19	49.0	10932	13623	80.2	331.3	412.8	818	24.79	204	6.18	1579	47.85	757	22.94	274	8.30	57	1.73	6	368	11.15	50	1.52	370	11.21	DDWLD	8	1	3	1	9	10	8	3	37.5	29	26	29.9	37.5	50.0	18.8	0.44	0.69	56.3	50.0	0.50	0.81	47.1	35.3	5.9	0.71	0.47	58.8	5.9	0.53	1.47
61236	Ekstraklasa 24/25	24/25	3108	Śląsk Wrocław	33	6	11	16	29	0.88	37	52	-15	1.12	1.58	4	12.1	4	6	6	2	5	10	47.40	1.44	-10.40	-0.32	66	2.00	44	1.33	469	14.21	136	4.12	294	8.91	175	5.30	150	4.55	7.8	15	113	3.42	500	15.15	9.2	328	9.94	924	28.00	145	4.39	1626	49.27	16.5	34.3	49.3	7	7	48.2	9443	11984	78.8	286.2	363.2	788	23.88	155	4.70	1628	49.33	779	23.61	279	8.45	72	2.18	2	443	13.42	60	1.82	399	12.09	DDLWL	6	1	2	2	5	8	8	3	37.5	29	26	29.9	50.0	43.8	18.8	0.63	0.63	68.8	31.3	0.44	0.88	41.2	29.4	23.5	0.47	0.53	29.4	35.3	0.94	0.88
61236	Ekstraklasa 24/25	24/25	38729	Puszcza Niepołomice	32	6	9	17	27	0.84	35	59	-24	1.09	1.84	6	18.8	4	6	6	2	3	11	39.65	1.24	-4.65	-0.15	54	1.69	32	1.00	360	11.25	112	3.50	240	7.50	120	3.75	132	4.13	6.1	9	119	3.72	541	16.91	10.6	334	10.44	936	29.25	109	3.41	1486	46.44	22.3	31.9	51.9	3	9	40.1	6472	9101	71.1	202.3	284.4	856	26.75	146	4.56	1670	52.19	700	21.88	181	5.66	82	2.56	4	484	15.13	50	1.56	322	10.06	DLLLL	2	0	1	4	8	19	9	5	55.6	26	18	23.1	62.5	37.5	18.8	0.88	0.69	56.3	43.8	0.75	1.00	31.3	31.3	6.3	0.31	0.31	56.3	37.5	0.88	1.06
52176	Ekstraklasa 23/24	23/24	3108	Śląsk Wrocław	32	18	8	6	62	1.94	48	28	20	1.50	0.88	13	40.6	9	4	3	9	4	3	46.90	1.47	1.10	0.03	67	2.09	36	1.13	389	12.16	146	4.56	227	7.09	162	5.06	117	3.66	8.8	6	80	2.50	434	13.56	8.1	288	9.00	736	23.00	106	3.31	1730	54.06	15.0	34.0	51.2	0	2	44.4	9067	11648	77.8	283.3	364.0	1001	31.28	121	3.78	1673	52.28	81	2.53	270	8.44	71	2.22	4	363	11.34	43	1.34	384	12.00	WWWWL	9	4	0	1	12	5	12	10	83.3	19	28	49.1	43.8	62.5	31.3	0.56	1.06	81.3	50.0	0.25	0.50	31.3	62.5	12.5	0.38	1.00	62.5	62.5	0.50	0.50
52176	Ekstraklasa 23/24	23/24	7691	Jagiellonia Białystok	32	17	9	6	60	1.88	73	41	32	2.28	1.28	9	28.1	11	3	2	6	6	4	60.76	1.90	12.24	0.38	88	2.75	44	1.38	453	14.16	162	5.06	305	9.53	148	4.63	163	5.09	8.1	9	73	2.28	496	15.50	10.0	289	9.03	515	16.09	118	3.69	1690	52.81	12.0	37.2	52.6	0	0	57.9	13749	16276	84.5	429.7	508.6	713	22.28	139	4.34	1783	55.72	133	4.16	224	7.00	64	2.00	2	373	11.66	65	2.03	448	14.00	WDWLD	9	2	2	1	11	6	15	13	86.7	23	39	56.5	75.0	62.5	43.8	1.63	1.00	50.0	75.0	0.69	0.25	56.3	87.5	43.8	0.81	1.13	43.8	31.3	0.63	1.00
52176	Ekstraklasa 23/24	23/24	3106	Legia Warszawa	33	15	11	7	56	1.70	48	39	9	1.45	1.18	9	27.3	7	6	3	8	5	4	53.49	1.62	-5.49	-0.17	68	2.06	41	1.24	491	14.88	143	4.33	307	9.30	184	5.58	195	5.91	7.2	18	46	1.39	448	13.58	8.5	265	8.03	526	15.94	149	4.52	1720	52.12	15.1	34.4	51.8	0	0	56.8	12909	15610	82.7	391.2	473.0	753	22.82	184	5.58	2009	60.88	63	1.91	274	8.30	83	2.52	5	438	13.27	58	1.76	456	13.82	WWWLW	7	4	0	1	8	6	12	9	75.0	24	34	47.2	56.3	56.3	31.3	0.75	0.69	56.3	62.5	0.50	0.56	58.8	47.1	29.4	0.76	0.71	52.9	52.9	0.53	0.76
52176	Ekstraklasa 23/24	23/24	3110	Górnik Zabrze	32	15	8	9	53	1.66	45	37	8	1.41	1.16	10	31.3	9	5	2	6	3	7	42.83	1.34	2.17	0.07	59	1.84	29	0.91	397	12.41	135	4.22	231	7.22	166	5.19	159	4.97	7.3	6	96	3.00	453	14.16	8.7	289	9.03	701	21.91	112	3.50	1686	52.69	11.7	33.3	48.7	1	0	49.3	10813	13347	81.0	337.9	417.1	1061	33.16	101	3.16	1555	48.59	64	2.00	190	5.94	67	2.09	7	417	13.03	25	0.78	396	12.38	LDDLW	3	1	2	2	6	9	14	10	71.4	22	26	39.4	56.3	56.3	31.3	0.75	0.69	87.5	43.8	0.13	0.63	62.5	50.0	25.0	0.63	0.75	50.0	37.5	0.75	0.81
52176	Ekstraklasa 23/24	23/24	3117	Pogoń Szczecin	32	14	7	11	49	1.53	56	37	19	1.75	1.16	10	31.3	8	2	6	6	5	5	57.61	1.80	-1.61	-0.05	83	2.59	52	1.63	516	16.13	159	4.97	327	10.22	189	5.91	191	5.97	5.9	8	85	2.66	360	11.25	7.5	309	9.66	619	19.34	153	4.78	1766	55.19	13.4	26.1	48.7	1	1	55.8	12529	15288	82.0	391.5	477.8	859	26.84	182	5.69	1933	60.41	81	2.53	207	6.47	65	2.03	2	349	10.91	38	1.19	294	9.19	WDLWD	12	2	2	1	5	4	8	7	87.5	22	29	43.9	50.0	68.8	43.8	0.81	1.25	37.5	56.3	0.75	0.75	31.3	62.5	31.3	0.50	0.94	68.8	68.8	0.50	0.31
52176	Ekstraklasa 23/24	23/24	35268	Raków Częstochowa	33	13	10	10	49	1.48	51	39	12	1.55	1.18	10	30.3	9	5	2	4	5	8	60.07	1.82	-9.07	-0.27	77	2.33	49	1.48	474	14.36	162	4.91	311	9.42	163	4.94	196	5.94	9.8	10	75	2.27	414	12.55	7.6	291	8.82	494	14.97	124	3.76	1859	56.33	14.1	35.5	50.0	1	1	55.9	12209	15055	81.1	370.0	456.2	850	25.76	164	4.97	1946	58.97	78	2.36	265	8.03	72	2.18	3	447	13.55	56	1.70	445	13.48	LLWLW	5	2	0	3	4	7	13	9	69.2	23	22	31.9	56.3	62.5	25.0	0.88	1.00	75.0	62.5	0.25	0.44	47.1	52.9	17.6	0.65	0.59	47.1	41.2	0.82	0.82
52176	Ekstraklasa 23/24	23/24	3121	Lech Poznań	32	12	11	9	47	1.47	43	40	3	1.34	1.25	11	34.4	8	4	4	4	7	5	42.09	1.32	0.91	0.03	55	1.72	32	1.00	392	12.25	140	4.38	232	7.25	160	5.00	187	5.84	7.8	10	103	3.22	418	13.06	8.5	265	8.28	532	16.63	112	3.50	1725	53.91	11.2	32.5	48.8	0	0	59.0	13307	15883	83.8	415.8	496.3	1015	31.72	146	4.56	1921	60.03	41	1.28	259	8.09	66	2.06	3	403	12.59	57	1.78	380	11.88	LDLLD	5	0	2	3	4	7	13	9	69.2	21	30	47.6	50.0	68.8	37.5	0.81	0.88	62.5	68.8	0.44	0.56	43.8	43.8	18.8	0.50	0.50	56.3	50.0	0.75	0.75
52176	Ekstraklasa 23/24	23/24	3115	Widzew Łódź	32	12	7	13	43	1.34	41	42	-1	1.28	1.31	7	21.9	8	1	7	4	6	6	42.02	1.31	-1.02	-0.03	56	1.75	36	1.13	423	13.22	137	4.28	243	7.59	180	5.63	181	5.66	6.2	11	98	3.06	478	14.94	9.1	274	8.56	585	18.28	120	3.75	1715	53.59	14.2	31.7	50.5	0	1	52.7	11723	14402	81.4	366.3	450.1	767	23.97	151	4.72	1860	58.13	48	1.50	234	7.31	74	2.31	3	368	11.50	52	1.63	343	10.72	WDLLL	3	1	1	3	6	8	8	6	75.0	25	34	45.3	43.8	50.0	18.8	0.50	0.63	50.0	50.0	0.69	0.50	50.0	56.3	18.8	0.50	0.94	56.3	37.5	0.56	0.88
52176	Ekstraklasa 23/24	23/24	7918	Piast Gliwice	32	9	15	8	42	1.31	37	33	4	1.16	1.03	13	40.6	7	7	2	2	8	6	49.20	1.54	-12.20	-0.38	61	1.91	37	1.16	395	12.34	124	3.88	257	8.03	138	4.31	162	5.06	6.1	7	68	2.13	420	13.13	8.6	241	7.53	573	17.91	114	3.56	1628	50.88	18.5	32.8	49.9	0	0	50.0	10346	13142	78.7	323.3	410.7	768	24.00	144	4.50	1912	59.75	36	1.13	221	6.91	69	2.16	3	406	12.69	44	1.38	420	13.13	LDWDW	9	2	2	1	8	3	8	5	62.5	19	26	45.6	37.5	56.3	18.8	0.50	1.00	87.5	56.3	0.13	0.69	31.3	31.3	0.0	0.50	0.31	56.3	50.0	0.50	0.75
52176	Ekstraklasa 23/24	23/24	38732	Stal Mielec	32	11	8	13	41	1.28	40	46	-6	1.25	1.44	8	25.0	8	4	3	3	4	10	30.85	0.96	9.15	0.29	43	1.34	20	0.63	329	10.28	116	3.63	182	5.69	147	4.59	118	3.69	6.7	9	103	3.22	435	13.59	8.4	243	7.59	703	21.97	85	2.66	1778	55.56	14.1	31.0	48.6	0	0	48.7	10871	13784	78.9	339.7	430.8	815	25.47	116	3.63	1652	51.63	54	1.69	240	7.50	61	1.91	4	371	11.59	34	1.06	350	10.94	LDDWL	7	1	2	2	7	9	7	7	100.0	24	32	44.4	60.0	46.7	40.0	0.80	0.73	60.0	53.3	0.47	0.53	35.3	35.3	11.8	0.41	0.59	47.1	41.2	0.88	0.94
52176	Ekstraklasa 23/24	23/24	3113	Zagłębie Lubin	32	11	8	13	41	1.28	39	48	-9	1.22	1.50	9	28.1	6	5	5	5	3	8	45.82	1.43	-6.82	-0.21	59	1.84	33	1.03	471	14.72	152	4.75	280	8.75	191	5.97	170	5.31	6.8	6	102	3.19	398	12.44	7.5	337	10.53	572	17.88	130	4.06	1678	52.44	14.8	31.6	50.7	0	0	50.2	11671	14383	81.1	364.7	449.5	859	26.84	147	4.59	1665	52.03	55	1.72	235	7.34	59	1.84	6	349	10.91	51	1.59	407	12.72	LWWWW	8	4	0	1	12	7	13	8	61.5	23	19	27.5	43.8	56.3	12.5	0.44	0.63	75.0	37.5	0.38	0.69	50.0	62.5	43.8	0.75	0.63	37.5	50.0	1.06	0.88
52176	Ekstraklasa 23/24	23/24	38729	Puszcza Niepołomice	32	9	13	10	40	1.25	36	42	-6	1.13	1.31	8	25.0	7	8	2	2	5	8	39.06	1.22	-3.06	-0.10	46	1.44	24	0.75	344	10.75	108	3.38	232	7.25	112	3.50	139	4.34	4.5	11	114	3.56	489	15.28	10.1	309	9.66	818	25.56	98	3.06	1466	45.81	23.4	31.5	49.1	0	0	38.0	5830	8594	67.8	182.2	268.6	795	24.84	161	5.03	1581	49.41	79	2.47	188	5.88	93	2.91	4	505	15.78	53	1.66	364	11.38	WDWLD	9	2	2	1	4	3	11	4	36.4	24	20	27.8	52.9	52.9	11.8	0.65	0.71	70.6	52.9	0.47	0.71	40.0	26.7	6.7	0.47	0.40	60.0	46.7	0.67	0.80
52176	Ekstraklasa 23/24	23/24	4901	Cracovia	33	8	14	11	38	1.15	43	44	-1	1.30	1.33	10	30.3	5	7	5	3	7	6	45.65	1.38	-2.65	-0.08	54	1.64	32	0.97	461	13.97	131	3.97	274	8.30	187	5.67	171	5.18	7.1	16	90	2.73	461	13.97	9.0	301	9.12	718	21.76	149	4.52	1750	53.03	19.5	31.1	52.4	1	2	44.8	8878	11730	75.7	269.0	355.5	871	26.39	166	5.03	1870	56.67	97	2.94	211	6.39	68	2.06	3	431	13.06	50	1.52	346	10.48	LWLWD	9	2	1	2	7	6	12	8	66.7	23	21	30.4	52.9	64.7	41.2	0.76	1.12	58.8	47.1	0.59	0.88	37.5	18.8	6.3	0.50	0.19	56.3	50.0	0.63	0.56
52176	Ekstraklasa 23/24	23/24	5065	MKS Korona Kielce	33	8	13	12	37	1.12	39	43	-4	1.18	1.30	7	21.2	6	7	3	2	6	9	46.20	1.40	-7.20	-0.22	55	1.67	30	0.91	454	13.76	133	4.03	251	7.61	203	6.15	160	4.85	8.0	6	85	2.58	577	17.48	11.3	313	9.48	614	18.61	141	4.27	1810	54.85	16.6	38.7	50.5	0	0	49.4	9496	12540	75.7	287.8	380.0	1017	30.82	146	4.42	1931	58.52	78	2.36	227	6.88	69	2.09	1	440	13.33	56	1.70	452	13.70	WWLDD	7	2	2	1	6	6	8	6	75.0	26	20	25.6	62.5	56.3	37.5	0.94	0.75	62.5	56.3	0.50	0.69	11.8	47.1	5.9	0.18	0.53	35.3	47.1	0.76	0.65
52176	Ekstraklasa 23/24	23/24	7295	Radomiak Radom	32	9	8	15	35	1.09	39	56	-17	1.22	1.75	6	18.8	4	5	8	5	3	7	50.39	1.57	-11.39	-0.36	65	2.03	47	1.47	457	14.28	133	4.16	308	9.63	149	4.66	169	5.28	7.1	15	82	2.56	417	13.03	8.8	295	9.22	627	19.59	125	3.91	1644	51.38	18.4	33.7	50.7	1	0	48.6	8914	11531	77.3	278.6	360.3	796	24.88	189	5.91	1711	53.47	38	1.19	212	6.63	86	2.69	7	422	13.19	48	1.50	452	14.13	LLLWL	4	1	0	4	7	11	8	7	87.5	26	22	28.2	35.3	47.1	17.6	0.53	0.65	52.9	23.5	0.71	0.94	33.3	40.0	20.0	0.60	0.67	40.0	46.7	0.93	0.93
52176	Ekstraklasa 23/24	23/24	7922	Warta Poznań	32	8	10	14	34	1.06	31	42	-11	0.97	1.31	8	25.0	4	5	6	4	5	8	31.96	1.00	-0.96	-0.03	33	1.03	21	0.66	306	9.56	97	3.03	188	5.88	118	3.69	104	3.25	5.8	9	95	2.97	504	15.75	10.0	338	10.56	736	23.00	90	2.81	1720	53.75	22.1	32.3	49.3	0	2	41.7	7683	10874	70.7	240.1	339.8	753	23.53	123	3.84	1929	60.28	68	2.13	230	7.19	73	2.28	2	488	15.25	40	1.25	354	11.06	LLLWL	4	1	0	4	2	8	10	5	50.0	24	27	37.5	53.3	6.7	6.7	0.80	0.20	33.3	66.7	0.80	0.33	35.3	47.1	23.5	0.41	0.53	64.7	35.3	0.53	0.94
52176	Ekstraklasa 23/24	23/24	3105	Ruch Chorzów	32	5	14	13	29	0.91	37	53	-16	1.16	1.66	7	21.9	3	7	6	2	7	7	43.20	1.35	-6.20	-0.19	50	1.56	30	0.94	411	12.84	117	3.66	244	7.63	167	5.22	145	4.53	6.4	10	98	3.06	461	14.41	8.8	307	9.59	719	22.47	125	3.91	1659	51.84	16.8	33.3	49.1	0	2	47.8	9121	11984	76.1	285.0	374.5	780	24.38	150	4.69	1602	50.06	53	1.66	213	6.66	68	2.13	5	408	12.75	35	1.09	412	12.88	WLWWW	8	4	0	1	9	5	6	3	50.0	25	28	37.3	37.5	56.3	31.3	0.38	0.81	50.0	50.0	0.69	0.69	31.3	50.0	18.8	0.44	0.69	37.5	37.5	0.94	1.00
52176	Ekstraklasa 23/24	23/24	3123	ŁKS Łódź	32	6	6	20	24	0.75	34	70	-36	1.06	2.19	2	6.3	5	5	7	1	1	13	37.54	1.17	-3.54	-0.11	40	1.25	21	0.66	362	11.31	108	3.38	193	6.03	169	5.28	127	3.97	8.5	5	114	3.56	473	14.78	9.4	304	9.50	718	22.44	109	3.41	1706	53.31	12.9	35.6	47.3	1	1	48.6	10340	12932	80.0	323.1	404.1	847	26.47	94	2.94	1584	49.50	35	1.09	265	8.28	82	2.56	5	450	14.06	45	1.41	404	12.63	WLLLL	4	1	0	4	6	14	5	3	60.0	30	22	24.4	47.1	52.9	29.4	0.59	0.76	52.9	17.6	0.65	1.29	6.7	53.3	0.0	0.07	0.67	13.3	26.7	1.13	1.33
42004	Ekstraklasa 22/23	22/23	35268	Raków Częstochowa	33	22	6	5	72	2.18	62	24	38	1.88	0.73	16	48.5	13	2	1	9	4	4	61.49	1.86	0.51	0.02	82	2.48	49	1.48	468	14.18	154	4.67	302	9.15	166	5.03	195	5.91	9.7	11	62	1.88	447	13.55	8.2	363	11.00	412	12.48	129	3.91	54	1.64	15.6	36.5	50.8	0	0	53.5	11627	14590	79.7	352.3	442.1	884	26.79	150	4.55	1979	59.97	0	0.00	306	9.27	77	2.33	3	463	14.03	62	1.88	443	13.42	DWLLW	5	2	1	2	7	5	15	14	93.3	17	21	41.2	75.0	75.0	56.3	1.00	1.50	75.0	68.8	0.25	0.38	41.2	52.9	29.4	0.53	0.76	58.8	70.6	0.53	0.29
42004	Ekstraklasa 22/23	22/23	3106	Legia Warszawa	33	19	8	6	65	1.97	56	36	20	1.70	1.09	12	36.4	12	5	0	7	3	6	51.48	1.56	4.52	0.14	71	2.15	42	1.27	489	14.82	161	4.88	276	8.36	213	6.45	184	5.58	7.3	15	86	2.61	510	15.45	9.8	338	10.24	546	16.55	122	3.70	112	3.39	12.9	35.9	51.9	0	0	58.7	13510	16255	83.1	409.4	492.6	899	27.24	178	5.39	1808	54.79	0	0.00	266	8.06	80	2.42	3	396	12.00	64	1.94	440	13.33	WLWLW	9	3	0	2	11	5	14	11	78.6	21	24	38.1	64.7	88.2	52.9	0.88	1.35	64.7	58.8	0.41	0.59	37.5	50.0	25.0	0.56	0.56	68.8	37.5	0.31	0.88
42004	Ekstraklasa 22/23	22/23	3121	Lech Poznań	33	17	10	6	61	1.85	51	27	24	1.55	0.82	16	48.5	9	2	5	8	8	1	55.85	1.69	-4.85	-0.15	81	2.45	53	1.61	527	15.97	193	5.85	305	9.24	222	6.73	189	5.73	9.5	15	77	2.33	467	14.15	8.8	323	9.79	445	13.48	140	4.24	55	1.67	10.9	35.7	49.5	0	0	60.3	14387	17072	84.3	436.0	517.3	1163	35.24	130	3.94	2061	62.45	0	0.00	267	8.09	73	2.21	2	442	13.39	45	1.36	403	12.21	WWWWL	9	4	0	1	10	1	12	12	100.0	17	29	56.9	62.5	50.0	31.3	0.81	0.75	68.8	75.0	0.38	0.44	47.1	82.4	41.2	0.53	1.00	58.8	58.8	0.41	0.41
42004	Ekstraklasa 22/23	22/23	3117	Pogoń Szczecin	33	16	9	8	57	1.73	55	45	10	1.67	1.36	8	24.2	9	4	3	7	5	5	60.93	1.85	-5.93	-0.18	71	2.15	39	1.18	516	15.64	175	5.30	313	9.48	203	6.15	206	6.24	9.9	15	77	2.33	473	14.33	9.2	312	9.45	516	15.64	150	4.55	115	3.48	12.2	34.5	50.2	0	0	58.1	13222	16190	81.7	400.7	490.6	867	26.27	138	4.18	1965	59.55	0	0.00	311	9.42	70	2.12	1	382	11.58	48	1.45	341	10.33	WLWWD	12	3	1	1	10	5	11	9	81.8	25	37	49.3	75.0	62.5	56.3	0.94	1.00	50.0	43.8	0.50	0.88	41.2	64.7	23.5	0.59	0.82	70.6	35.3	0.41	0.94
42004	Ekstraklasa 22/23	22/23	7918	Piast Gliwice	33	15	8	10	53	1.61	37	30	7	1.12	0.91	10	30.3	7	4	6	8	4	4	39.23	1.19	-2.23	-0.07	54	1.64	32	0.97	355	10.76	105	3.18	238	7.21	117	3.55	133	4.03	5.9	10	75	2.27	489	14.82	9.4	341	10.33	628	19.03	83	2.52	0	0.00	18.3	34.8	50.8	0	0	45.5	9559	12610	75.8	289.7	382.1	846	25.64	149	4.52	1905	57.73	0	0.00	224	6.79	63	1.91	2	421	12.76	57	1.73	442	13.39	WDWWD	10	3	2	0	4	3	9	8	88.9	23	32	46.4	35.3	41.2	11.8	0.38	0.69	64.7	35.3	0.31	0.63	50.0	43.8	18.8	0.69	0.56	68.8	62.5	0.38	0.50
42004	Ekstraklasa 22/23	22/23	3110	Górnik Zabrze	33	13	9	11	48	1.45	45	41	4	1.36	1.24	11	33.3	6	5	5	7	4	6	49.27	1.49	-4.27	-0.13	59	1.79	34	1.03	453	13.73	146	4.42	280	8.48	173	5.24	172	5.21	8.4	15	105	3.18	560	16.97	10.4	417	12.64	541	16.39	133	4.03	119	3.61	13.8	36.3	49.9	0	0	54.6	12464	15554	80.1	377.7	471.3	1058	32.06	149	4.52	2004	60.73	0	0.00	252	7.64	90	2.73	2	449	13.61	70	2.12	366	11.09	DWWWW	11	4	1	0	8	3	10	7	70.0	22	20	30.3	56.3	43.8	18.8	0.81	0.63	43.8	56.3	0.88	0.44	47.1	52.9	29.4	0.59	0.71	47.1	64.7	0.65	0.53
42004	Ekstraklasa 22/23	22/23	7922	Warta Poznań	32	12	9	11	45	1.41	37	30	7	1.16	0.94	12	37.5	5	7	4	7	2	7	35.57	1.11	1.43	0.04	52	1.63	30	0.94	356	11.13	111	3.47	215	6.72	141	4.41	141	4.41	7.3	8	67	2.09	429	13.41	7.8	416	13.00	614	19.19	99	3.09	75	2.34	21.2	32.4	51.5	0	0	45.5	9393	12508	75.1	293.5	390.9	767	23.97	128	4.00	1860	58.13	0	0.00	230	7.19	69	2.16	1	416	13.00	47	1.47	380	11.88	LDLLL	1	0	1	4	3	9	9	8	88.9	20	12	20.0	37.5	62.5	25.0	0.56	0.75	68.8	56.3	0.44	0.44	43.8	43.8	31.3	0.50	0.50	56.3	68.8	0.56	0.44
42004	Ekstraklasa 22/23	22/23	3113	Zagłębie Lubin	33	12	8	13	44	1.33	35	44	-9	1.06	1.33	8	24.2	4	4	8	8	4	5	47.94	1.45	-12.94	-0.39	57	1.73	40	1.21	481	14.58	161	4.88	280	8.48	201	6.09	180	5.45	8.0	9	85	2.58	450	13.64	8.0	324	9.82	688	20.85	125	3.79	50	1.52	13.8	32.5	48.7	0	0	47.3	9905	12875	76.9	300.2	390.2	802	24.30	152	4.61	1842	55.82	0	0.00	226	6.85	49	1.48	2	405	12.27	39	1.18	363	11.00	DWWWW	11	4	1	0	9	2	8	6	75.0	25	29	38.7	25.0	43.8	12.5	0.31	0.50	68.8	37.5	0.44	0.81	47.1	52.9	29.4	0.65	0.65	52.9	47.1	0.53	0.88
42004	Ekstraklasa 22/23	22/23	7295	Radomiak Radom	33	12	7	14	43	1.30	33	40	-7	1.00	1.21	9	27.3	5	3	8	7	4	6	39.91	1.21	-6.91	-0.21	52	1.58	35	1.06	424	12.85	124	3.76	272	8.24	152	4.61	152	4.61	6.9	11	108	3.27	478	14.48	8.5	339	10.27	601	18.21	112	3.39	59	1.79	15.8	36.3	50.8	0	0	46.5	8686	11625	74.7	263.2	352.3	963	29.18	169	5.12	1924	58.30	0	0.00	230	6.97	82	2.48	3	433	13.12	45	1.36	501	15.18	LWWLW	6	3	0	2	6	7	9	8	88.9	24	25	34.7	31.3	37.5	18.8	0.44	0.56	43.8	56.3	0.69	0.50	35.3	41.2	17.6	0.53	0.47	58.8	41.2	0.41	0.82
42004	Ekstraklasa 22/23	22/23	5065	MKS Korona Kielce	32	11	7	14	40	1.25	38	45	-7	1.19	1.41	8	25.0	8	2	6	3	5	8	45.13	1.41	-7.13	-0.22	53	1.66	31	0.97	446	13.94	149	4.66	257	8.03	189	5.91	179	5.59	6.0	13	90	2.81	495	15.47	9.2	379	11.84	718	22.44	109	3.41	49	1.53	14.3	33.3	48.0	0	0	40.9	6929	9742	71.1	216.5	304.4	806	25.19	169	5.28	1654	51.69	0	0.00	246	7.69	80	2.50	3	458	14.31	46	1.44	380	11.88	WLLWL	5	2	0	3	6	7	10	8	80.0	24	30	41.7	56.3	37.5	18.8	0.69	0.44	50.0	62.5	0.69	0.44	37.5	62.5	12.5	0.44	0.81	50.0	31.3	0.69	1.00
42004	Ekstraklasa 22/23	22/23	4901	Cracovia	32	10	10	12	40	1.25	37	35	2	1.16	1.09	10	31.3	7	5	4	3	5	8	42.57	1.33	-5.57	-0.17	56	1.75	35	1.09	443	13.84	132	4.13	283	8.84	160	5.00	156	4.88	6.8	13	81	2.53	444	13.88	8.1	344	10.75	652	20.38	115	3.59	59	1.84	18.3	31.1	50.6	0	0	44.9	8515	11408	74.6	266.1	356.5	870	27.19	166	5.19	1786	55.81	0	0.00	220	6.88	70	2.19	3	395	12.34	36	1.13	335	10.47	WDLLD	7	1	2	2	5	6	9	7	77.8	22	20	30.3	31.3	68.8	31.3	0.38	0.94	81.3	62.5	0.19	0.44	43.8	50.0	25.0	0.44	0.56	50.0	37.5	0.69	0.88
42004	Ekstraklasa 22/23	22/23	38732	Stal Mielec	33	10	10	13	40	1.21	34	40	-6	1.03	1.21	11	33.3	6	7	4	4	3	9	34.79	1.05	-0.79	-0.02	44	1.33	24	0.73	372	11.27	110	3.33	209	6.33	163	4.94	129	3.91	6.8	5	105	3.18	480	14.55	8.9	303	9.18	639	19.36	110	3.33	63	1.91	13.9	36.4	52.1	0	0	49.0	10368	13499	76.8	314.2	409.1	819	24.82	132	4.00	1757	53.24	0	0.00	245	7.42	58	1.76	3	397	12.03	44	1.33	497	15.06	WLDDW	9	2	2	1	3	3	10	8	80.0	22	17	25.8	35.3	47.1	23.5	0.41	0.65	82.4	52.9	0.18	0.65	43.8	31.3	18.8	0.63	0.38	50.0	50.0	0.75	0.88
42004	Ekstraklasa 22/23	22/23	7691	Jagiellonia Białystok	32	8	14	10	38	1.19	46	47	-1	1.44	1.47	4	12.5	7	4	4	1	10	6	45.16	1.41	0.84	0.03	58	1.81	34	1.06	388	12.13	132	4.13	248	7.75	140	4.38	120	3.75	7.2	11	126	3.94	513	16.03	9.5	370	11.56	727	22.72	99	3.09	43	1.34	15.1	34.9	49.8	0	0	47.0	9211	12230	75.3	287.8	382.2	762	23.81	118	3.69	1588	49.63	0	0.00	260	8.13	88	2.75	6	430	13.44	81	2.53	382	11.94	LDLDW	3	1	2	2	6	10	9	3	33.3	28	44	52.4	60.0	60.0	20.0	0.93	0.93	40.0	53.3	0.73	0.60	47.1	41.2	17.6	0.47	0.59	58.8	29.4	0.53	1.06
42004	Ekstraklasa 22/23	22/23	3115	Widzew Łódź	32	10	8	14	38	1.19	35	45	-10	1.09	1.41	11	34.4	5	3	9	5	5	5	47.95	1.50	-12.95	-0.40	63	1.97	39	1.22	435	13.59	124	3.88	270	8.44	165	5.16	173	5.41	8.9	18	98	3.06	433	13.53	7.6	334	10.44	695	21.72	121	3.78	51	1.59	13.8	32.9	49.2	0	0	49.2	10340	13178	78.5	323.1	411.8	824	25.75	166	5.19	1615	50.47	0	0.00	256	8.00	46	1.44	0	365	11.41	57	1.78	339	10.59	LLLWL	3	1	0	4	4	11	5	5	100.0	21	22	34.9	35.3	70.6	29.4	0.35	0.94	47.1	35.3	0.88	0.76	13.3	53.3	6.7	0.13	0.73	60.0	53.3	0.60	0.53
42004	Ekstraklasa 22/23	22/23	3108	Śląsk Wrocław	33	9	10	14	37	1.12	35	48	-13	1.06	1.45	5	15.2	6	6	5	3	4	9	33.95	1.03	1.05	0.03	49	1.48	31	0.94	355	10.76	124	3.76	200	6.06	155	4.70	142	4.30	10.1	7	84	2.55	460	13.94	8.4	349	10.58	598	18.12	79	2.39	49	1.48	13.6	36.1	50.5	0	0	47.6	10141	13059	77.7	307.3	395.7	997	30.21	114	3.45	1781	53.97	0	0.00	276	8.36	79	2.39	4	395	11.97	43	1.30	400	12.12	LWWDL	10	2	1	2	9	8	6	4	66.7	28	33	39.3	47.1	52.9	35.3	0.59	0.76	41.2	47.1	0.59	0.76	37.5	25.0	0.0	0.38	0.38	50.0	37.5	0.75	0.81
42004	Ekstraklasa 22/23	22/23	3122	Wisła Płock	32	8	7	17	31	0.97	34	50	-16	1.06	1.56	5	15.6	7	4	5	1	3	12	37.08	1.16	-3.08	-0.10	47	1.47	28	0.88	384	12.00	117	3.66	225	7.03	159	4.97	145	4.53	6.8	10	121	3.78	501	15.66	10.0	291	9.09	636	19.88	110	3.44	61	1.91	12.5	34.8	49.5	0	0	55.0	11779	14706	80.1	368.1	459.6	853	26.66	126	3.94	1725	53.91	0	0.00	207	6.47	67	2.09	4	384	12.00	72	2.25	400	12.50	LLLDL	1	0	1	4	2	10	9	3	33.3	27	24	29.6	37.5	56.3	12.5	0.50	0.75	81.3	43.8	0.19	0.81	43.8	25.0	6.3	0.50	0.38	31.3	12.5	0.88	1.25
42004	Ekstraklasa 22/23	22/23	7913	KS Lechia Gdańsk	33	8	6	19	30	0.91	29	50	-21	0.88	1.52	11	33.3	5	4	8	3	2	11	36.90	1.12	-7.90	-0.24	38	1.15	17	0.52	379	11.48	109	3.30	232	7.03	147	4.45	154	4.67	6.8	9	116	3.52	471	14.27	8.8	320	9.70	610	18.48	107	3.24	62	1.88	13.8	33.2	48.9	0	0	52.5	11338	14097	80.4	343.6	427.2	850	25.76	156	4.73	1757	53.24	0	0.00	284	8.61	69	2.09	1	383	11.61	73	2.21	378	11.45	LWDLL	7	1	1	3	3	7	3	2	66.7	22	15	22.7	5.9	52.9	0.0	0.06	0.82	47.1	52.9	0.71	0.59	31.3	37.5	12.5	0.40	0.47	37.5	37.5	0.80	1.07
42004	Ekstraklasa 22/23	22/23	35330	Miedź Legnica	33	4	10	19	22	0.67	32	54	-22	0.97	1.64	4	12.1	3	7	7	1	3	12	35.45	1.07	-3.45	-0.10	45	1.36	28	0.85	381	11.55	109	3.30	230	6.97	151	4.58	120	3.64	7.2	10	131	3.97	510	15.45	8.8	416	12.61	686	20.79	94	2.85	67	2.03	15.6	32.9	47.3	0	0	43.3	8993	12073	74.5	272.5	365.8	846	25.64	130	3.94	1813	54.94	0	0.00	236	7.15	98	2.97	4	460	13.94	71	2.15	346	10.48	DLLLD	4	0	2	3	5	9	6	3	50.0	29	22	25.3	52.9	35.3	29.4	0.59	0.35	41.2	47.1	0.71	0.65	43.8	37.5	12.5	0.56	0.44	43.8	31.3	0.75	1.19
37062	Ekstraklasa 21/22	21/22	3121	Lech Poznań	32	21	7	4	70	2.19	64	23	41	2.00	0.72	14	43.8	13	2	1	8	5	3	0	0.00	64.00	2.00	84	2.63	46	1.44	584	18.25	203	6.34	350	10.94	234	7.31	211	6.59	7.5	16	49	1.53	413	12.91	8.2	344	10.75	447	13.97	154	4.81	0	0.00	14.9	30.8	49.7	0	0	56.1	12454	15401	80.9	389.2	481.3	1159	36.22	135	4.22	2122	66.31	0	0.00	243	7.59	50	1.56	1	406	12.69	49	1.53	341	10.66	WWWWW	11	5	0	0	12	4	13	12	92.3	18	29	53.7	62.5	75.0	43.8	1.13	1.38	75.0	81.3	0.25	0.19	43.8	62.5	25.0	0.63	0.88	62.5	56.3	0.44	0.56
37062	Ekstraklasa 21/22	21/22	35268	Raków Częstochowa	33	19	9	5	66	2.00	57	28	29	1.73	0.85	14	42.4	10	6	1	9	3	4	0	0.00	57.00	1.73	84	2.55	49	1.48	488	14.79	184	5.58	332	10.06	156	4.73	203	6.15	9.5	11	80	2.42	450	13.64	8.0	377	11.42	526	15.94	103	3.12	0	0.00	17.4	38.4	51.9	0	0	48.9	9905	12854	77.1	300.2	389.5	749	22.70	172	5.21	1902	57.64	0	0.00	336	10.18	75	2.27	4	444	13.45	58	1.76	514	15.58	WLDWW	7	3	1	1	8	4	13	9	69.2	19	20	35.1	58.8	76.5	41.2	0.76	1.29	82.4	58.8	0.18	0.59	43.8	50.0	18.8	0.44	0.94	62.5	62.5	0.44	0.50
37062	Ekstraklasa 21/22	21/22	3117	Pogoń Szczecin	33	17	11	5	62	1.88	61	31	30	1.85	0.94	9	27.3	10	3	3	7	8	2	0	0.00	61.00	1.85	74	2.24	40	1.21	500	15.15	173	5.24	347	10.52	153	4.64	207	6.27	7.6	8	79	2.39	481	14.58	9.3	370	11.21	583	17.67	126	3.82	0	0.00	15.6	34.4	50.3	0	0	55.0	11652	14658	79.5	353.1	444.2	847	25.67	180	5.45	1956	59.27	0	0.00	273	8.27	62	1.88	3	385	11.67	59	1.79	417	12.64	DDDWL	10	1	3	1	7	6	16	11	68.8	24	47	65.3	75.0	68.8	50.0	1.00	1.44	56.3	50.0	0.44	0.75	47.1	58.8	29.4	0.59	0.71	70.6	58.8	0.29	0.41
37062	Ekstraklasa 21/22	21/22	7913	KS Lechia Gdańsk	33	16	8	9	56	1.70	51	38	13	1.55	1.15	12	36.4	12	4	1	4	4	8	0	0.00	51.00	1.55	73	2.21	46	1.39	470	14.24	152	4.61	293	8.88	177	5.36	211	6.39	7.8	13	107	3.24	463	14.03	8.2	385	11.67	618	18.73	118	3.58	0	0.00	16.2	33.5	48.5	0	0	54.2	11242	14301	78.6	340.7	433.4	886	26.85	167	5.06	1825	55.30	0	0.00	258	7.82	73	2.21	1	495	15.00	56	1.70	401	12.15	LDWDW	9	2	2	1	7	7	15	10	66.7	21	26	41.3	70.6	58.8	35.3	0.88	0.88	76.5	70.6	0.24	0.41	37.5	43.8	18.8	0.63	0.69	50.0	31.3	0.63	1.06
37062	Ekstraklasa 21/22	21/22	7918	Piast Gliwice	32	14	9	9	51	1.59	41	34	7	1.28	1.06	10	31.3	7	4	5	7	5	4	0	0.00	41.00	1.28	54	1.69	27	0.84	379	11.84	115	3.59	249	7.78	130	4.06	143	4.47	6.1	8	79	2.47	492	15.38	9.0	393	12.28	711	22.22	94	2.94	0	0.00	17.7	35.4	51.2	0	0	47.1	9764	12795	76.3	305.1	399.8	857	26.78	167	5.22	1781	55.66	0	0.00	250	7.81	49	1.53	0	397	12.41	57	1.78	463	14.47	DWLWW	6	3	1	1	8	6	9	6	66.7	22	31	47.0	31.3	62.5	18.8	0.50	0.81	62.5	43.8	0.44	0.75	43.8	37.5	12.5	0.69	0.56	56.3	62.5	0.44	0.50
37062	Ekstraklasa 21/22	21/22	3122	Wisła Płock	33	15	3	15	48	1.45	48	50	-2	1.45	1.52	9	27.3	11	2	4	4	1	11	0	0.00	48.00	1.45	47	1.42	20	0.61	371	11.24	132	4.00	242	7.33	129	3.91	164	4.97	7.7	5	127	3.85	547	16.58	10.0	364	11.03	689	20.88	103	3.12	0	0.00	15.8	38.5	49.4	0	0	50.5	10120	13356	75.8	306.7	404.7	861	26.09	138	4.18	1664	50.42	0	0.00	277	8.39	93	2.82	5	487	14.76	46	1.39	479	14.52	WLLLW	5	2	0	3	7	10	14	12	85.7	24	19	26.4	70.6	35.3	23.5	1.00	0.59	70.6	70.6	0.29	0.53	68.8	43.8	37.5	0.81	0.50	31.3	25.0	1.00	1.25
37062	Ekstraklasa 21/22	21/22	7295	Radomiak Radom	33	11	14	8	47	1.42	42	40	2	1.27	1.21	8	24.2	7	7	3	4	7	5	0	0.00	42.00	1.27	64	1.94	35	1.06	464	14.06	135	4.09	294	8.91	170	5.15	178	5.39	8.2	14	88	2.67	514	15.58	9.7	291	8.82	603	18.27	137	4.15	0	0.00	19.2	38.4	51.0	0	0	48.5	9115	12173	74.9	276.2	368.9	962	29.15	142	4.30	1835	55.61	0	0.00	301	9.12	71	2.15	4	449	13.61	51	1.55	487	14.76	DWLDL	11	1	2	2	6	10	12	8	66.7	25	31	41.3	47.1	64.7	23.5	0.59	0.94	47.1	58.8	0.71	0.59	56.3	25.0	18.8	0.63	0.38	62.5	56.3	0.44	0.69
37062	Ekstraklasa 21/22	21/22	3110	Górnik Zabrze	32	13	8	11	47	1.47	54	50	4	1.69	1.56	6	18.8	7	5	4	6	3	7	0	0.00	54.00	1.69	79	2.47	49	1.53	465	14.53	161	5.03	282	8.81	183	5.72	170	5.31	7.4	16	81	2.53	487	15.22	8.7	426	13.31	566	17.69	117	3.66	0	0.00	15.2	34.5	50.9	0	0	51.8	10945	14285	76.6	342.0	446.4	1072	33.50	115	3.59	1837	57.41	0	0.00	231	7.22	64	2.00	1	415	12.97	58	1.81	386	12.06	WWLDW	5	3	1	1	15	12	8	6	75.0	26	28	35.9	43.8	56.3	25.0	0.56	1.00	62.5	43.8	0.38	0.75	56.3	56.3	25.0	0.94	0.88	18.8	50.0	1.19	0.81
37062	Ekstraklasa 21/22	21/22	4901	Cracovia	33	12	9	12	45	1.36	39	41	-2	1.18	1.24	10	30.3	7	5	5	5	4	7	0	0.00	39.00	1.18	46	1.39	32	0.97	416	12.61	128	3.88	245	7.42	171	5.18	169	5.12	6.4	10	79	2.39	567	17.18	10.2	347	10.52	677	20.52	108	3.27	0	0.00	16.8	36.8	50.2	0	0	49.1	9196	12436	73.9	278.7	376.8	913	27.67	162	4.91	1815	55.00	0	0.00	228	6.91	71	2.15	2	499	15.12	81	2.45	444	13.45	LWDDW	7	2	2	1	5	4	8	8	100.0	23	20	29.0	35.3	70.6	23.5	0.41	1.00	52.9	70.6	0.76	0.35	25.0	43.8	12.5	0.38	0.56	62.5	37.5	0.50	0.88
37062	Ekstraklasa 21/22	21/22	7922	Warta Poznań	33	11	8	14	41	1.24	33	36	-3	1.00	1.09	10	30.3	4	6	7	7	2	7	0	0.00	33.00	1.00	66	2.00	44	1.33	354	10.73	114	3.45	225	6.82	129	3.91	142	4.30	6.8	14	86	2.61	508	15.39	9.9	426	12.91	721	21.85	97	2.94	0	0.00	17.1	34.8	48.4	0	0	42.5	8430	11638	72.4	255.5	352.7	786	23.82	112	3.39	1743	52.82	0	0.00	247	7.48	68	2.06	2	514	15.58	58	1.76	428	12.97	WLWLL	4	2	0	3	7	7	7	7	100.0	23	22	31.9	23.5	58.8	17.6	0.24	0.71	47.1	41.2	0.59	0.71	37.5	37.5	18.8	0.50	0.56	81.3	56.3	0.31	0.56
37062	Ekstraklasa 21/22	21/22	3106	Legia Warszawa	33	12	4	17	40	1.21	45	48	-3	1.36	1.45	7	21.2	9	0	7	3	4	10	0	0.00	45.00	1.36	61	1.85	37	1.12	453	13.73	146	4.42	283	8.58	170	5.15	207	6.27	8.7	14	91	2.76	556	16.85	10.2	418	12.67	482	14.61	127	3.85	0	0.00	16.7	40.3	51.6	0	0	55.9	12522	15606	80.2	379.5	472.9	882	26.73	198	6.00	2032	61.58	0	0.00	276	8.36	94	2.85	5	493	14.94	44	1.33	496	15.03	WDWLL	9	2	1	2	12	10	10	9	90.0	26	32	41.0	56.3	56.3	43.8	1.00	0.75	50.0	43.8	0.63	0.69	41.2	41.2	11.8	0.47	0.53	47.1	47.1	0.71	0.88
37062	Ekstraklasa 21/22	21/22	7691	Jagiellonia Białystok	33	9	12	12	39	1.18	38	49	-11	1.15	1.48	7	21.2	5	7	4	4	5	8	0	0.00	38.00	1.15	43	1.30	25	0.76	410	12.42	136	4.12	249	7.55	161	4.88	170	5.15	7.2	7	74	2.24	565	17.12	10.5	428	12.97	637	19.30	106	3.21	0	0.00	16.2	36.2	49.7	0	0	48.3	10283	13404	76.7	311.6	406.2	795	24.09	149	4.52	1797	54.45	0	0.00	256	7.76	85	2.58	3	512	15.52	72	2.18	395	11.97	WDDDL	4	1	3	1	5	5	2	2	100.0	26	24	30.8	43.8	56.3	12.5	0.50	0.88	50.0	56.3	0.69	0.50	11.8	64.7	5.9	0.12	0.82	52.9	35.3	0.53	1.24
37062	Ekstraklasa 21/22	21/22	38732	Stal Mielec	32	9	9	14	36	1.13	38	49	-11	1.19	1.53	6	18.8	7	4	5	2	5	9	0	0.00	38.00	1.19	51	1.59	28	0.88	350	10.94	116	3.63	201	6.28	149	4.66	140	4.38	6.1	7	110	3.44	398	12.44	7.5	422	13.19	719	22.47	88	2.75	0	0.00	15.4	34.3	51.6	0	0	45.3	8863	11888	74.6	277.0	371.5	805	25.16	106	3.31	1576	49.25	0	0.00	246	7.69	75	2.34	3	366	11.44	53	1.66	523	16.34	LDLWL	3	1	1	3	6	11	12	8	66.7	26	30	38.5	56.3	37.5	18.8	0.75	0.56	62.5	56.3	0.56	0.63	43.8	37.5	6.3	0.63	0.44	50.0	37.5	0.69	1.19
37062	Ekstraklasa 21/22	21/22	3113	Zagłębie Lubin	32	10	5	17	35	1.09	40	55	-15	1.25	1.72	8	25.0	6	3	7	4	2	10	0	0.00	40.00	1.25	52	1.63	32	1.00	450	14.06	127	3.97	240	7.50	210	6.56	170	5.31	8.7	7	119	3.72	486	15.19	8.6	342	10.69	722	22.56	128	4.00	0	0.00	16.2	34.6	47.4	0	0	48.8	9663	12756	75.8	302.0	398.6	697	21.78	155	4.84	1781	55.66	0	0.00	279	8.72	82	2.56	4	473	14.78	46	1.44	348	10.88	LWWDL	5	2	1	2	12	9	6	3	50.0	24	20	27.8	25.0	68.8	18.8	0.25	1.13	37.5	50.0	1.13	0.56	31.3	43.8	12.5	0.50	0.63	56.3	43.8	0.63	1.13
37062	Ekstraklasa 21/22	21/22	3108	Śląsk Wrocław	33	7	13	13	34	1.03	40	50	-10	1.21	1.52	5	15.2	3	7	6	4	6	7	0	0.00	40.00	1.21	55	1.67	33	1.00	441	13.36	142	4.30	227	6.88	214	6.48	154	4.67	8.6	14	108	3.27	510	15.45	9.5	386	11.70	630	19.09	117	3.55	0	0.00	15.1	36.5	49.6	0	0	48.3	10392	13578	76.5	314.9	411.5	855	25.91	139	4.21	1856	56.24	0	0.00	286	8.67	71	2.15	5	455	13.79	63	1.91	420	12.73	LDDDL	8	0	3	2	6	11	10	4	40.0	28	33	39.3	43.8	31.3	12.5	0.63	0.38	62.5	43.8	0.69	0.75	41.2	64.7	23.5	0.59	0.82	52.9	29.4	0.53	1.06
37062	Ekstraklasa 21/22	21/22	36851	Bruk-Bet Termalica Nieciecza	33	7	10	16	31	0.94	35	55	-20	1.06	1.67	5	15.2	5	4	7	2	6	9	0	0.00	35.00	1.06	56	1.70	33	1.00	417	12.64	117	3.55	258	7.82	159	4.82	164	4.97	6.2	15	126	3.82	434	13.15	7.9	392	11.88	649	19.67	110	3.33	0	0.00	15.3	33.4	51.7	0	0	51.8	10169	13225	76.9	308.2	400.8	923	27.97	164	4.97	1848	56.00	0	0.00	230	6.97	78	2.36	1	432	13.09	56	1.70	472	14.30	DLDWW	11	2	2	1	8	4	8	3	37.5	28	32	38.1	37.5	50.0	18.8	0.38	0.75	68.8	25.0	0.44	1.13	35.3	35.3	5.9	0.53	0.47	41.2	35.3	0.88	0.88
37062	Ekstraklasa 21/22	21/22	3111	Wisła Kraków	33	6	10	17	28	0.85	34	54	-20	1.03	1.64	7	21.2	4	5	7	2	5	10	0	0.00	34.00	1.03	47	1.42	33	1.00	426	12.91	129	3.91	252	7.64	174	5.27	166	5.03	7.5	16	119	3.61	540	16.36	9.5	351	10.64	592	17.94	129	3.91	0	0.00	14.4	34.8	47.7	0	0	53.4	11260	14493	77.7	341.2	439.2	951	28.82	127	3.85	1983	60.09	0	0.00	268	8.12	65	1.97	3	457	13.85	64	1.94	371	11.24	LLDDL	5	0	2	3	5	9	9	4	44.4	26	23	29.5	43.8	37.5	25.0	0.50	0.63	56.3	62.5	0.75	0.56	35.3	47.1	11.8	0.35	0.59	47.1	23.5	0.65	1.29
37062	Ekstraklasa 21/22	21/22	3125	Górnik Łęczna	32	6	9	17	27	0.84	27	56	-29	0.84	1.75	6	18.8	4	5	7	2	4	10	0	0.00	27.00	0.84	35	1.09	20	0.63	322	10.06	99	3.09	192	6.00	130	4.06	128	4.00	7.4	6	122	3.81	517	16.16	9.0	359	11.22	673	21.03	93	2.91	0	0.00	16.7	36.6	49.2	0	0	44.3	8658	11611	74.6	270.6	362.8	800	25.00	140	4.38	1546	48.31	0	0.00	256	8.00	70	2.19	4	449	14.03	51	1.59	426	13.31	LLDLL	1	0	1	4	4	11	6	3	50.0	26	20	25.6	31.3	31.3	0.0	0.38	0.50	43.8	43.8	0.75	0.88	37.5	31.3	6.3	0.50	0.31	37.5	56.3	1.19	0.69
29222	Ekstraklasa 20/21	20/21	3106	Legia Warszawa	30	19	7	4	64	2.13	48	24	24	1.60	0.80	15	50.0	9	3	3	10	4	1	0	0.00	48.00	1.60	0	0.00	0	0.00	300	10.00	152	5.07	0	0.00	0	0.00	184	6.13	\N	0	67	2.23	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	57.8	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	54	1.80	0	410	13.67	45	1.50	446	14.87	WDDWW	8	3	2	0	3	0	9	9	100.0	15	27	60.0	53.3	66.7	33.3	1.00	0.93	40.0	60.0	0.87	0.40	40.0	53.3	20.0	0.67	0.60	80.0	86.7	0.20	0.13
29222	Ekstraklasa 20/21	20/21	35268	Raków Częstochowa	30	17	8	5	59	1.97	46	25	21	1.53	0.83	12	40.0	9	3	3	8	5	2	0	0.00	46.00	1.53	0	0.00	0	0.00	286	9.53	148	4.93	0	0.00	0	0.00	179	5.97	\N	0	70	2.33	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.3	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	57	1.90	2	424	14.13	48	1.60	512	17.07	WWWDW	11	4	1	0	7	1	12	10	83.3	18	30	55.6	40.0	60.0	33.3	0.47	0.80	86.7	60.0	0.13	0.47	53.3	60.0	40.0	0.93	0.87	46.7	60.0	0.53	0.53
29222	Ekstraklasa 20/21	20/21	3117	Pogoń Szczecin	30	15	7	8	52	1.73	36	23	13	1.20	0.77	17	56.7	8	5	2	7	2	6	0	0.00	36.00	1.20	0	0.00	0	0.00	251	8.37	122	4.07	0	0.00	0	0.00	183	6.10	\N	0	96	3.20	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	55.0	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	58	1.93	2	384	12.80	57	1.90	434	14.47	LDDLW	7	1	2	2	4	6	10	9	90.0	13	6	15.4	40.0	66.7	26.7	0.40	0.73	73.3	80.0	0.27	0.27	53.3	53.3	20.0	0.73	0.53	66.7	73.3	0.67	0.33
29222	Ekstraklasa 20/21	20/21	7922	Warta Poznań	30	13	4	13	43	1.43	33	32	1	1.10	1.07	11	36.7	6	2	7	7	2	6	0	0.00	33.00	1.10	0	0.00	0	0.00	196	6.53	90	3.00	0	0.00	0	0.00	131	4.37	\N	0	80	2.67	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	44.2	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	42	1.40	2	388	12.93	43	1.43	508	16.93	WLDWL	9	2	1	2	6	6	6	4	66.7	19	19	33.3	20.0	60.0	20.0	0.20	0.73	73.3	66.7	0.47	0.53	26.7	73.3	20.0	0.40	0.87	73.3	33.3	0.40	0.73
29222	Ekstraklasa 20/21	20/21	3108	Śląsk Wrocław	30	11	10	9	43	1.43	36	32	4	1.20	1.07	9	30.0	7	7	1	4	3	8	0	0.00	36.00	1.20	0	0.00	0	0.00	261	8.70	127	4.23	0	0.00	0	0.00	132	4.40	\N	0	93	3.10	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	48.0	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	49	1.63	3	437	14.57	41	1.37	454	15.13	DWDLW	4	2	2	1	8	8	9	6	66.7	21	21	33.3	60.0	46.7	33.3	0.80	0.60	66.7	66.7	0.47	0.40	33.3	46.7	20.0	0.33	0.67	73.3	33.3	0.27	1.00
29222	Ekstraklasa 20/21	20/21	7913	KS Lechia Gdańsk	30	12	6	12	42	1.40	40	37	3	1.33	1.23	7	23.3	6	3	6	6	3	6	0	0.00	40.00	1.33	0	0.00	0	0.00	243	8.10	109	3.63	0	0.00	0	0.00	159	5.30	\N	0	116	3.87	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	50.3	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	74	2.47	4	441	14.70	52	1.73	471	15.70	LDWLL	2	1	1	3	5	8	9	7	77.8	23	26	37.7	40.0	46.7	20.0	0.73	0.80	53.3	46.7	0.53	0.67	46.7	46.7	26.7	0.47	0.67	53.3	53.3	0.53	0.73
29222	Ekstraklasa 20/21	20/21	7918	Piast Gliwice	30	11	9	10	42	1.40	39	32	7	1.30	1.07	12	40.0	6	3	6	5	6	4	0	0.00	39.00	1.30	0	0.00	0	0.00	264	8.80	123	4.10	0	0.00	0	0.00	132	4.40	\N	0	87	2.90	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	51.0	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	53	1.77	0	366	12.20	51	1.70	469	15.63	LLWDL	8	1	1	3	6	7	8	7	87.5	18	20	37.0	46.7	53.3	33.3	0.53	0.67	73.3	60.0	0.47	0.53	40.0	60.0	40.0	0.53	0.87	53.3	66.7	0.67	0.47
29222	Ekstraklasa 20/21	20/21	3113	Zagłębie Lubin	30	11	8	11	41	1.37	38	40	-2	1.27	1.33	7	23.3	7	5	3	4	3	8	0	0.00	38.00	1.27	0	0.00	0	0.00	257	8.57	120	4.00	0	0.00	0	0.00	147	4.90	\N	0	92	3.07	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	48.4	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	62	2.07	3	396	13.20	52	1.73	446	14.87	LDDDW	6	1	3	1	7	8	7	4	57.1	23	20	29.0	40.0	53.3	6.7	0.60	1.00	33.3	60.0	0.87	0.40	40.0	33.3	13.3	0.47	0.47	46.7	33.3	0.67	0.73
29222	Ekstraklasa 20/21	20/21	4901	Cracovia	30	8	13	9	37	1.23	28	32	-4	0.93	1.07	9	30.0	6	5	4	2	8	5	0	0.00	28.00	0.93	0	0.00	0	0.00	217	7.23	99	3.30	0	0.00	0	0.00	130	4.33	\N	0	91	3.03	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	47.8	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	71	2.37	5	461	15.37	44	1.47	474	15.80	LDWDW	13	2	2	1	3	2	7	5	71.4	21	25	39.7	53.3	53.3	26.7	0.53	0.67	60.0	46.7	0.53	0.67	40.0	26.7	13.3	0.40	0.27	66.7	53.3	0.47	0.47
29222	Ekstraklasa 20/21	20/21	7691	Jagiellonia Białystok	30	10	7	13	37	1.23	39	48	-9	1.30	1.60	4	13.3	6	5	4	4	2	9	0	0.00	39.00	1.30	0	0.00	0	0.00	243	8.10	123	4.10	0	0.00	0	0.00	131	4.37	\N	0	106	3.53	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	47.6	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	65	2.17	5	420	14.00	44	1.47	444	14.80	WLDLD	3	1	2	2	6	9	8	6	75.0	26	27	34.6	53.3	46.7	33.3	0.80	0.73	46.7	60.0	0.73	0.53	46.7	40.0	20.0	0.53	0.53	46.7	26.7	0.60	1.33
29222	Ekstraklasa 20/21	20/21	3121	Lech Poznań	30	9	10	11	37	1.23	39	38	1	1.30	1.27	9	30.0	4	7	4	5	3	7	0	0.00	39.00	1.30	0	0.00	0	0.00	304	10.13	151	5.03	0	0.00	0	0.00	200	6.67	\N	0	97	3.23	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	56.6	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	53	1.77	0	393	13.10	44	1.47	423	14.10	DWLLW	5	2	1	2	7	5	9	4	44.4	21	16	25.4	26.7	53.3	13.3	0.40	0.87	66.7	53.3	0.53	0.60	46.7	53.3	13.3	0.67	0.67	60.0	26.7	0.53	0.87
29222	Ekstraklasa 20/21	20/21	3110	Górnik Zabrze	30	10	7	13	37	1.23	31	33	-2	1.03	1.10	9	30.0	6	3	6	4	4	7	0	0.00	31.00	1.03	0	0.00	0	0.00	276	9.20	133	4.43	0	0.00	0	0.00	169	5.63	\N	0	76	2.53	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	51.9	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	65	2.17	0	423	14.10	31	1.03	452	15.07	DWLLL	7	1	1	3	4	6	8	5	62.5	21	22	34.9	60.0	53.3	33.3	0.73	0.73	46.7	40.0	0.60	0.73	20.0	33.3	13.3	0.27	0.33	60.0	73.3	0.53	0.33
29222	Ekstraklasa 20/21	20/21	3111	Wisła Kraków	30	8	9	13	33	1.10	39	42	-3	1.30	1.40	9	30.0	4	2	9	4	7	4	0	0.00	39.00	1.30	0	0.00	0	0.00	256	8.53	133	4.43	0	0.00	0	0.00	184	6.13	\N	0	102	3.40	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.7	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	80	2.67	1	429	14.30	53	1.77	478	15.93	WLDDL	5	1	2	2	5	8	7	4	57.1	21	29	46.0	46.7	33.3	6.7	0.67	0.60	60.0	26.7	0.53	1.07	46.7	33.3	13.3	0.73	0.60	60.0	46.7	0.40	0.80
29222	Ekstraklasa 20/21	20/21	3122	Wisła Płock	30	8	9	13	33	1.10	37	44	-7	1.23	1.47	9	30.0	4	4	7	4	5	6	0	0.00	37.00	1.23	0	0.00	0	0.00	230	7.67	119	3.97	0	0.00	0	0.00	145	4.83	\N	0	78	2.60	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.5	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	59	1.97	1	456	15.20	40	1.33	491	16.37	WDLWL	8	2	1	2	8	5	6	4	66.7	21	22	34.9	13.3	66.7	13.3	0.33	0.87	66.7	40.0	0.33	0.93	40.0	46.7	20.0	0.60	0.67	53.3	46.7	0.67	1.00
29222	Ekstraklasa 20/21	20/21	38732	Stal Mielec	30	6	11	13	29	0.97	31	47	-16	1.03	1.57	5	16.7	4	5	6	2	6	7	0	0.00	31.00	1.03	0	0.00	0	0.00	240	8.00	125	4.17	0	0.00	0	0.00	141	4.70	\N	0	81	2.70	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	45.5	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	61	2.03	2	368	12.27	40	1.33	442	14.73	DDLWW	8	2	2	1	4	3	5	2	40.0	25	32	42.7	26.7	26.7	13.3	0.27	0.53	53.3	46.7	0.60	0.73	40.0	60.0	20.0	0.53	0.73	46.7	33.3	0.80	1.00
29222	Ekstraklasa 20/21	20/21	7919	Podbeskidzie Bielsko-Biała	30	6	7	17	25	0.83	29	60	-31	0.97	2.00	4	13.3	6	4	5	0	3	12	0	0.00	29.00	0.97	0	0.00	0	0.00	215	7.17	99	3.30	0	0.00	0	0.00	144	4.80	\N	0	90	3.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	47.6	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	61	2.03	4	446	14.87	46	1.53	430	14.33	LDLWL	3	1	1	3	5	8	8	3	37.5	26	20	25.6	53.3	53.3	26.7	0.53	0.60	46.7	46.7	0.80	0.73	40.0	20.0	6.7	0.47	0.33	40.0	13.3	1.07	1.40
23666	Ekstraklasa 19/20	19/20	3106	Legia Warszawa	37	21	6	10	69	1.86	70	35	35	1.89	0.95	14	37.8	13	2	4	8	4	6	0	0.00	70.00	1.89	0	0.00	0	0.00	444	12.00	230	6.22	0	0.00	0	0.00	208	5.62	\N	0	91	2.46	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	54.1	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	70	1.89	2	561	15.16	51	1.38	584	15.78	LDWLD	7	1	2	2	5	5	14	13	92.9	23	32	46.4	68.4	73.7	47.4	1.05	1.47	73.7	47.4	0.26	0.58	27.8	55.6	16.7	0.28	0.94	55.6	61.1	0.50	0.56
23666	Ekstraklasa 19/20	19/20	3121	Lech Poznań	37	18	12	7	66	1.78	70	35	35	1.89	0.95	14	37.8	11	4	4	7	8	3	0	0.00	70.00	1.89	0	0.00	0	0.00	429	11.59	226	6.11	0	0.00	0	0.00	245	6.62	\N	0	120	3.24	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	55.9	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	69	1.86	4	470	12.70	32	0.86	588	15.89	WWWWD	13	4	1	0	13	6	14	12	85.7	23	38	55.1	52.6	57.9	26.3	0.89	1.21	57.9	78.9	0.53	0.21	55.6	72.2	33.3	0.72	0.94	50.0	72.2	0.67	0.50
23666	Ekstraklasa 19/20	19/20	7918	Piast Gliwice	37	18	7	12	61	1.65	41	32	9	1.11	0.86	15	40.5	12	4	3	6	3	9	0	0.00	41.00	1.11	0	0.00	0	0.00	359	9.70	174	4.70	0	0.00	0	0.00	183	4.95	\N	0	118	3.19	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	48.7	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	52	1.41	4	459	12.41	47	1.27	631	17.05	DLWWD	9	2	2	1	5	3	12	10	83.3	22	21	31.8	42.1	52.6	15.8	0.58	0.74	84.2	73.7	0.16	0.47	33.3	44.4	22.2	0.33	0.56	55.6	44.4	0.44	0.67
23666	Ekstraklasa 19/20	19/20	7913	KS Lechia Gdańsk	37	15	11	11	56	1.51	48	50	-2	1.30	1.35	9	24.3	7	5	6	8	6	5	0	0.00	48.00	1.30	0	0.00	0	0.00	323	8.73	147	3.97	0	0.00	0	0.00	191	5.16	\N	0	148	4.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	48.7	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	91	2.46	5	565	15.27	80	2.16	534	14.43	WDLLW	3	2	1	2	6	8	11	8	72.7	28	36	42.9	27.8	55.6	16.7	0.39	0.72	66.7	55.6	0.33	0.89	52.6	63.2	36.8	0.63	0.84	52.6	42.1	0.63	0.84
23666	Ekstraklasa 19/20	19/20	3108	Śląsk Wrocław	37	14	12	11	54	1.46	51	46	5	1.38	1.24	7	18.9	9	8	2	5	4	9	0	0.00	51.00	1.38	0	0.00	0	0.00	327	8.84	155	4.19	0	0.00	0	0.00	200	5.41	\N	0	152	4.11	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.3	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	65	1.76	4	557	15.05	46	1.24	537	14.51	LLDLD	1	0	2	3	6	9	12	8	66.7	30	31	34.4	63.2	68.4	36.8	0.95	1.00	52.6	21.1	0.53	0.95	27.8	22.2	0.0	0.39	0.39	72.2	50.0	0.28	0.72
23666	Ekstraklasa 19/20	19/20	3117	Pogoń Szczecin	37	14	12	11	54	1.46	37	39	-2	1.00	1.05	14	37.8	7	5	6	7	7	5	0	0.00	37.00	1.00	0	0.00	0	0.00	352	9.51	158	4.27	0	0.00	0	0.00	176	4.76	\N	0	141	3.81	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	53.1	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	67	1.81	4	531	14.35	43	1.16	678	18.32	WWDDL	7	2	2	1	8	7	10	7	70.0	23	22	31.9	50.0	33.3	5.6	0.56	0.44	66.7	61.1	0.50	0.44	31.6	42.1	10.5	0.32	0.68	52.6	57.9	0.63	0.53
23666	Ekstraklasa 19/20	19/20	4901	Cracovia	37	16	5	16	53	1.43	49	40	9	1.32	1.08	11	29.7	10	2	6	6	3	10	0	0.00	49.00	1.32	0	0.00	0	0.00	355	9.59	174	4.70	0	0.00	0	0.00	213	5.76	\N	0	98	2.65	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.5	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	85	2.30	2	557	15.05	48	1.30	655	17.70	DLLWW	8	2	1	2	7	6	9	8	88.9	26	24	30.8	27.8	77.8	16.7	0.33	1.11	66.7	50.0	0.33	0.56	42.1	52.6	26.3	0.47	0.74	57.9	42.1	0.47	0.79
23666	Ekstraklasa 19/20	19/20	35268	Raków Częstochowa	37	16	5	16	53	1.43	51	56	-5	1.38	1.51	9	24.3	11	3	5	5	2	11	0	0.00	51.00	1.38	0	0.00	0	0.00	384	10.38	178	4.81	0	0.00	0	0.00	188	5.08	\N	0	139	3.76	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	47.4	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	76	2.05	2	577	15.59	57	1.54	629	17.00	WLLLW	7	2	0	3	9	12	13	8	61.5	28	33	39.3	47.4	78.9	36.8	0.53	1.05	63.2	52.6	0.53	0.63	44.4	38.9	11.1	0.61	0.56	55.6	38.9	0.67	1.22
23666	Ekstraklasa 19/20	19/20	3113	Zagłębie Lubin	37	15	8	14	53	1.43	61	53	8	1.65	1.43	7	18.9	9	6	4	6	2	10	0	0.00	61.00	1.65	0	0.00	0	0.00	387	10.46	196	5.30	0	0.00	0	0.00	190	5.14	\N	0	121	3.27	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	50.9	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	60	1.62	3	542	14.65	59	1.59	566	15.30	WWLWW	9	4	0	1	9	4	14	12	85.7	30	28	31.1	57.9	57.9	36.8	1.00	0.89	42.1	52.6	0.68	0.58	61.1	44.4	33.3	0.89	0.50	55.6	27.8	0.67	0.94
23666	Ekstraklasa 19/20	19/20	3110	Górnik Zabrze	37	14	11	12	53	1.43	51	47	4	1.38	1.27	10	27.0	11	5	3	3	6	9	0	0.00	51.00	1.38	0	0.00	0	0.00	331	8.95	160	4.32	0	0.00	0	0.00	189	5.11	\N	0	114	3.08	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	45.8	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	74	2.00	2	578	15.62	67	1.81	576	15.57	LWWLL	6	2	0	3	6	6	9	8	88.9	27	32	39.5	52.6	78.9	47.4	0.63	1.26	68.4	47.4	0.42	0.63	33.3	44.4	11.1	0.33	0.50	55.6	33.3	0.56	0.94
23666	Ekstraklasa 19/20	19/20	7691	Jagiellonia Białystok	37	14	10	13	52	1.41	48	51	-3	1.30	1.38	11	29.7	8	5	5	6	5	8	0	0.00	48.00	1.30	0	0.00	0	0.00	359	9.70	173	4.68	0	0.00	0	0.00	223	6.03	\N	0	109	2.95	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	50.3	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	86	2.32	4	503	13.59	63	1.70	654	17.68	LWLDL	7	1	1	3	5	11	13	8	61.5	26	34	43.6	44.4	55.6	33.3	0.56	0.83	66.7	50.0	0.33	0.67	42.1	63.2	31.6	0.53	0.68	47.4	47.4	0.89	0.84
23666	Ekstraklasa 19/20	19/20	3122	Wisła Płock	37	14	9	14	51	1.38	45	54	-9	1.22	1.46	8	21.6	9	4	6	5	5	8	0	0.00	45.00	1.22	0	0.00	0	0.00	315	8.51	152	4.11	0	0.00	0	0.00	190	5.14	\N	0	112	3.03	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	48.8	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	72	1.95	0	570	15.41	51	1.38	731	19.76	LWWWW	10	4	0	1	8	3	12	7	58.3	29	39	44.8	57.9	52.6	31.6	0.79	0.63	57.9	47.4	0.47	0.74	44.4	44.4	22.2	0.50	0.50	38.9	38.9	0.83	0.89
23666	Ekstraklasa 19/20	19/20	3111	Wisła Kraków	37	13	6	18	45	1.22	44	56	-12	1.19	1.51	11	29.7	8	3	7	5	3	11	0	0.00	44.00	1.19	0	0.00	0	0.00	306	8.27	143	3.86	0	0.00	0	0.00	176	4.76	\N	0	126	3.41	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	51.1	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	83	2.24	5	583	15.76	66	1.78	569	15.38	LLDWW	3	2	1	2	5	6	10	7	70.0	26	18	23.1	61.1	44.4	33.3	0.72	0.67	61.1	61.1	0.44	0.56	42.1	42.1	21.1	0.53	0.47	47.4	31.6	0.79	1.21
23666	Ekstraklasa 19/20	19/20	5064	MZKS Arka Gdynia	37	10	10	17	40	1.08	39	57	-18	1.05	1.54	8	21.6	6	7	5	4	3	12	0	0.00	39.00	1.05	0	0.00	0	0.00	319	8.62	151	4.08	0	0.00	0	0.00	150	4.05	\N	0	171	4.62	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	45.7	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	84	2.27	3	646	17.46	59	1.59	575	15.54	WLWDL	8	2	1	2	8	8	8	5	62.5	29	27	31.0	22.2	55.6	11.1	0.39	0.78	50.0	50.0	0.61	0.61	31.6	36.8	5.3	0.37	0.58	57.9	26.3	0.58	1.26
23666	Ekstraklasa 19/20	19/20	5065	MKS Korona Kielce	37	9	8	20	35	0.95	29	48	-19	0.78	1.30	11	29.7	6	3	9	3	5	11	0	0.00	29.00	0.78	0	0.00	0	0.00	345	9.32	163	4.41	0	0.00	0	0.00	188	5.08	\N	0	124	3.35	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.0	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	95	2.57	7	684	18.49	60	1.62	630	17.03	WLDDL	6	1	2	2	6	7	7	4	57.1	26	19	24.4	27.8	38.9	5.6	0.33	0.44	50.0	72.2	0.50	0.44	36.8	26.3	5.3	0.42	0.37	36.8	42.1	0.89	0.74
23666	Ekstraklasa 19/20	19/20	3123	ŁKS Łódź	37	6	6	25	24	0.65	33	68	-35	0.89	1.84	5	13.5	5	3	10	1	3	15	0	0.00	33.00	0.89	0	0.00	0	0.00	354	9.57	162	4.38	0	0.00	0	0.00	178	4.81	\N	0	132	3.57	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	51.7	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	89	2.41	4	580	15.68	41	1.11	699	18.89	LWLLL	4	1	0	4	6	11	7	4	57.1	32	29	30.2	44.4	44.4	27.8	0.61	0.56	38.9	55.6	0.94	0.67	26.3	31.6	5.3	0.26	0.37	57.9	15.8	0.84	1.21
17361	Ekstraklasa 18/19	18/19	7918	Piast Gliwice	37	21	9	7	72	1.95	57	33	24	1.54	0.89	16	43.2	15	3	1	6	6	6	0	0.00	57.00	1.54	0	0.00	0	0.00	312	8.43	149	4.03	0	0.00	0	0.00	203	5.49	\N	0	105	2.84	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	50.0	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	52	1.41	2	520	14.05	53	1.43	589	15.92	WDWWW	13	4	1	0	7	2	17	16	94.1	21	33	52.4	78.9	68.4	52.6	0.95	0.89	78.9	73.7	0.21	0.32	50.0	50.0	22.2	0.67	0.56	38.9	55.6	0.72	0.56
17361	Ekstraklasa 18/19	18/19	3106	Legia Warszawa	37	20	8	9	68	1.84	55	38	17	1.49	1.03	14	37.8	10	5	4	10	3	5	0	0.00	55.00	1.49	0	0.00	0	0.00	364	9.84	182	4.92	0	0.00	0	0.00	218	5.89	\N	0	91	2.46	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	53.3	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	77	2.08	4	549	14.84	73	1.97	653	17.65	DLDLW	2	1	2	2	6	6	11	10	90.9	23	20	29.0	57.9	68.4	42.1	0.84	0.79	57.9	73.7	0.58	0.42	22.2	55.6	11.1	0.22	1.11	44.4	61.1	0.61	0.44
17361	Ekstraklasa 18/19	18/19	7913	KS Lechia Gdańsk	37	19	10	8	67	1.81	54	38	16	1.46	1.03	18	48.6	12	5	2	7	5	6	0	0.00	54.00	1.46	0	0.00	0	0.00	342	9.24	156	4.22	0	0.00	0	0.00	171	4.62	\N	0	103	2.78	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	47.9	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	92	2.49	3	557	15.05	62	1.68	547	14.78	WLDLL	4	1	1	3	5	8	18	15	83.3	19	19	33.3	73.7	57.9	42.1	1.00	0.74	73.7	63.2	0.26	0.58	44.4	27.8	5.6	0.61	0.56	72.2	55.6	0.33	0.89
17361	Ekstraklasa 18/19	18/19	7691	Jagiellonia Białystok	37	16	9	12	57	1.54	55	52	3	1.49	1.41	9	24.3	9	4	5	7	5	7	0	0.00	55.00	1.49	0	0.00	0	0.00	334	9.03	165	4.46	0	0.00	0	0.00	169	4.57	\N	0	106	2.86	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	48.3	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	76	2.05	3	504	13.62	52	1.41	629	17.00	LWLWL	6	2	0	3	6	8	13	11	84.6	28	37	44.0	50.0	66.7	33.3	0.61	1.06	61.1	27.8	0.67	1.00	47.4	52.6	31.6	0.53	0.79	47.4	63.2	0.79	0.37
17361	Ekstraklasa 18/19	18/19	4901	Cracovia	37	17	6	14	57	1.54	45	43	2	1.22	1.16	12	32.4	11	4	4	6	2	10	0	0.00	45.00	1.22	0	0.00	0	0.00	349	9.43	146	3.95	0	0.00	0	0.00	167	4.51	\N	0	103	2.78	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	50.7	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	77	2.08	1	567	15.32	48	1.30	675	18.24	LWWWL	8	3	0	2	6	7	8	8	100.0	25	30	40.0	31.6	57.9	26.3	0.37	0.84	57.9	73.7	0.47	0.32	33.3	55.6	5.6	0.44	0.78	38.9	44.4	0.78	0.78
17361	Ekstraklasa 18/19	18/19	3113	Zagłębie Lubin	37	15	8	14	53	1.43	57	48	9	1.54	1.30	9	24.3	7	4	7	8	4	7	0	0.00	57.00	1.54	0	0.00	0	0.00	301	8.14	162	4.38	0	0.00	0	0.00	184	4.97	\N	0	98	2.65	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	48.7	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	88	2.38	4	518	14.00	83	2.24	620	16.76	DLDDW	13	1	3	1	7	6	13	10	76.9	28	34	40.5	55.6	55.6	38.9	0.83	0.72	61.1	33.3	0.50	0.78	47.4	52.6	21.1	0.68	0.84	47.4	47.4	0.68	0.63
17361	Ekstraklasa 18/19	18/19	3117	Pogoń Szczecin	37	14	10	13	52	1.41	57	54	3	1.54	1.46	10	27.0	8	6	4	6	4	9	0	0.00	57.00	1.54	0	0.00	0	0.00	368	9.95	163	4.41	0	0.00	0	0.00	212	5.73	\N	0	89	2.41	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	52.6	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	78	2.11	2	540	14.59	73	1.97	608	16.43	WDDLD	4	1	3	1	7	6	17	9	52.9	27	28	34.6	55.6	61.1	38.9	0.67	1.00	72.2	50.0	0.33	0.89	57.9	57.9	36.8	0.68	0.74	63.2	31.6	0.63	1.05
17361	Ekstraklasa 18/19	18/19	3121	Lech Poznań	37	15	7	15	52	1.41	49	48	1	1.32	1.30	10	27.0	11	2	5	4	5	10	0	0.00	49.00	1.32	0	0.00	0	0.00	328	8.86	141	3.81	0	0.00	0	0.00	178	4.81	\N	0	113	3.05	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	52.7	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	66	1.78	0	495	13.38	42	1.14	652	17.62	LWLDD	6	1	2	2	4	5	14	10	71.4	27	33	40.7	55.6	61.1	33.3	0.83	0.72	72.2	44.4	0.28	0.89	21.1	47.4	15.8	0.37	0.74	36.8	47.4	0.74	0.68
17361	Ekstraklasa 18/19	18/19	3111	Wisła Kraków	37	14	7	16	49	1.32	67	63	4	1.81	1.70	7	18.9	8	6	5	6	1	11	0	0.00	67.00	1.81	0	0.00	0	0.00	311	8.41	159	4.30	0	0.00	0	0.00	168	4.54	\N	0	130	3.51	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	53.6	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	72	1.95	2	502	13.57	53	1.43	592	16.00	LLWWD	5	2	1	2	9	10	13	8	61.5	30	24	26.7	73.7	57.9	47.4	1.11	0.89	68.4	36.8	0.42	1.05	50.0	50.0	27.8	0.61	1.00	27.8	44.4	1.17	0.78
17361	Ekstraklasa 18/19	18/19	5065	MKS Korona Kielce	37	12	11	14	47	1.27	42	54	-12	1.14	1.46	8	21.6	6	7	6	6	4	8	0	0.00	42.00	1.14	0	0.00	0	0.00	389	10.51	178	4.81	0	0.00	0	0.00	198	5.35	\N	0	91	2.46	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	51.1	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	95	2.57	2	631	17.05	67	1.81	633	17.11	LWLDL	3	1	1	3	4	8	9	7	77.8	29	34	39.1	42.1	31.6	15.8	0.68	0.42	57.9	52.6	0.47	0.84	27.8	61.1	11.1	0.44	0.72	44.4	27.8	0.72	0.89
17361	Ekstraklasa 18/19	18/19	3110	Górnik Zabrze	37	12	10	15	46	1.24	48	53	-5	1.30	1.43	9	24.3	5	6	8	7	4	7	0	0.00	48.00	1.30	0	0.00	0	0.00	367	9.92	188	5.08	0	0.00	0	0.00	164	4.43	\N	0	107	2.89	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	47.5	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	77	2.08	4	567	15.32	102	2.76	583	15.76	WLWLW	7	3	0	2	9	3	12	6	50.0	28	25	29.8	52.6	47.4	21.1	0.74	0.47	63.2	36.8	0.42	0.89	33.3	61.1	22.2	0.33	1.06	50.0	50.0	0.89	0.67
17361	Ekstraklasa 18/19	18/19	3108	Śląsk Wrocław	37	12	8	17	44	1.19	49	45	4	1.32	1.22	10	27.0	7	3	8	5	5	9	0	0.00	49.00	1.32	0	0.00	0	0.00	338	9.14	148	4.00	0	0.00	0	0.00	210	5.68	\N	0	94	2.54	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.3	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	79	2.14	4	547	14.78	105	2.84	624	16.86	WWWWD	11	4	1	0	13	4	12	7	58.3	27	33	40.7	55.6	33.3	33.3	0.67	0.56	72.2	55.6	0.33	0.61	42.1	42.1	21.1	0.63	0.79	57.9	42.1	0.53	0.95
17361	Ekstraklasa 18/19	18/19	5064	MZKS Arka Gdynia	37	10	12	15	42	1.14	49	51	-2	1.32	1.38	9	24.3	6	5	7	4	7	8	0	0.00	49.00	1.32	0	0.00	0	0.00	314	8.49	167	4.51	0	0.00	0	0.00	186	5.03	\N	0	115	3.11	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	47.6	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	73	1.97	4	575	15.54	44	1.19	542	14.65	LWWDW	10	3	1	1	8	6	6	4	66.7	28	30	35.7	27.8	72.2	22.2	0.39	1.11	38.9	55.6	0.83	0.61	36.8	47.4	21.1	0.42	0.74	52.6	47.4	0.53	0.79
17361	Ekstraklasa 18/19	18/19	3122	Wisła Płock	37	10	11	16	41	1.11	50	58	-8	1.35	1.57	6	16.2	5	5	8	5	6	8	0	0.00	50.00	1.35	0	0.00	0	0.00	332	8.97	148	4.00	0	0.00	0	0.00	178	4.81	\N	0	94	2.54	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.7	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	80	2.16	7	565	15.27	67	1.81	732	19.78	DWLDL	1	1	2	2	5	6	9	6	66.7	31	35	37.6	27.8	61.1	16.7	0.33	0.72	66.7	33.3	0.39	1.00	57.9	63.2	36.8	0.79	0.84	36.8	47.4	0.95	0.79
17361	Ekstraklasa 18/19	18/19	35330	Miedź Legnica	37	10	10	17	40	1.08	40	65	-25	1.08	1.76	8	21.6	7	4	8	3	6	9	0	0.00	40.00	1.08	0	0.00	0	0.00	361	9.76	171	4.62	0	0.00	0	0.00	179	4.84	\N	0	119	3.22	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	48.4	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	62	1.68	4	540	14.59	49	1.32	518	14.00	WLLDW	9	2	1	2	8	9	9	6	66.7	29	29	33.3	52.6	26.3	15.8	0.89	0.26	52.6	31.6	0.74	1.11	22.2	38.9	11.1	0.28	0.72	44.4	22.2	0.67	1.00
17361	Ekstraklasa 18/19	18/19	7693	Zagłębie Sosnowiec	37	7	8	22	29	0.78	49	80	-31	1.32	2.16	4	10.8	6	3	9	1	5	13	0	0.00	49.00	1.32	0	0.00	0	0.00	323	8.73	158	4.27	0	0.00	0	0.00	182	4.92	\N	0	145	3.92	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	47.3	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	81	2.19	6	600	16.22	71	1.92	624	16.86	DLLLL	5	0	1	4	4	14	8	4	50.0	33	33	33.3	66.7	61.1	38.9	0.78	1.11	27.8	38.9	1.06	1.28	21.1	52.6	15.8	0.21	0.58	36.8	26.3	1.00	1.00
13350	Ekstraklasa 17/18	17/18	3106	Legia Warszawa	37	22	4	11	70	1.89	55	35	20	1.49	0.95	15	40.5	14	1	4	8	3	7	0	0.00	55.00	1.49	0	0.00	0	0.00	323	8.73	173	4.68	0	0.00	0	0.00	195	5.27	\N	0	117	3.16	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	54.9	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	66	1.78	7	473	12.78	72	1.95	652	17.62	WWWDW	13	4	1	0	11	3	17	16	94.1	22	28	42.4	42.1	68.4	31.6	0.58	1.16	78.9	57.9	0.32	0.47	55.6	38.9	27.8	0.56	0.67	72.2	44.4	0.44	0.67
13350	Ekstraklasa 17/18	17/18	7691	Jagiellonia Białystok	37	20	7	10	67	1.81	55	41	14	1.49	1.11	14	37.8	10	4	5	10	3	5	0	0.00	55.00	1.49	0	0.00	0	0.00	357	9.65	162	4.38	0	0.00	0	0.00	192	5.19	\N	0	88	2.38	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	51.2	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	77	2.08	1	469	12.68	59	1.59	578	15.62	WWWDL	6	3	1	1	6	3	10	9	90.0	23	32	46.4	42.1	68.4	31.6	0.63	0.89	63.2	52.6	0.42	0.58	50.0	66.7	33.3	0.56	0.89	55.6	61.1	0.50	0.72
13350	Ekstraklasa 17/18	17/18	3121	Lech Poznań	37	16	12	9	60	1.62	53	34	19	1.43	0.92	15	40.5	12	3	4	4	9	5	0	0.00	53.00	1.43	0	0.00	0	0.00	358	9.68	178	4.81	0	0.00	0	0.00	234	6.32	\N	0	82	2.22	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	53.8	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	72	1.95	4	507	13.70	51	1.38	667	18.03	LDLDL	9	0	2	3	3	10	12	11	91.7	22	33	50.0	57.9	63.2	42.1	0.84	1.11	63.2	57.9	0.42	0.53	22.2	44.4	16.7	0.22	0.67	72.2	55.6	0.44	0.44
13350	Ekstraklasa 17/18	17/18	3110	Górnik Zabrze	36	15	12	9	57	1.58	65	54	11	1.81	1.50	6	16.7	8	8	2	7	4	7	0	0.00	65.00	1.81	0	0.00	0	0.00	349	9.69	181	5.03	0	0.00	0	0.00	183	5.08	\N	0	102	2.83	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	44.3	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	68	1.89	5	567	15.75	81	2.25	614	17.06	WLDWW	5	3	1	1	10	6	14	8	57.1	30	32	35.6	61.1	72.2	50.0	0.94	1.00	66.7	44.4	0.44	0.83	44.4	66.7	27.8	0.61	1.06	50.0	16.7	0.56	1.17
13350	Ekstraklasa 17/18	17/18	3122	Wisła Płock	37	17	6	14	57	1.54	53	45	8	1.43	1.22	11	29.7	10	3	6	7	3	8	0	0.00	53.00	1.43	0	0.00	0	0.00	332	8.97	165	4.46	0	0.00	0	0.00	182	4.92	\N	0	86	2.32	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	50.3	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	85	2.30	4	581	15.70	39	1.05	633	17.11	LWLDL	4	1	1	3	8	8	9	8	88.9	26	30	38.5	42.1	52.6	21.1	0.74	0.84	63.2	63.2	0.53	0.42	50.0	38.9	5.6	0.61	0.67	33.3	55.6	0.94	0.56
13350	Ekstraklasa 17/18	17/18	3111	Wisła Kraków	37	15	10	12	55	1.49	51	42	9	1.38	1.14	13	35.1	8	4	6	7	6	6	0	0.00	51.00	1.38	0	0.00	0	0.00	294	7.95	153	4.14	0	0.00	0	0.00	192	5.19	\N	0	120	3.24	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	51.5	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	92	2.49	3	559	15.11	65	1.76	577	15.59	LDWWW	5	3	1	1	8	3	11	6	54.5	24	29	40.3	50.0	55.6	27.8	0.50	0.89	50.0	72.2	0.56	0.44	52.6	36.8	15.8	0.84	0.53	47.4	47.4	0.58	0.68
13350	Ekstraklasa 17/18	17/18	3113	Zagłębie Lubin	37	13	13	11	52	1.41	45	42	3	1.22	1.14	14	37.8	7	6	5	6	7	6	0	0.00	45.00	1.22	0	0.00	0	0.00	328	8.86	150	4.05	0	0.00	0	0.00	195	5.27	\N	0	112	3.03	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	51.6	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	74	2.00	3	530	14.32	67	1.81	586	15.84	WLLLW	4	2	0	3	5	8	9	8	88.9	23	31	44.9	44.4	50.0	27.8	0.72	0.61	61.1	55.6	0.44	0.56	31.6	63.2	21.1	0.37	0.74	68.4	47.4	0.53	0.74
13350	Ekstraklasa 17/18	17/18	3108	Śląsk Wrocław	37	13	11	13	50	1.35	50	54	-4	1.35	1.46	8	21.6	11	6	2	2	5	11	0	0.00	50.00	1.35	0	0.00	0	0.00	299	8.08	140	3.78	0	0.00	0	0.00	155	4.19	\N	0	115	3.11	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.6	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	84	2.27	3	559	15.11	83	2.24	619	16.73	WWWDW	13	4	1	0	12	5	11	9	81.8	29	33	37.9	57.9	63.2	31.6	0.89	0.68	63.2	63.2	0.37	0.47	44.4	44.4	5.6	0.50	0.61	33.3	33.3	1.06	1.06
13350	Ekstraklasa 17/18	17/18	4901	Cracovia	37	13	11	13	50	1.35	51	52	-1	1.38	1.41	8	21.6	7	8	4	6	3	9	0	0.00	51.00	1.38	0	0.00	0	0.00	323	8.73	143	3.86	0	0.00	0	0.00	164	4.43	\N	0	118	3.19	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	46.0	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	76	2.05	1	496	13.41	45	1.22	691	18.68	LWLDW	5	2	1	2	9	11	11	7	63.6	29	29	33.3	57.9	73.7	42.1	0.63	1.11	57.9	26.3	0.63	1.11	44.4	33.3	16.7	0.61	0.39	72.2	44.4	0.39	0.67
13350	Ekstraklasa 17/18	17/18	5065	MKS Korona Kielce	37	12	13	12	49	1.32	49	54	-5	1.32	1.46	12	32.4	9	3	6	3	10	6	0	0.00	49.00	1.32	0	0.00	0	0.00	343	9.27	160	4.32	0	0.00	0	0.00	197	5.32	\N	0	97	2.62	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	51.0	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	77	2.08	4	600	16.22	78	2.11	655	17.70	LLDLL	5	0	1	4	4	14	12	9	75.0	25	39	52.0	50.0	61.1	44.4	0.67	0.67	61.1	44.4	0.50	0.83	47.4	47.4	26.3	0.74	0.58	52.6	52.6	0.79	0.79
13350	Ekstraklasa 17/18	17/18	3117	Pogoń Szczecin	37	12	9	16	45	1.22	46	54	-8	1.24	1.46	10	27.0	7	6	6	5	3	10	0	0.00	46.00	1.24	0	0.00	0	0.00	348	9.41	176	4.76	0	0.00	0	0.00	192	5.19	\N	0	82	2.22	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	52.7	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	88	2.38	3	564	15.24	96	2.59	618	16.70	WDLWW	7	3	1	1	10	6	10	7	70.0	27	22	27.2	52.6	57.9	36.8	0.68	0.79	57.9	42.1	0.53	0.84	33.3	27.8	22.2	0.44	0.56	50.0	38.9	0.67	0.89
13350	Ekstraklasa 17/18	17/18	5064	MZKS Arka Gdynia	37	11	10	16	43	1.16	46	48	-2	1.24	1.30	13	35.1	8	6	5	3	4	11	0	0.00	46.00	1.24	0	0.00	0	0.00	308	8.32	144	3.89	0	0.00	0	0.00	198	5.35	\N	0	116	3.14	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	47.3	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	85	2.30	3	666	18.00	41	1.11	567	15.32	LLWLL	5	1	0	4	6	11	8	8	100.0	24	18	25.0	42.1	52.6	26.3	0.79	0.63	63.2	73.7	0.42	0.47	38.9	55.6	27.8	0.39	0.67	44.4	38.9	0.78	0.94
13350	Ekstraklasa 17/18	17/18	7913	KS Lechia Gdańsk	37	9	13	15	40	1.08	46	58	-12	1.24	1.57	8	21.6	4	7	7	5	6	8	0	0.00	46.00	1.24	0	0.00	0	0.00	270	7.30	137	3.70	0	0.00	0	0.00	180	4.86	\N	0	111	3.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	52.1	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	82	2.22	3	597	16.14	78	2.11	656	17.73	DDWLL	5	1	2	2	5	6	7	6	85.7	29	27	31.0	38.9	55.6	22.2	0.72	0.72	44.4	33.3	0.89	0.89	36.8	47.4	10.5	0.47	0.58	42.1	63.2	0.84	0.53
13350	Ekstraklasa 17/18	17/18	7918	Piast Gliwice	36	8	13	15	37	1.03	40	45	-5	1.11	1.25	11	30.6	4	7	6	4	6	9	0	0.00	40.00	1.11	0	0.00	0	0.00	298	8.28	143	3.97	0	0.00	0	0.00	136	3.78	\N	0	97	2.69	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	48.2	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	66	1.83	2	508	14.11	49	1.36	558	15.50	WLLLW	5	2	0	3	11	8	5	4	80.0	25	25	33.3	35.3	35.3	17.6	0.41	0.47	64.7	52.9	0.35	0.53	31.6	73.7	26.3	0.37	0.95	52.6	26.3	0.58	1.00
13350	Ekstraklasa 17/18	17/18	36851	Bruk-Bet Termalica Nieciecza	37	9	9	19	36	0.97	39	66	-27	1.05	1.78	5	13.5	7	4	7	2	5	12	0	0.00	39.00	1.05	0	0.00	0	0.00	309	8.35	130	3.51	0	0.00	0	0.00	173	4.68	\N	0	105	2.84	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.1	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	74	2.00	3	577	15.59	41	1.11	535	14.46	LWDWL	4	2	1	2	6	10	5	1	20.0	32	32	33.3	50.0	50.0	11.1	0.61	0.72	55.6	33.3	0.56	0.94	21.1	47.4	15.8	0.26	0.53	47.4	15.8	0.84	1.21
13350	Ekstraklasa 17/18	17/18	36766	Sandecja Nowy Sącz	37	6	15	16	33	0.89	34	54	-20	0.92	1.46	6	16.2	4	8	6	2	7	10	0	0.00	34.00	0.92	0	0.00	0	0.00	260	7.03	114	3.08	0	0.00	0	0.00	154	4.16	\N	0	128	3.46	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	46.3	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	85	2.30	5	601	16.24	47	1.27	641	17.32	DLDWL	10	1	2	2	4	6	6	2	33.3	31	32	34.4	33.3	44.4	22.2	0.33	0.67	55.6	55.6	0.56	0.61	26.3	36.8	15.8	0.37	0.47	47.4	31.6	0.79	0.95
11734	Ekstraklasa 16/17	16/17	3106	Legia Warszawa	37	21	10	6	73	1.97	70	31	39	1.89	0.84	18	48.6	8	8	3	13	2	3	0	0.00	70.00	1.89	0	0.00	0	0.00	392	10.59	200	5.41	0	0.00	0	0.00	232	6.27	\N	0	106	2.86	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	57.3	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	67	1.81	4	469	12.68	83	2.24	538	14.54	DWDWW	10	3	2	0	9	0	14	12	85.7	19	14	24.6	42.1	63.2	26.3	0.53	1.16	78.9	63.2	0.37	0.42	61.1	66.7	44.4	0.89	1.22	72.2	55.6	0.44	0.44
11734	Ekstraklasa 16/17	16/17	7691	Jagiellonia Białystok	37	21	8	8	71	1.92	64	39	25	1.73	1.05	14	37.8	11	4	4	10	4	4	0	0.00	64.00	1.73	0	0.00	0	0.00	377	10.19	175	4.73	0	0.00	0	0.00	183	4.95	\N	0	79	2.14	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	47.9	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	65	1.76	1	522	14.11	33	0.89	547	14.78	DWDLW	4	2	2	1	6	7	17	16	94.1	23	34	49.3	57.9	68.4	47.4	0.84	1.05	68.4	68.4	0.37	0.53	44.4	50.0	22.2	0.72	0.83	55.6	55.6	0.61	0.61
11734	Ekstraklasa 16/17	16/17	3121	Lech Poznań	37	20	9	8	69	1.86	62	29	33	1.68	0.78	20	54.1	12	4	3	8	5	5	0	0.00	62.00	1.68	0	0.00	0	0.00	425	11.49	203	5.49	0	0.00	0	0.00	227	6.14	\N	0	108	2.92	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	51.2	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	59	1.59	3	484	13.08	36	0.97	511	13.81	DWDLW	9	2	2	1	6	5	15	14	93.3	17	23	45.1	42.1	68.4	36.8	0.63	0.89	78.9	73.7	0.26	0.37	61.1	50.0	33.3	1.11	0.72	66.7	61.1	0.33	0.61
11734	Ekstraklasa 16/17	16/17	7913	KS Lechia Gdańsk	37	20	8	9	68	1.84	57	37	20	1.54	1.00	14	37.8	15	2	2	5	6	7	0	0.00	57.00	1.54	0	0.00	0	0.00	336	9.08	172	4.65	0	0.00	0	0.00	208	5.62	\N	0	126	3.41	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	55.2	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	101	2.73	5	520	14.05	61	1.65	720	19.46	DWDWD	12	2	3	0	8	0	15	14	93.3	23	37	53.6	78.9	78.9	63.2	1.00	1.32	57.9	63.2	0.42	0.42	38.9	27.8	5.6	0.44	0.28	77.8	38.9	0.28	0.89
11734	Ekstraklasa 16/17	16/17	3113	Zagłębie Lubin	37	14	11	12	53	1.43	51	45	6	1.38	1.22	9	24.3	6	6	7	8	5	5	0	0.00	51.00	1.38	0	0.00	0	0.00	361	9.76	170	4.59	0	0.00	0	0.00	207	5.59	\N	0	100	2.70	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	50.2	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	76	2.05	1	545	14.73	65	1.76	487	13.16	LWWWW	9	4	0	1	11	6	11	8	72.7	28	30	35.7	47.4	63.2	26.3	0.68	0.79	36.8	68.4	1.00	0.42	61.1	50.0	27.8	0.67	0.61	66.7	50.0	0.39	0.61
11734	Ekstraklasa 16/17	16/17	3111	Wisła Kraków	37	14	6	17	48	1.30	54	57	-3	1.46	1.54	8	21.6	11	3	4	3	3	13	0	0.00	54.00	1.46	0	0.00	0	0.00	341	9.22	159	4.30	0	0.00	0	0.00	201	5.43	\N	0	127	3.43	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	51.1	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	83	2.24	3	567	15.32	61	1.65	595	16.08	LLWLL	4	1	0	4	8	9	11	8	72.7	29	31	35.6	66.7	61.1	44.4	1.11	0.72	66.7	55.6	0.33	0.67	31.6	57.9	21.1	0.42	0.68	36.8	15.8	0.95	1.11
11734	Ekstraklasa 16/17	16/17	3122	Wisła Płock	37	12	11	14	47	1.27	49	57	-8	1.32	1.54	8	21.6	7	5	7	5	6	7	0	0.00	49.00	1.32	0	0.00	0	0.00	327	8.84	142	3.84	0	0.00	0	0.00	200	5.41	\N	0	137	3.70	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	46.2	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	71	1.92	3	526	14.22	31	0.84	565	15.27	LLLWD	3	1	1	3	3	10	8	6	75.0	29	35	40.2	42.1	57.9	21.1	0.63	0.74	47.4	47.4	0.74	0.68	50.0	44.4	22.2	0.61	0.67	50.0	27.8	0.61	1.06
11734	Ekstraklasa 16/17	16/17	5065	MKS Korona Kielce	37	14	5	18	47	1.27	47	65	-18	1.27	1.76	8	21.6	11	2	5	3	3	13	0	0.00	47.00	1.27	0	0.00	0	0.00	365	9.86	172	4.65	0	0.00	0	0.00	199	5.38	\N	0	116	3.14	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	47.7	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	96	2.59	3	579	15.65	58	1.57	585	15.81	LLWWD	8	2	1	2	5	6	8	6	75.0	29	28	32.2	50.0	66.7	27.8	0.72	1.11	72.2	44.4	0.33	0.78	36.8	21.1	15.8	0.42	0.32	36.8	31.6	1.11	1.26
11734	Ekstraklasa 16/17	16/17	3108	Śląsk Wrocław	37	12	10	15	46	1.24	49	52	-3	1.32	1.41	11	29.7	6	6	7	6	4	8	0	0.00	49.00	1.32	0	0.00	0	0.00	304	8.22	142	3.84	0	0.00	0	0.00	159	4.30	\N	0	123	3.32	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	50.4	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	62	1.68	4	553	14.95	40	1.08	556	15.03	WWWLW	10	4	0	1	15	3	10	8	80.0	26	25	32.1	42.1	42.1	21.1	0.63	0.84	52.6	57.9	0.68	0.74	38.9	33.3	16.7	0.56	0.61	44.4	38.9	0.61	0.78
11734	Ekstraklasa 16/17	16/17	36851	Bruk-Bet Termalica Nieciecza	37	13	7	17	46	1.24	35	55	-20	0.95	1.49	9	24.3	6	5	7	7	2	10	0	0.00	35.00	0.95	0	0.00	0	0.00	318	8.59	141	3.81	0	0.00	0	0.00	175	4.73	\N	0	125	3.38	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	44.9	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	66	1.78	2	512	13.84	38	1.03	526	14.22	WLLDL	6	1	1	3	4	12	10	10	100.0	28	27	32.1	50.0	38.9	27.8	0.61	0.39	55.6	50.0	0.50	0.67	31.6	42.1	21.1	0.42	0.47	36.8	42.1	0.74	1.05
11734	Ekstraklasa 16/17	16/17	3117	Pogoń Szczecin	37	11	13	13	46	1.24	51	54	-3	1.38	1.46	6	16.2	8	7	3	3	6	10	0	0.00	51.00	1.38	0	0.00	0	0.00	360	9.73	166	4.49	0	0.00	0	0.00	175	4.73	\N	0	88	2.38	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	53.3	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	68	1.84	2	514	13.89	63	1.70	601	16.24	WLLDL	3	1	1	3	4	11	6	5	83.3	31	37	39.8	38.9	72.2	33.3	0.61	1.33	33.3	66.7	0.78	0.39	42.1	31.6	15.8	0.53	0.32	36.8	42.1	0.95	0.79
11734	Ekstraklasa 16/17	16/17	7918	Piast Gliwice	37	12	10	15	46	1.24	45	54	-9	1.22	1.46	9	24.3	8	5	5	4	5	10	0	0.00	45.00	1.22	0	0.00	0	0.00	319	8.62	153	4.14	0	0.00	0	0.00	150	4.05	\N	0	134	3.62	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	50.7	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	71	1.92	5	553	14.95	61	1.65	541	14.62	WWWWL	8	4	0	1	11	4	9	7	77.8	28	28	33.3	44.4	61.1	27.8	0.61	0.89	50.0	44.4	0.61	0.83	31.6	42.1	15.8	0.32	0.63	63.2	36.8	0.42	1.05
11734	Ekstraklasa 16/17	16/17	5064	MZKS Arka Gdynia	37	10	9	18	39	1.05	44	60	-16	1.19	1.62	9	24.3	6	5	8	4	4	10	0	0.00	44.00	1.19	0	0.00	0	0.00	318	8.59	155	4.19	0	0.00	0	0.00	177	4.78	\N	0	105	2.84	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	46.4	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	74	2.00	3	628	16.97	37	1.00	639	17.27	WDLLW	5	2	1	2	6	7	11	7	63.6	28	17	20.2	52.6	52.6	21.1	0.63	0.74	36.8	57.9	0.89	0.53	38.9	33.3	11.1	0.56	0.44	50.0	27.8	0.78	1.06
11734	Ekstraklasa 16/17	16/17	4901	Cracovia	37	8	15	14	39	1.05	45	52	-7	1.22	1.41	8	21.6	7	6	5	1	9	9	0	0.00	45.00	1.22	0	0.00	0	0.00	414	11.19	194	5.24	0	0.00	0	0.00	177	4.78	\N	0	104	2.81	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	53.6	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	69	1.86	1	549	14.84	38	1.03	602	16.27	LLWLD	7	1	1	3	3	7	10	6	60.0	29	32	36.8	44.4	61.1	16.7	0.72	0.83	61.1	50.0	0.44	0.56	42.1	36.8	15.8	0.47	0.42	47.4	42.1	0.79	1.00
11734	Ekstraklasa 16/17	16/17	3105	Ruch Chorzów	37	10	8	19	38	1.03	42	62	-20	1.14	1.68	7	18.9	5	4	9	5	4	10	0	0.00	42.00	1.14	0	0.00	0	0.00	277	7.49	137	3.70	0	0.00	0	0.00	179	4.84	\N	0	123	3.32	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	47.8	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	50	1.35	4	437	11.81	33	0.89	628	16.97	DDLLL	4	0	2	3	3	14	6	5	83.3	30	27	30.0	27.8	55.6	16.7	0.28	0.83	50.0	44.4	0.72	0.78	52.6	42.1	26.3	0.68	0.47	42.1	36.8	0.84	1.00
11734	Ekstraklasa 16/17	16/17	3125	Górnik Łęczna	37	9	10	18	37	1.00	47	63	-16	1.27	1.70	10	27.0	6	3	9	3	7	9	0	0.00	47.00	1.27	0	0.00	0	0.00	363	9.81	177	4.78	0	0.00	0	0.00	169	4.57	\N	0	146	3.95	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	46.4	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	68	1.84	6	517	13.97	50	1.35	623	16.84	DLLWL	7	1	1	3	7	8	8	4	50.0	27	29	35.8	38.9	50.0	22.2	0.50	0.83	55.6	61.1	0.78	0.67	36.8	52.6	21.1	0.47	0.74	52.6	36.8	0.84	1.11
10361	Ekstraklasa 15/16	15/16	3106	Legia Warszawa	36	20	10	6	70	1.94	66	31	35	1.83	0.86	14	38.9	12	5	2	8	5	4	0	0.00	66.00	1.83	0	0.00	0	0.00	358	9.94	197	5.47	0	0.00	0	0.00	229	6.36	\N	0	111	3.08	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	54.6	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	66	1.83	2	478	13.28	108	3.00	587	16.31	WLWLW	9	3	0	2	11	4	17	14	82.4	22	25	37.9	63.2	73.7	42.1	1.00	1.11	78.9	63.2	0.26	0.37	58.8	35.3	23.5	0.94	0.59	47.1	58.8	0.65	0.47
10361	Ekstraklasa 15/16	15/16	7918	Piast Gliwice	35	19	9	7	66	1.89	59	43	16	1.69	1.23	13	37.1	13	3	2	6	6	5	0	0.00	59.00	1.69	0	0.00	0	0.00	345	9.86	174	4.97	0	0.00	0	0.00	194	5.54	\N	0	125	3.57	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	52.3	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	66	1.89	3	486	13.89	77	2.20	514	14.69	LWLWW	8	3	0	2	8	6	18	15	83.3	22	35	53.0	83.3	61.1	61.1	1.00	0.78	61.1	77.8	0.39	0.28	52.9	64.7	29.4	0.71	0.88	41.2	41.2	0.88	0.94
10361	Ekstraklasa 15/16	15/16	3113	Zagłębie Lubin	35	17	8	10	59	1.69	54	39	15	1.54	1.11	11	31.4	9	3	5	8	5	5	0	0.00	54.00	1.54	0	0.00	0	0.00	344	9.83	168	4.80	0	0.00	0	0.00	185	5.29	\N	0	106	3.03	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	48.6	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	75	2.14	2	527	15.06	65	1.86	494	14.11	WWWWW	11	5	0	0	13	2	13	10	76.9	24	33	45.8	41.2	70.6	23.5	0.65	1.24	64.7	47.1	0.47	0.76	50.0	38.9	22.2	0.67	0.56	66.7	55.6	0.33	0.67
10361	Ekstraklasa 15/16	15/16	4901	Cracovia	35	15	9	11	54	1.54	64	49	15	1.83	1.40	9	25.7	10	3	4	5	6	7	0	0.00	64.00	1.83	0	0.00	0	0.00	385	11.00	205	5.86	0	0.00	0	0.00	185	5.29	\N	0	96	2.74	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	53.0	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	72	2.06	1	442	12.63	45	1.29	578	16.51	WLWWL	7	3	0	2	7	7	13	10	76.9	26	39	50.0	70.6	47.1	23.5	1.35	0.88	64.7	47.1	0.41	0.65	55.6	61.1	27.8	0.67	0.78	33.3	44.4	0.83	0.89
10361	Ekstraklasa 15/16	15/16	7913	KS Lechia Gdańsk	35	14	10	11	52	1.49	52	41	11	1.49	1.17	11	31.4	11	4	2	3	6	9	0	0.00	52.00	1.49	0	0.00	0	0.00	339	9.69	176	5.03	0	0.00	0	0.00	169	4.83	\N	0	73	2.09	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	54.4	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	75	2.14	3	454	12.97	64	1.83	667	19.06	LWWDL	9	2	1	2	4	6	10	9	90.0	24	30	41.7	70.6	52.9	35.3	1.00	1.00	70.6	64.7	0.29	0.41	33.3	44.4	16.7	0.33	0.67	50.0	38.9	0.72	0.89
10361	Ekstraklasa 15/16	15/16	3117	Pogoń Szczecin	36	11	17	8	50	1.39	41	42	-1	1.14	1.17	11	30.6	7	9	3	4	8	5	0	0.00	41.00	1.14	0	0.00	0	0.00	303	8.42	140	3.89	0	0.00	0	0.00	174	4.83	\N	0	119	3.31	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	47.6	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	60	1.67	1	592	16.44	60	1.67	556	15.44	LWLLW	7	2	0	3	6	10	8	6	75.0	25	32	42.7	26.3	73.7	21.1	0.32	1.00	63.2	52.6	0.42	0.68	47.1	23.5	5.9	0.71	0.24	58.8	58.8	0.47	0.76
10361	Ekstraklasa 15/16	15/16	3111	Wisła Kraków	35	12	13	10	49	1.40	59	43	16	1.69	1.23	7	20.0	5	9	4	7	4	6	0	0.00	59.00	1.69	0	0.00	0	0.00	372	10.63	183	5.23	0	0.00	0	0.00	180	5.14	\N	0	114	3.26	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	54.5	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	72	2.06	1	477	13.63	43	1.23	519	14.83	WDWLD	4	2	2	1	10	9	15	8	53.3	28	30	35.7	55.6	44.4	27.8	0.89	0.56	66.7	50.0	0.39	0.72	52.9	52.9	35.3	0.71	1.24	41.2	35.3	0.71	0.65
10361	Ekstraklasa 15/16	15/16	3108	Śląsk Wrocław	36	12	12	12	48	1.33	40	42	-2	1.11	1.17	8	22.2	8	6	3	4	6	9	0	0.00	40.00	1.11	0	0.00	0	0.00	367	10.19	187	5.19	0	0.00	0	0.00	182	5.06	\N	0	137	3.81	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.4	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	88	2.44	2	560	15.56	64	1.78	524	14.56	WDWLW	10	3	1	1	9	7	11	7	63.6	28	41	48.8	41.2	47.1	23.5	0.53	0.71	58.8	64.7	0.47	0.35	42.1	52.6	21.1	0.47	0.53	57.9	36.8	0.68	0.79
10361	Ekstraklasa 15/16	15/16	3121	Lech Poznań	35	13	6	16	45	1.29	39	44	-5	1.11	1.26	11	31.4	6	5	5	7	1	11	0	0.00	39.00	1.11	0	0.00	0	0.00	369	10.54	187	5.34	0	0.00	0	0.00	192	5.49	\N	0	100	2.86	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	52.9	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	71	2.03	1	421	12.03	42	1.20	465	13.29	WLLDL	3	1	1	3	3	6	12	11	91.7	24	18	25.0	50.0	50.0	43.8	0.63	0.75	56.3	68.8	0.63	0.38	31.6	47.4	15.8	0.32	0.58	52.6	52.6	0.74	0.74
10361	Ekstraklasa 15/16	15/16	36851	Bruk-Bet Termalica Nieciecza	35	10	12	13	42	1.20	39	47	-8	1.11	1.34	10	28.6	5	6	7	5	6	6	0	0.00	39.00	1.11	0	0.00	0	0.00	314	8.97	152	4.34	0	0.00	0	0.00	157	4.49	\N	0	118	3.37	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.4	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	72	2.06	2	481	13.74	32	0.91	605	17.29	DWLLD	5	1	2	2	5	7	6	6	100.0	25	24	32.0	38.9	55.6	27.8	0.56	0.67	66.7	44.4	0.50	0.72	29.4	58.8	17.6	0.35	0.65	58.8	41.2	0.53	0.94
10361	Ekstraklasa 15/16	15/16	7691	Jagiellonia Białystok	35	12	6	17	42	1.20	42	59	-17	1.20	1.69	9	25.7	7	4	7	5	2	10	0	0.00	42.00	1.20	0	0.00	0	0.00	359	10.26	182	5.20	0	0.00	0	0.00	194	5.54	\N	0	83	2.37	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	45.0	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	60	1.71	4	475	13.57	57	1.63	491	14.03	WLLWD	5	2	1	2	6	5	10	8	80.0	26	24	30.8	50.0	38.9	22.2	0.56	0.50	55.6	44.4	0.50	0.89	47.1	52.9	23.5	0.59	0.76	41.2	35.3	1.06	0.94
10361	Ekstraklasa 15/16	15/16	5065	MKS Korona Kielce	35	8	15	12	39	1.11	34	43	-9	0.97	1.23	10	28.6	3	7	8	5	8	4	0	0.00	34.00	0.97	0	0.00	0	0.00	343	9.80	155	4.43	0	0.00	0	0.00	160	4.57	\N	0	127	3.63	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	46.2	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	63	1.80	1	535	15.29	35	1.00	560	16.00	LDDWD	10	1	3	1	6	7	9	5	55.6	25	27	36.0	44.4	38.9	16.7	0.50	0.56	27.8	33.3	0.78	0.83	47.1	29.4	11.8	0.59	0.29	70.6	64.7	0.35	0.47
10361	Ekstraklasa 15/16	15/16	7919	Podbeskidzie Bielsko-Biała	36	9	11	16	38	1.06	44	62	-18	1.22	1.72	8	22.2	3	8	8	6	3	8	0	0.00	44.00	1.22	0	0.00	0	0.00	339	9.42	158	4.39	0	0.00	0	0.00	165	4.58	\N	0	168	4.67	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	48.2	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	77	2.14	6	488	13.56	62	1.72	532	14.78	LLDLL	2	0	1	4	8	15	7	3	42.9	28	19	22.6	42.1	52.6	21.1	0.47	0.79	47.4	36.8	0.68	0.89	35.3	64.7	29.4	0.41	0.76	47.1	52.9	0.76	1.12
10361	Ekstraklasa 15/16	15/16	3105	Ruch Chorzów	35	10	8	17	38	1.09	38	58	-20	1.09	1.66	9	25.7	5	3	8	5	5	9	0	0.00	38.00	1.09	0	0.00	0	0.00	296	8.46	149	4.26	0	0.00	0	0.00	170	4.86	\N	0	133	3.80	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	48.8	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	45	1.29	7	373	10.66	45	1.29	605	17.29	LLLLL	2	0	0	5	2	13	9	6	66.7	26	28	35.9	50.0	31.3	18.8	0.69	0.44	43.8	43.8	0.75	1.00	36.8	52.6	21.1	0.47	0.58	36.8	57.9	0.89	0.68
10361	Ekstraklasa 15/16	15/16	3125	Górnik Łęczna	36	9	9	18	36	1.00	38	53	-15	1.06	1.47	9	25.0	7	2	9	2	7	9	0	0.00	38.00	1.06	0	0.00	0	0.00	316	8.78	161	4.47	0	0.00	0	0.00	175	4.86	\N	0	103	2.86	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	46.1	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	82	2.28	6	503	13.97	78	2.17	504	14.00	LWDWD	7	2	2	1	10	5	8	8	100.0	27	36	44.4	50.0	38.9	27.8	0.78	0.56	38.9	50.0	0.94	0.61	33.3	44.4	16.7	0.33	0.44	44.4	61.1	0.78	0.61
10361	Ekstraklasa 15/16	15/16	3110	Górnik Zabrze	36	6	17	13	35	0.97	37	50	-13	1.03	1.39	8	22.2	4	9	5	2	8	8	0	0.00	37.00	1.03	0	0.00	0	0.00	328	9.11	139	3.86	0	0.00	0	0.00	192	5.33	\N	0	126	3.50	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.1	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	69	1.92	4	511	14.19	42	1.17	521	14.47	DDDWD	12	1	4	0	3	2	4	2	50.0	28	25	29.8	38.9	38.9	11.1	0.44	0.67	44.4	55.6	0.78	0.44	38.9	33.3	11.1	0.44	0.50	38.9	44.4	0.89	0.67
8206	Ekstraklasa 14/15	14/15	3121	Lech Poznań	37	19	13	5	70	1.89	67	33	34	1.81	0.89	13	35.1	12	5	2	7	8	3	0	0.00	67.00	1.81	0	0.00	0	0.00	451	12.19	231	6.24	0	0.00	0	0.00	186	5.03	\N	0	94	2.54	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	53.7	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	74	2.00	2	567	15.32	54	1.46	530	14.32	DWWWW	8	4	1	0	12	2	17	11	64.7	24	35	48.6	47.4	68.4	21.1	0.84	1.21	78.9	68.4	0.32	0.42	50.0	50.0	22.2	0.78	0.78	55.6	55.6	0.44	0.61
8206	Ekstraklasa 14/15	14/15	3106	Legia Warszawa	37	21	7	9	70	1.89	64	33	31	1.73	0.89	18	48.6	13	3	3	8	4	6	0	0.00	64.00	1.73	0	0.00	0	0.00	381	10.30	196	5.30	0	0.00	0	0.00	234	6.32	\N	0	105	2.84	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	56.6	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	70	1.89	4	461	12.46	77	2.08	641	17.32	WDWWW	13	4	1	0	5	0	11	11	100.0	19	18	31.6	36.8	94.7	36.8	0.47	1.42	63.2	73.7	0.42	0.42	44.4	61.1	27.8	0.72	0.83	61.1	77.8	0.67	0.28
8206	Ekstraklasa 14/15	14/15	7691	Jagiellonia Białystok	37	19	8	10	65	1.76	59	44	15	1.59	1.19	11	29.7	11	4	4	8	4	6	0	0.00	59.00	1.59	0	0.00	0	0.00	343	9.27	169	4.57	0	0.00	0	0.00	157	4.24	\N	0	159	4.30	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	46.0	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	59	1.59	3	473	12.78	48	1.30	574	15.51	WWWWL	10	4	0	1	12	7	16	13	81.3	26	35	44.9	57.9	57.9	31.6	0.95	0.89	63.2	42.1	0.42	0.84	38.9	50.0	27.8	0.50	0.83	83.3	38.9	0.28	0.83
8206	Ekstraklasa 14/15	14/15	3108	Śląsk Wrocław	37	15	13	9	58	1.57	50	43	7	1.35	1.16	11	29.7	11	6	2	4	7	7	0	0.00	50.00	1.35	0	0.00	0	0.00	396	10.70	192	5.19	0	0.00	0	0.00	219	5.92	\N	0	101	2.73	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	51.2	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	62	1.68	3	518	14.00	64	1.73	592	16.00	WWWDL	7	3	1	1	5	5	7	6	85.7	26	37	47.4	36.8	68.4	21.1	0.42	0.95	68.4	73.7	0.37	0.26	38.9	61.1	27.8	0.50	0.83	55.6	27.8	0.72	1.00
8206	Ekstraklasa 14/15	14/15	4901	Cracovia	37	15	9	13	54	1.46	50	44	6	1.35	1.19	10	27.0	10	5	4	5	4	9	0	0.00	50.00	1.35	0	0.00	0	0.00	388	10.49	191	5.16	0	0.00	0	0.00	213	5.76	\N	0	97	2.62	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.7	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	74	2.00	2	501	13.54	66	1.78	502	13.57	WWWDW	8	4	1	0	11	2	11	8	72.7	27	32	39.5	47.4	63.2	21.1	0.53	0.89	57.9	47.4	0.42	0.63	38.9	50.0	16.7	0.50	0.78	61.1	44.4	0.67	0.67
8206	Ekstraklasa 14/15	14/15	3111	Wisła Kraków	37	12	13	12	49	1.32	56	48	8	1.51	1.30	7	18.9	7	6	5	5	7	7	0	0.00	56.00	1.51	0	0.00	0	0.00	363	9.81	172	4.65	0	0.00	0	0.00	169	4.57	\N	0	95	2.57	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	52.5	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	76	2.05	5	556	15.03	64	1.73	581	15.70	DLLLD	4	0	2	3	3	6	12	8	66.7	30	35	38.9	55.6	55.6	33.3	0.56	0.89	61.1	44.4	0.39	0.83	52.6	52.6	36.8	0.63	0.95	57.9	36.8	0.53	0.84
8206	Ekstraklasa 14/15	14/15	7913	KS Lechia Gdańsk	37	13	10	14	49	1.32	45	47	-2	1.22	1.27	12	32.4	8	5	5	5	5	9	0	0.00	45.00	1.22	0	0.00	0	0.00	419	11.32	196	5.30	0	0.00	0	0.00	190	5.14	\N	0	86	2.32	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	53.7	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	63	1.70	6	504	13.62	52	1.41	673	18.19	LDLLW	2	1	1	3	4	7	11	6	54.5	25	25	33.3	44.4	55.6	16.7	0.50	0.67	66.7	66.7	0.50	0.50	42.1	52.6	21.1	0.47	0.79	42.1	52.6	0.74	0.79
8206	Ekstraklasa 14/15	14/15	5065	MKS Korona Kielce	37	12	11	14	47	1.27	44	55	-11	1.19	1.49	6	16.2	8	6	5	4	5	9	0	0.00	44.00	1.19	0	0.00	0	0.00	313	8.46	142	3.84	0	0.00	0	0.00	188	5.08	\N	0	113	3.05	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	48.5	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	77	2.08	4	547	14.78	54	1.46	522	14.11	WDWDL	13	2	2	1	9	8	8	5	62.5	31	38	40.9	52.6	63.2	42.1	0.74	0.74	36.8	52.6	0.89	0.58	22.2	44.4	5.6	0.33	0.56	50.0	33.3	0.67	0.83
8206	Ekstraklasa 14/15	14/15	3110	Górnik Zabrze	37	12	11	14	47	1.27	50	60	-10	1.35	1.62	8	21.6	6	7	5	6	4	9	0	0.00	50.00	1.35	0	0.00	0	0.00	305	8.24	141	3.81	0	0.00	0	0.00	165	4.46	\N	0	101	2.73	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.8	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	67	1.81	4	482	13.03	47	1.27	563	15.22	LLLDL	5	0	1	4	4	13	9	6	66.7	29	23	26.4	61.1	61.1	38.9	0.72	0.83	50.0	38.9	0.72	1.06	47.4	57.9	36.8	0.47	0.68	31.6	47.4	0.79	0.68
8206	Ekstraklasa 14/15	14/15	7918	Piast Gliwice	37	13	8	16	47	1.27	50	56	-6	1.35	1.51	9	24.3	10	3	6	3	5	10	0	0.00	50.00	1.35	0	0.00	0	0.00	322	8.70	144	3.89	0	0.00	0	0.00	176	4.76	\N	0	145	3.92	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	46.7	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	51	1.38	1	506	13.68	60	1.62	506	13.68	LDLWW	10	2	1	2	9	9	8	5	62.5	28	33	39.3	42.1	63.2	31.6	0.63	1.26	57.9	42.1	0.42	0.95	22.2	44.4	16.7	0.28	0.50	55.6	33.3	0.61	1.06
8206	Ekstraklasa 14/15	14/15	3105	Ruch Chorzów	37	12	10	15	46	1.24	44	46	-2	1.19	1.24	12	32.4	7	4	7	5	6	8	0	0.00	44.00	1.19	0	0.00	0	0.00	273	7.38	132	3.57	0	0.00	0	0.00	144	3.89	\N	0	122	3.30	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	48.2	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	65	1.76	2	393	10.62	51	1.38	523	14.14	WLWLW	6	3	0	2	8	7	9	7	77.8	25	31	41.3	44.4	50.0	16.7	0.72	0.72	44.4	61.1	0.61	0.56	36.8	47.4	21.1	0.37	0.58	52.6	47.4	0.53	0.79
8206	Ekstraklasa 14/15	14/15	7919	Podbeskidzie Bielsko-Biała	37	12	10	15	46	1.24	47	60	-13	1.27	1.62	8	21.6	7	6	6	5	4	9	0	0.00	47.00	1.27	0	0.00	0	0.00	361	9.76	174	4.70	0	0.00	0	0.00	189	5.11	\N	0	114	3.08	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	46.5	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	71	1.92	6	549	14.84	51	1.38	652	17.62	LWLLL	5	1	0	4	3	10	7	5	71.4	29	22	25.3	36.8	63.2	21.1	0.47	0.84	57.9	42.1	0.53	1.00	44.4	50.0	27.8	0.50	0.72	38.9	44.4	0.89	0.83
8206	Ekstraklasa 14/15	14/15	3125	Górnik Łęczna	37	11	11	15	44	1.19	39	46	-7	1.05	1.24	8	21.6	7	7	4	4	4	11	0	0.00	39.00	1.05	0	0.00	0	0.00	346	9.35	162	4.38	0	0.00	0	0.00	172	4.65	\N	0	112	3.03	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	47.9	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	66	1.78	5	506	13.68	83	2.24	457	12.35	WLLDW	8	2	1	2	5	4	9	8	88.9	29	25	28.7	61.1	22.2	11.1	0.89	0.50	55.6	50.0	0.50	0.50	21.1	36.8	10.5	0.26	0.47	63.2	26.3	0.37	1.11
8206	Ekstraklasa 14/15	14/15	3117	Pogoń Szczecin	37	11	9	17	42	1.14	45	52	-7	1.22	1.41	7	18.9	8	3	7	3	6	10	0	0.00	45.00	1.22	0	0.00	0	0.00	328	8.86	140	3.78	0	0.00	0	0.00	147	3.97	\N	0	137	3.70	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.4	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	71	1.92	3	586	15.84	60	1.62	592	16.00	LLLLD	5	0	1	4	4	9	12	6	50.0	30	38	42.2	44.4	50.0	22.2	0.56	0.89	66.7	44.4	0.44	0.67	57.9	31.6	15.8	0.58	0.42	42.1	36.8	0.74	0.95
8206	Ekstraklasa 14/15	14/15	35329	Zawisza Bydgoszcz	37	10	8	19	38	1.03	45	63	-18	1.22	1.70	8	21.6	6	4	8	4	4	11	0	0.00	45.00	1.22	0	0.00	0	0.00	329	8.89	166	4.49	0	0.00	0	0.00	163	4.41	\N	0	102	2.76	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	50.8	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	66	1.78	6	515	13.92	45	1.22	593	16.03	LDWDL	1	1	2	2	8	8	9	7	77.8	29	26	29.9	38.9	38.9	5.6	0.50	0.61	66.7	44.4	0.39	0.94	47.4	42.1	21.1	0.74	0.58	47.4	31.6	0.84	1.21
8206	Ekstraklasa 14/15	14/15	3128	GKS Bełchatów	37	9	9	19	36	0.97	35	60	-25	0.95	1.62	9	24.3	5	6	7	4	3	12	0	0.00	35.00	0.95	0	0.00	0	0.00	288	7.78	130	3.51	0	0.00	0	0.00	157	4.24	\N	0	134	3.62	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	48.4	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	74	2.00	4	557	15.05	46	1.24	642	17.35	LDLWL	2	1	1	3	10	15	12	8	66.7	28	20	23.8	38.9	44.4	11.1	0.50	0.50	50.0	50.0	0.78	0.56	47.4	26.3	10.5	0.47	0.42	57.9	42.1	0.53	1.37
6261	Ekstraklasa 13/14	13/14	3106	Legia Warszawa	36	26	3	7	81	2.25	75	31	44	2.08	0.86	15	41.7	15	1	2	11	2	5	0	0.00	75.00	2.08	0	0.00	0	0.00	330	9.17	184	5.11	0	0.00	0	0.00	176	4.89	\N	0	75	2.08	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	58.1	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	45	1.25	3	390	10.83	58	1.61	505	14.03	WWLWW	9	4	0	1	12	4	16	15	93.8	21	31	49.2	66.7	83.3	55.6	1.00	1.50	66.7	77.8	0.33	0.28	50.0	66.7	33.3	0.72	0.94	66.7	44.4	0.39	0.72
6261	Ekstraklasa 13/14	13/14	3121	Lech Poznań	37	19	9	9	66	1.78	68	40	28	1.84	1.08	11	29.7	14	4	1	5	5	8	0	0.00	68.00	1.84	0	0.00	0	0.00	309	8.35	149	4.03	0	0.00	0	0.00	160	4.32	\N	0	60	1.62	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	55.0	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	58	1.57	4	419	11.32	44	1.19	336	9.08	LWDLW	6	2	1	2	7	5	17	13	76.5	26	37	47.4	68.4	78.9	52.6	1.00	1.32	68.4	57.9	0.32	0.47	50.0	38.9	33.3	0.72	0.61	55.6	50.0	0.78	0.61
6261	Ekstraklasa 13/14	13/14	3105	Ruch Chorzów	37	16	11	10	59	1.59	47	48	-1	1.27	1.30	11	29.7	8	8	3	8	3	7	0	0.00	47.00	1.27	0	0.00	0	0.00	232	6.27	104	2.81	0	0.00	0	0.00	130	3.51	\N	0	67	1.81	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	51.5	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	30	0.81	1	338	9.14	31	0.84	428	11.57	DLWDW	4	2	2	1	7	8	9	8	88.9	26	25	32.1	36.8	52.6	15.8	0.47	0.74	52.6	57.9	0.53	0.42	50.0	61.1	44.4	0.61	0.72	50.0	50.0	0.67	1.00
6261	Ekstraklasa 13/14	13/14	3111	Wisła Kraków	37	14	11	12	53	1.43	51	46	5	1.38	1.24	15	40.5	12	2	4	2	9	8	0	0.00	51.00	1.38	0	0.00	0	0.00	209	5.65	101	2.73	0	0.00	0	0.00	125	3.38	\N	0	104	2.81	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.2	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	65	1.76	3	388	10.49	69	1.86	377	10.19	WDLDL	10	1	2	2	8	13	15	9	60.0	22	29	43.9	55.6	55.6	33.3	0.94	0.83	83.3	66.7	0.17	0.39	42.1	42.1	21.1	0.47	0.53	63.2	36.8	0.68	1.21
6261	Ekstraklasa 13/14	13/14	7913	KS Lechia Gdańsk	37	13	13	11	52	1.41	46	41	5	1.24	1.11	14	37.8	7	7	4	6	6	7	0	0.00	46.00	1.24	0	0.00	0	0.00	289	7.81	126	3.41	0	0.00	0	0.00	136	3.68	\N	0	92	2.49	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	47.5	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	53	1.43	4	350	9.46	40	1.08	421	11.38	WDDWW	8	3	2	0	8	3	9	8	88.9	23	23	33.3	50.0	61.1	27.8	0.61	0.94	50.0	55.6	0.56	0.67	36.8	36.8	10.5	0.42	0.53	78.9	52.6	0.26	0.74
6261	Ekstraklasa 13/14	13/14	3110	Górnik Zabrze	37	14	10	13	52	1.41	53	57	-4	1.43	1.54	8	21.6	8	5	5	6	5	8	0	0.00	53.00	1.43	0	0.00	0	0.00	247	6.68	115	3.11	0	0.00	0	0.00	137	3.70	\N	0	111	3.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	50.1	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	49	1.32	4	339	9.16	39	1.05	414	11.19	LWWLL	4	2	0	3	7	9	13	8	61.5	29	38	43.7	55.6	44.4	33.3	0.78	0.78	50.0	27.8	0.61	0.94	57.9	42.1	21.1	0.68	0.63	57.9	42.1	0.63	0.89
6261	Ekstraklasa 13/14	13/14	3108	Śląsk Wrocław	37	12	15	10	51	1.38	49	41	8	1.32	1.11	15	40.5	8	7	4	4	8	6	0	0.00	49.00	1.32	0	0.00	0	0.00	262	7.08	120	3.24	0	0.00	0	0.00	144	3.89	\N	0	72	1.95	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	54.1	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	50	1.35	2	345	9.32	47	1.27	416	11.24	WWWDW	8	4	1	0	10	1	10	7	70.0	22	24	36.4	26.3	63.2	10.5	0.37	0.89	89.5	52.6	0.21	0.63	44.4	44.4	16.7	0.67	0.72	50.0	44.4	0.61	0.78
6261	Ekstraklasa 13/14	13/14	3117	Pogoń Szczecin	37	11	17	9	50	1.35	50	50	0	1.35	1.35	9	24.3	6	8	5	5	9	4	0	0.00	50.00	1.35	0	0.00	0	0.00	246	6.65	121	3.27	0	0.00	0	0.00	163	4.41	\N	0	75	2.03	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.3	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	62	1.68	5	404	10.92	60	1.62	396	10.70	DLDLL	9	0	2	3	1	5	12	8	66.7	28	38	45.2	52.6	31.6	10.5	1.00	0.47	52.6	52.6	0.53	0.79	44.4	50.0	16.7	0.56	0.67	50.0	50.0	0.72	0.67
6261	Ekstraklasa 13/14	13/14	35329	Zawisza Bydgoszcz	37	12	10	15	46	1.24	48	48	0	1.30	1.30	9	24.3	8	4	6	4	6	9	0	0.00	48.00	1.30	0	0.00	0	0.00	253	6.84	131	3.54	0	0.00	0	0.00	133	3.59	\N	0	88	2.38	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	48.6	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	46	1.24	6	386	10.43	40	1.08	464	12.54	LLDWL	2	1	1	3	4	7	3	2	66.7	28	32	38.1	27.8	66.7	27.8	0.39	1.17	50.0	66.7	0.56	0.50	36.8	52.6	10.5	0.37	0.68	47.4	47.4	0.63	0.89
6261	Ekstraklasa 13/14	13/14	7919	Podbeskidzie Bielsko-Biała	37	10	15	12	45	1.22	39	45	-6	1.05	1.22	16	43.2	7	8	3	3	7	9	0	0.00	39.00	1.05	0	0.00	0	0.00	220	5.95	108	2.92	0	0.00	0	0.00	143	3.86	\N	0	92	2.49	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	44.3	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	56	1.51	1	380	10.27	37	1.00	411	11.11	DWWDL	12	2	2	1	9	5	4	3	75.0	21	24	38.1	16.7	55.6	16.7	0.17	0.83	77.8	77.8	0.33	0.22	31.6	63.2	21.1	0.32	0.79	47.4	36.8	0.63	1.21
6261	Ekstraklasa 13/14	13/14	7918	Piast Gliwice	37	11	12	14	45	1.22	43	56	-13	1.16	1.51	11	29.7	5	9	4	6	3	10	0	0.00	43.00	1.16	0	0.00	0	0.00	223	6.03	101	2.73	0	0.00	0	0.00	118	3.19	\N	0	97	2.62	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	43.0	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	43	1.16	2	409	11.05	38	1.03	362	9.78	DLWWW	5	3	1	1	11	5	8	5	62.5	26	18	23.1	38.9	44.4	16.7	0.50	0.61	66.7	44.4	0.33	0.61	31.6	63.2	26.3	0.37	0.84	47.4	36.8	0.89	1.16
6261	Ekstraklasa 13/14	13/14	7691	Jagiellonia Białystok	36	11	12	13	45	1.25	56	58	-2	1.56	1.61	7	19.4	8	5	6	3	7	7	0	0.00	56.00	1.56	0	0.00	0	0.00	243	6.75	123	3.42	0	0.00	0	0.00	128	3.56	\N	0	85	2.36	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	49.9	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	48	1.33	5	358	9.94	30	0.83	485	13.47	DDLDW	10	1	3	1	8	10	10	9	90.0	29	37	42.5	52.6	73.7	42.1	0.84	1.11	47.4	42.1	0.68	0.79	41.2	58.8	17.6	0.47	0.65	52.9	41.2	0.76	1.00
6261	Ekstraklasa 13/14	13/14	4901	Cracovia	37	12	8	17	44	1.19	43	56	-13	1.16	1.51	7	18.9	6	4	9	6	4	8	0	0.00	43.00	1.16	0	0.00	0	0.00	248	6.70	112	3.03	0	0.00	0	0.00	98	2.65	\N	0	91	2.46	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	60.5	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	44	1.19	3	284	7.68	42	1.14	322	8.70	DLDWL	2	1	2	2	6	10	8	4	50.0	30	30	33.3	36.8	52.6	15.8	0.42	0.79	42.1	42.1	0.74	0.89	38.9	55.6	22.2	0.44	0.67	61.1	33.3	0.50	0.89
6261	Ekstraklasa 13/14	13/14	5065	MKS Korona Kielce	37	10	14	13	44	1.19	47	56	-9	1.27	1.51	8	21.6	8	6	5	2	8	8	0	0.00	47.00	1.27	0	0.00	0	0.00	256	6.92	131	3.54	0	0.00	0	0.00	133	3.59	\N	0	101	2.73	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	48.0	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	61	1.65	9	434	11.73	58	1.57	364	9.84	LDDLW	11	1	2	2	9	13	4	1	25.0	29	36	41.4	42.1	63.2	15.8	0.53	1.11	52.6	47.4	0.68	0.95	22.2	38.9	5.6	0.28	0.61	55.6	38.9	0.67	0.72
6261	Ekstraklasa 13/14	13/14	3115	Widzew Łódź	37	7	10	20	31	0.84	36	59	-23	0.97	1.59	4	10.8	7	7	4	0	3	16	0	0.00	36.00	0.97	0	0.00	0	0.00	200	5.41	85	2.30	0	0.00	0	0.00	97	2.62	\N	0	80	2.16	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	43.6	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	42	1.14	6	307	8.30	18	0.49	359	9.70	DWLDL	6	1	2	2	6	6	8	5	62.5	33	28	28.3	50.0	61.1	38.9	0.56	0.72	61.1	38.9	0.50	0.61	21.1	36.8	10.5	0.32	0.37	36.8	10.5	0.84	1.21
6261	Ekstraklasa 13/14	13/14	3113	Zagłębie Lubin	37	7	10	20	31	0.84	32	51	-19	0.86	1.38	7	18.9	6	5	7	1	5	13	0	0.00	32.00	0.86	0	0.00	0	0.00	285	7.70	125	3.38	0	0.00	0	0.00	120	3.24	\N	0	83	2.24	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	46.0	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	51	1.38	4	319	8.62	36	0.97	379	10.24	DLLLL	1	0	1	4	1	10	10	5	50.0	30	28	31.1	44.4	50.0	22.2	0.56	0.78	61.1	33.3	0.61	0.83	31.6	10.5	5.3	0.32	0.11	57.9	42.1	0.47	0.84
4634	Ekstraklasa 12/13	12/13	3106	Legia Warszawa	30	20	7	3	67	2.23	59	22	37	1.97	0.73	14	46.7	12	2	1	8	5	2	0	0.00	59.00	1.97	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WDDWW	13	3	2	0	10	1	13	12	92.3	16	27	56.3	53.3	80.0	40.0	0.87	1.33	60.0	93.3	0.47	0.07	60.0	66.7	46.7	0.87	0.87	80.0	40.0	0.20	0.73
4634	Ekstraklasa 12/13	12/13	3121	Lech Poznań	30	19	4	7	61	2.03	46	22	24	1.53	0.73	17	56.7	7	3	5	12	1	2	0	0.00	46.00	1.53	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WDLLW	10	2	1	2	7	4	12	11	91.7	13	16	41.0	40.0	46.7	26.7	0.73	0.87	53.3	80.0	0.67	0.33	60.0	60.0	33.3	0.67	0.80	80.0	73.3	0.20	0.27
4634	Ekstraklasa 12/13	12/13	3108	Śląsk Wrocław	30	13	8	9	47	1.57	44	42	2	1.47	1.40	8	26.7	9	4	2	4	4	7	0	0.00	44.00	1.47	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LDWWL	4	2	1	2	9	9	8	3	37.5	22	27	40.9	40.0	80.0	26.7	0.60	0.93	53.3	66.7	0.53	0.47	40.0	46.7	13.3	0.47	0.93	66.7	20.0	0.53	1.27
4634	Ekstraklasa 12/13	12/13	7918	Piast Gliwice	30	13	7	10	46	1.53	41	41	0	1.37	1.37	7	23.3	5	5	5	8	2	5	0	0.00	41.00	1.37	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LDDWW	8	2	2	1	9	8	8	5	62.5	23	20	29.0	40.0	53.3	6.7	0.40	0.80	60.0	46.7	0.40	0.87	40.0	66.7	26.7	0.53	1.00	33.3	60.0	0.67	0.80
4634	Ekstraklasa 12/13	12/13	3110	Górnik Zabrze	30	12	7	11	43	1.43	35	31	4	1.17	1.03	9	30.0	7	2	6	5	5	5	0	0.00	35.00	1.17	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WLLLW	4	2	0	3	4	7	13	10	76.9	21	25	39.7	46.7	40.0	26.7	0.67	0.60	60.0	60.0	0.47	0.53	46.7	33.3	20.0	0.53	0.53	66.7	40.0	0.33	0.73
4634	Ekstraklasa 12/13	12/13	3119	Polonia Warszawa	30	11	9	10	42	1.40	45	34	11	1.50	1.13	7	23.3	5	5	5	6	4	5	0	0.00	45.00	1.50	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LDDWW	7	2	2	1	8	5	8	7	87.5	23	25	36.2	33.3	66.7	13.3	0.40	0.93	60.0	40.0	0.47	0.67	66.7	53.3	33.3	0.93	0.73	60.0	46.7	0.40	0.73
4634	Ekstraklasa 12/13	12/13	3113	Zagłębie Lubin	30	11	7	12	40	1.33	38	37	1	1.27	1.23	10	33.3	7	2	6	4	5	6	0	0.00	38.00	1.27	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WLDLL	3	1	1	3	4	8	9	6	66.7	20	27	45.0	53.3	66.7	46.7	0.73	0.87	53.3	60.0	0.67	0.53	46.7	40.0	20.0	0.53	0.40	60.0	46.7	0.53	0.73
4634	Ekstraklasa 12/13	12/13	3111	Wisła Kraków	30	10	8	12	38	1.27	28	35	-7	0.93	1.17	10	33.3	6	3	6	4	5	6	0	0.00	28.00	0.93	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LWDLW	5	2	1	2	5	5	7	5	71.4	20	21	35.0	40.0	53.3	20.0	0.40	0.60	60.0	73.3	0.53	0.40	40.0	26.7	6.7	0.47	0.40	33.3	53.3	0.93	0.47
4634	Ekstraklasa 12/13	12/13	7913	KS Lechia Gdańsk	30	10	8	12	38	1.27	42	43	-1	1.40	1.43	8	26.7	3	5	7	7	3	5	0	0.00	42.00	1.40	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LWDWD	3	2	2	1	10	8	11	7	63.6	22	21	31.8	66.7	66.7	46.7	0.73	0.80	53.3	26.7	0.53	1.27	26.7	60.0	13.3	0.40	0.87	73.3	53.3	0.47	0.60
4634	Ekstraklasa 12/13	12/13	7691	Jagiellonia Białystok	30	8	13	9	37	1.23	31	45	-14	1.03	1.50	7	23.3	4	6	5	4	7	4	0	0.00	31.00	1.03	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WDLLL	8	1	1	3	2	12	9	6	66.7	23	29	42.0	33.3	33.3	13.3	0.40	0.47	53.3	60.0	0.53	0.73	46.7	46.7	20.0	0.53	0.67	46.7	26.7	0.80	0.93
4634	Ekstraklasa 12/13	12/13	5065	MKS Korona Kielce	30	9	9	12	36	1.20	32	37	-5	1.07	1.23	7	23.3	9	4	2	0	5	10	0	0.00	32.00	1.07	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LDDWL	6	1	2	2	6	6	6	5	83.3	23	26	37.7	40.0	73.3	33.3	0.53	1.07	66.7	66.7	0.33	0.33	26.7	20.0	0.0	0.27	0.27	26.7	53.3	1.00	0.80
4634	Ekstraklasa 12/13	12/13	3117	Pogoń Szczecin	30	10	5	15	35	1.17	29	39	-10	0.97	1.30	7	23.3	7	2	6	3	3	9	0	0.00	29.00	0.97	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WLWWL	8	3	0	2	8	6	10	8	80.0	23	20	29.0	46.7	40.0	26.7	0.53	0.60	66.7	46.7	0.40	0.73	33.3	26.7	6.7	0.40	0.40	53.3	46.7	0.60	0.87
4634	Ekstraklasa 12/13	12/13	3115	Widzew Łódź	30	8	9	13	33	1.10	30	41	-11	1.00	1.37	8	26.7	6	4	5	2	5	8	0	0.00	30.00	1.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LDDLL	5	0	2	3	3	9	9	6	66.7	22	21	31.8	60.0	46.7	20.0	0.60	0.67	66.7	53.3	0.40	0.67	26.7	40.0	13.3	0.27	0.47	60.0	26.7	0.53	1.13
4634	Ekstraklasa 12/13	12/13	7919	Podbeskidzie Bielsko-Biała	30	8	8	14	32	1.07	39	43	-4	1.30	1.43	4	13.3	2	6	7	6	2	7	0	0.00	39.00	1.30	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WWWLL	6	3	0	2	8	6	11	6	54.5	26	17	21.8	40.0	66.7	13.3	0.53	0.87	40.0	40.0	0.60	1.00	46.7	53.3	20.0	0.53	0.67	80.0	26.7	0.27	1.00
4634	Ekstraklasa 12/13	12/13	3105	Ruch Chorzów	30	8	7	15	31	1.03	35	48	-13	1.17	1.60	4	13.3	4	5	6	4	2	9	0	0.00	35.00	1.17	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LDDLD	7	0	3	2	7	9	3	2	66.7	26	24	30.8	20.0	60.0	6.7	0.20	0.93	60.0	40.0	0.53	0.87	26.7	40.0	13.3	0.27	0.93	13.3	46.7	1.13	0.67
4634	Ekstraklasa 12/13	12/13	3128	GKS Bełchatów	30	7	10	13	31	1.03	24	38	-14	0.80	1.27	8	26.7	4	5	6	3	5	7	0	0.00	24.00	0.80	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WDDWW	8	3	2	0	9	6	8	3	37.5	22	22	33.3	33.3	33.3	13.3	0.47	0.33	60.0	40.0	0.60	0.80	40.0	26.7	6.7	0.47	0.33	80.0	33.3	0.20	0.93
3411	Ekstraklasa 11/12	11/12	3108	Śląsk Wrocław	30	17	5	8	56	1.87	47	31	16	1.57	1.03	11	36.7	9	2	4	8	3	4	0	0.00	47.00	1.57	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WWWDD	13	3	2	0	8	4	11	10	90.9	19	25	43.9	60.0	53.3	26.7	1.13	0.60	73.3	53.3	0.47	0.47	33.3	66.7	20.0	0.47	0.93	66.7	46.7	0.47	0.67
3411	Ekstraklasa 11/12	11/12	3105	Ruch Chorzów	30	16	7	7	55	1.83	44	28	16	1.47	0.93	10	33.3	9	3	3	7	4	4	0	0.00	44.00	1.47	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WWDWD	5	3	2	0	7	3	10	8	80.0	20	32	53.3	46.7	60.0	33.3	0.80	0.80	80.0	53.3	0.27	0.53	33.3	60.0	13.3	0.40	0.93	53.3	66.7	0.60	0.47
3411	Ekstraklasa 11/12	11/12	3106	Legia Warszawa	30	15	8	7	53	1.77	42	17	25	1.40	0.57	17	56.7	8	4	3	7	4	4	0	0.00	42.00	1.40	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WLDLD	7	1	2	2	3	4	13	11	84.6	13	11	28.2	40.0	73.3	33.3	0.40	1.07	80.0	80.0	0.33	0.20	53.3	33.3	26.7	0.87	0.47	66.7	80.0	0.33	0.27
3411	Ekstraklasa 11/12	11/12	3121	Lech Poznań	30	15	7	8	52	1.73	42	22	20	1.40	0.73	16	53.3	11	1	3	4	6	5	0	0.00	42.00	1.40	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	DWWWW	13	4	1	0	5	1	8	8	100.0	14	21	50.0	40.0	66.7	33.3	0.73	0.93	80.0	73.3	0.20	0.33	20.0	46.7	13.3	0.33	0.80	66.7	60.0	0.53	0.40
3411	Ekstraklasa 11/12	11/12	5065	MKS Korona Kielce	30	13	9	8	48	1.60	34	29	5	1.13	0.97	14	46.7	7	5	3	6	4	5	0	0.00	34.00	1.13	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LLWWL	4	2	0	3	4	5	12	9	75.0	16	12	25.0	60.0	6.7	0.0	1.07	0.20	73.3	73.3	0.40	0.47	40.0	33.3	13.3	0.60	0.40	66.7	60.0	0.53	0.53
3411	Ekstraklasa 11/12	11/12	3119	Polonia Warszawa	30	13	6	11	45	1.50	33	32	1	1.10	1.07	10	33.3	9	3	3	4	3	8	0	0.00	33.00	1.10	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	DLLLW	8	1	1	3	3	8	9	6	66.7	20	22	36.7	46.7	66.7	33.3	0.47	1.00	66.7	60.0	0.40	0.53	20.0	33.3	6.7	0.33	0.40	80.0	40.0	0.27	0.93
3411	Ekstraklasa 11/12	11/12	3111	Wisła Kraków	30	12	7	11	43	1.43	29	26	3	0.97	0.87	10	33.3	7	2	6	5	5	5	0	0.00	29.00	0.97	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LLWWW	8	3	0	2	7	6	6	6	100.0	20	29	48.3	26.7	33.3	13.3	0.33	0.60	93.3	46.7	0.07	0.67	26.7	46.7	13.3	0.33	0.67	46.7	53.3	0.53	0.47
3411	Ekstraklasa 11/12	11/12	3110	Górnik Zabrze	30	11	9	10	42	1.40	36	30	6	1.20	1.00	10	33.3	9	3	3	2	6	7	0	0.00	36.00	1.20	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LWWLD	9	2	1	2	7	4	11	7	63.6	20	25	41.7	46.7	66.7	33.3	0.60	0.93	86.7	60.0	0.20	0.47	26.7	53.3	6.7	0.33	0.53	60.0	33.3	0.53	0.80
3411	Ekstraklasa 11/12	11/12	3113	Zagłębie Lubin	30	11	7	12	40	1.33	36	42	-6	1.20	1.40	8	26.7	6	6	3	5	1	9	0	0.00	36.00	1.20	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WWLDW	5	3	1	1	10	4	7	6	85.7	22	16	24.2	40.0	73.3	33.3	0.40	0.80	60.0	40.0	0.53	0.80	33.3	53.3	13.3	0.33	0.87	46.7	46.7	0.73	0.73
3411	Ekstraklasa 11/12	11/12	7691	Jagiellonia Białystok	30	11	6	13	39	1.30	35	45	-10	1.17	1.50	6	20.0	10	2	3	1	4	10	0	0.00	35.00	1.17	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WLDWL	9	2	1	2	6	8	8	7	87.5	24	33	45.8	53.3	66.7	46.7	0.67	0.87	66.7	53.3	0.33	0.60	20.0	53.3	6.7	0.27	0.53	46.7	33.3	0.73	1.33
3411	Ekstraklasa 11/12	11/12	3115	Widzew Łódź	30	9	12	9	39	1.30	25	26	-1	0.83	0.87	13	43.3	5	6	4	4	6	5	0	0.00	25.00	0.83	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	DWLDD	5	1	3	1	3	2	6	6	100.0	17	15	29.4	40.0	33.3	13.3	0.47	0.47	66.7	60.0	0.33	0.40	26.7	26.7	0.0	0.47	0.27	80.0	46.7	0.27	0.73
3411	Ekstraklasa 11/12	11/12	7919	Podbeskidzie Bielsko-Biała	30	9	8	13	35	1.17	26	39	-13	0.87	1.30	10	33.3	4	6	5	5	2	8	0	0.00	26.00	0.87	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	DLLLD	1	0	2	3	3	9	5	4	80.0	20	10	16.7	6.7	60.0	0.0	0.07	0.73	60.0	73.3	0.53	0.40	40.0	33.3	13.3	0.53	0.40	53.3	53.3	0.80	0.87
3411	Ekstraklasa 11/12	11/12	3128	GKS Bełchatów	30	7	10	13	31	1.03	34	36	-2	1.13	1.20	7	23.3	6	5	4	1	5	9	0	0.00	34.00	1.13	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	DDLDW	10	1	3	1	6	6	6	4	66.7	23	22	31.9	53.3	60.0	40.0	0.80	0.87	73.3	53.3	0.40	0.80	13.3	40.0	0.0	0.13	0.47	60.0	40.0	0.47	0.73
3411	Ekstraklasa 11/12	11/12	7913	KS Lechia Gdańsk	30	7	10	13	31	1.03	21	30	-9	0.70	1.00	11	36.7	3	7	5	4	3	8	0	0.00	21.00	0.70	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LWWDL	4	2	1	2	5	5	7	5	71.4	19	15	26.3	33.3	13.3	0.0	0.40	0.20	66.7	73.3	0.60	0.27	33.3	33.3	6.7	0.40	0.40	66.7	40.0	0.40	0.73
3411	Ekstraklasa 11/12	11/12	3123	ŁKS Łódź	30	5	9	16	24	0.80	23	53	-30	0.77	1.77	7	23.3	1	6	8	4	3	8	0	0.00	23.00	0.77	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LDDLL	4	0	2	3	6	10	6	2	33.3	23	14	20.3	40.0	26.7	0.0	0.47	0.33	46.7	26.7	0.80	1.13	26.7	26.7	0.0	0.33	0.40	46.7	46.7	0.93	0.67
3411	Ekstraklasa 11/12	11/12	4901	Cracovia	30	4	10	16	22	0.73	20	41	-21	0.67	1.37	7	23.3	3	4	8	1	6	8	0	0.00	20.00	0.67	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	DLLDL	4	0	2	3	3	7	4	2	50.0	23	26	37.7	26.7	33.3	13.3	0.27	0.40	66.7	40.0	0.47	0.87	13.3	40.0	0.0	0.20	0.47	33.3	60.0	0.93	0.47
2737	Ekstraklasa 10/11	10/11	3111	Wisła Kraków	30	17	5	8	56	1.87	44	29	15	1.47	0.97	14	46.7	11	2	2	6	3	6	0	0.00	44.00	1.47	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LWLWW	8	3	0	2	5	4	12	10	83.3	16	23	47.9	60.0	66.7	46.7	0.60	1.20	73.3	66.7	0.33	0.40	46.7	53.3	26.7	0.53	0.60	66.7	53.3	0.47	0.73
2737	Ekstraklasa 10/11	10/11	3106	Legia Warszawa	30	15	4	11	49	1.63	45	38	7	1.50	1.27	10	33.3	10	1	4	5	3	7	0	0.00	45.00	1.50	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WWWDD	13	3	2	0	12	3	9	8	88.9	20	24	40.0	66.7	66.7	46.7	0.80	1.00	53.3	66.7	0.53	0.53	33.3	46.7	20.0	0.47	0.73	60.0	40.0	0.40	1.07
2737	Ekstraklasa 10/11	10/11	3108	Śląsk Wrocław	30	13	10	7	49	1.63	46	34	12	1.53	1.13	11	36.7	7	5	3	6	5	4	0	0.00	46.00	1.53	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WWLWW	8	4	0	1	13	6	6	4	66.7	19	27	47.4	40.0	60.0	33.3	0.47	1.33	86.7	46.7	0.20	0.67	53.3	53.3	26.7	0.73	0.53	46.7	66.7	0.80	0.60
2737	Ekstraklasa 10/11	10/11	7691	Jagiellonia Białystok	30	14	6	10	48	1.60	38	32	6	1.27	1.07	13	43.3	11	2	2	3	4	8	0	0.00	38.00	1.27	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WLWDL	6	2	1	2	6	6	7	6	85.7	17	18	35.3	33.3	86.7	26.7	0.60	1.33	66.7	86.7	0.47	0.27	20.0	33.3	13.3	0.20	0.40	60.0	46.7	0.67	0.73
2737	Ekstraklasa 10/11	10/11	3121	Lech Poznań	30	13	6	11	45	1.50	37	23	14	1.23	0.77	13	43.3	10	4	1	3	2	10	0	0.00	37.00	1.23	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WWLWL	7	3	0	2	8	4	9	7	77.8	17	9	17.6	46.7	53.3	20.0	0.60	1.20	86.7	80.0	0.20	0.20	26.7	26.7	13.3	0.27	0.40	73.3	26.7	0.27	0.87
2737	Ekstraklasa 10/11	10/11	3110	Górnik Zabrze	30	13	6	11	45	1.50	36	40	-4	1.20	1.33	9	30.0	9	4	2	4	2	9	0	0.00	36.00	1.20	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WLWWD	7	3	1	1	10	4	10	9	90.0	21	17	27.0	53.3	66.7	40.0	0.67	0.93	80.0	53.3	0.20	0.47	33.3	33.3	20.0	0.40	0.40	46.7	20.0	0.67	1.33
2737	Ekstraklasa 10/11	10/11	3119	Polonia Warszawa	30	12	8	10	44	1.47	41	26	15	1.37	0.87	14	46.7	7	3	5	5	5	5	0	0.00	41.00	1.37	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WDWDW	8	3	2	0	7	0	8	7	87.5	16	18	37.5	26.7	53.3	13.3	0.47	1.00	60.0	73.3	0.47	0.33	40.0	40.0	20.0	0.73	0.53	60.0	66.7	0.53	0.40
2737	Ekstraklasa 10/11	10/11	7913	KS Lechia Gdańsk	30	12	7	11	43	1.43	37	36	1	1.23	1.20	10	33.3	8	3	4	4	4	7	0	0.00	37.00	1.23	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LLWDW	5	2	1	2	6	6	5	4	80.0	20	25	41.7	40.0	46.7	20.0	0.47	0.87	66.7	66.7	0.40	0.40	13.3	60.0	13.3	0.13	1.00	53.3	33.3	0.47	1.13
2737	Ekstraklasa 10/11	10/11	3115	Widzew Łódź	30	11	10	9	43	1.43	41	34	7	1.37	1.13	6	20.0	7	6	2	4	4	7	0	0.00	41.00	1.37	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LWWWD	7	3	1	1	6	7	10	8	80.0	24	32	44.4	53.3	53.3	40.0	0.73	1.00	66.7	53.3	0.33	0.47	40.0	33.3	13.3	0.60	0.40	46.7	40.0	0.53	0.93
2737	Ekstraklasa 10/11	10/11	3128	GKS Bełchatów	30	10	10	10	40	1.33	31	33	-2	1.03	1.10	12	40.0	9	4	2	1	6	8	0	0.00	31.00	1.03	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WDLLD	10	1	2	2	4	7	8	5	62.5	18	17	31.5	33.3	73.3	26.7	0.47	0.73	86.7	66.7	0.13	0.53	33.3	40.0	6.7	0.47	0.40	60.0	40.0	0.47	1.07
2737	Ekstraklasa 10/11	10/11	3113	Zagłębie Lubin	30	10	9	11	39	1.30	31	38	-7	1.03	1.27	9	30.0	7	4	4	3	5	7	0	0.00	31.00	1.03	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WLWLL	4	2	0	3	5	7	5	4	80.0	21	26	41.3	33.3	40.0	6.7	0.33	0.60	66.7	60.0	0.33	0.47	26.7	66.7	13.3	0.27	0.87	46.7	26.7	0.60	1.13
2737	Ekstraklasa 10/11	10/11	3105	Ruch Chorzów	30	10	8	12	38	1.27	29	32	-3	0.97	1.07	13	43.3	6	5	4	4	3	8	0	0.00	29.00	0.97	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LLLLW	3	1	0	4	4	8	10	7	70.0	17	9	17.6	40.0	33.3	13.3	0.47	0.47	73.3	73.3	0.40	0.40	40.0	40.0	20.0	0.47	0.53	73.3	46.7	0.40	0.93
2737	Ekstraklasa 10/11	10/11	5065	MKS Korona Kielce	30	10	7	13	37	1.23	34	48	-14	1.13	1.60	8	26.7	5	5	5	5	2	8	0	0.00	34.00	1.13	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LWLWL	7	2	0	3	4	11	5	4	80.0	22	18	27.3	46.7	53.3	13.3	0.47	0.87	53.3	46.7	0.73	0.73	40.0	40.0	6.7	0.40	0.53	46.7	40.0	0.67	1.07
2737	Ekstraklasa 10/11	10/11	4901	Cracovia	30	8	5	17	29	0.97	37	47	-10	1.23	1.57	7	23.3	7	2	6	1	3	11	0	0.00	37.00	1.23	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LWLLW	5	2	0	3	6	5	8	6	75.0	23	16	23.2	66.7	66.7	46.7	0.80	1.20	53.3	40.0	0.73	0.67	20.0	20.0	13.3	0.20	0.27	40.0	46.7	0.87	0.87
2737	Ekstraklasa 10/11	10/11	5064	MZKS Arka Gdynia	30	6	10	14	28	0.93	22	43	-21	0.73	1.43	8	26.7	6	5	4	0	5	10	0	0.00	22.00	0.73	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LLWLL	5	1	0	4	4	14	6	4	66.7	22	16	24.2	60.0	46.7	33.3	0.73	0.53	60.0	60.0	0.53	0.73	13.3	6.7	6.7	0.13	0.07	46.7	46.7	0.67	0.93
2737	Ekstraklasa 10/11	10/11	7692	Polonia Bytom	30	6	9	15	27	0.90	29	45	-16	0.97	1.50	7	23.3	4	5	6	2	4	9	0	0.00	29.00	0.97	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LLLLL	3	0	0	5	4	12	4	2	50.0	23	18	26.1	33.3	53.3	13.3	0.53	0.60	66.7	26.7	0.33	0.87	20.0	40.0	6.7	0.33	0.47	40.0	40.0	0.73	1.07
2275	Ekstraklasa 09/10	09/10	3121	Lech Poznań	30	19	8	3	65	2.17	51	20	31	1.70	0.67	16	53.3	12	2	1	7	6	2	0	0.00	51.00	1.70	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WWWWW	11	5	0	0	12	2	13	12	92.3	14	22	52.4	73.3	73.3	46.7	1.00	0.87	66.7	80.0	0.33	0.33	40.0	53.3	26.7	0.53	1.00	86.7	60.0	0.20	0.47
2275	Ekstraklasa 09/10	09/10	3111	Wisła Kraków	30	19	5	6	62	2.07	48	20	28	1.60	0.67	11	36.7	8	3	4	11	2	2	0	0.00	48.00	1.60	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	DDWLW	6	2	2	1	9	4	14	13	92.9	19	23	40.4	53.3	26.7	13.3	0.80	0.40	66.7	73.3	0.33	0.27	53.3	66.7	40.0	0.80	1.20	80.0	53.3	0.20	0.53
2275	Ekstraklasa 09/10	09/10	3105	Ruch Chorzów	30	16	5	9	53	1.77	40	30	10	1.33	1.00	13	43.3	10	2	3	6	3	6	0	0.00	40.00	1.33	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LLLWW	7	2	0	3	4	7	11	11	100.0	17	21	41.2	46.7	66.7	33.3	0.60	0.87	80.0	66.7	0.20	0.60	46.7	40.0	20.0	0.60	0.60	53.3	60.0	0.67	0.53
2275	Ekstraklasa 09/10	09/10	3106	Legia Warszawa	30	15	7	8	52	1.73	36	22	14	1.20	0.73	14	46.7	9	4	2	6	3	6	0	0.00	36.00	1.20	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	DLLLW	2	1	1	3	3	7	9	7	77.8	16	13	27.1	60.0	53.3	33.3	0.80	0.93	80.0	60.0	0.20	0.53	13.3	40.0	6.7	0.13	0.53	73.3	60.0	0.33	0.40
2275	Ekstraklasa 09/10	09/10	3128	GKS Bełchatów	30	13	9	8	48	1.60	37	27	10	1.23	0.90	12	40.0	9	3	3	4	6	5	0	0.00	37.00	1.23	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	DWLWD	12	2	2	1	8	5	10	9	90.0	18	22	40.7	53.3	73.3	40.0	0.67	0.87	60.0	73.3	0.40	0.33	33.3	46.7	13.3	0.40	0.53	73.3	33.3	0.33	0.73
2275	Ekstraklasa 09/10	09/10	7691	Jagiellonia Białystok	30	11	11	8	44	1.47	29	27	2	0.97	0.90	15	50.0	9	5	1	2	6	7	0	0.00	29.00	0.97	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LDWLW	6	2	1	2	3	5	7	6	85.7	15	20	44.4	40.0	60.0	33.3	0.47	0.73	80.0	86.7	0.27	0.13	26.7	40.0	13.3	0.27	0.47	40.0	53.3	0.87	0.53
2275	Ekstraklasa 09/10	09/10	5065	MKS Korona Kielce	30	9	10	11	37	1.23	35	41	-6	1.17	1.37	8	26.7	6	5	4	3	5	7	0	0.00	35.00	1.17	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WDWWL	11	3	1	1	7	3	8	5	62.5	22	20	30.3	40.0	66.7	20.0	0.53	1.00	60.0	40.0	0.53	0.80	33.3	40.0	20.0	0.33	0.47	40.0	53.3	0.67	0.73
2275	Ekstraklasa 09/10	09/10	7692	Polonia Bytom	30	9	10	11	37	1.23	29	31	-2	0.97	1.03	9	30.0	7	5	3	2	5	8	0	0.00	29.00	0.97	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WDLWL	9	2	1	2	4	6	9	5	55.6	21	19	30.2	53.3	46.7	13.3	0.67	0.60	66.7	60.0	0.33	0.47	46.7	20.0	20.0	0.47	0.20	60.0	46.7	0.53	0.73
2275	Ekstraklasa 09/10	09/10	7913	KS Lechia Gdańsk	30	9	10	11	37	1.23	30	32	-2	1.00	1.07	9	30.0	4	6	5	5	4	6	0	0.00	30.00	1.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WLLLL	4	1	0	4	4	6	9	6	66.7	21	17	27.0	40.0	26.7	6.7	0.53	0.27	60.0	60.0	0.40	0.53	53.3	40.0	33.3	0.67	0.53	46.7	53.3	0.60	0.60
2275	Ekstraklasa 09/10	09/10	3108	Śląsk Wrocław	30	8	12	10	36	1.20	32	33	-1	1.07	1.10	9	30.0	7	4	4	1	8	6	0	0.00	32.00	1.07	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WWDLD	11	2	2	1	9	9	6	3	50.0	21	32	50.8	33.3	53.3	13.3	0.60	0.67	53.3	66.7	0.47	0.47	26.7	40.0	13.3	0.27	0.60	53.3	46.7	0.47	0.80
2275	Ekstraklasa 09/10	09/10	3113	Zagłębie Lubin	30	8	11	11	35	1.17	30	38	-8	1.00	1.27	9	30.0	3	8	4	5	3	7	0	0.00	30.00	1.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LDWLD	3	1	2	2	6	8	7	3	42.9	21	15	23.8	26.7	46.7	13.3	0.33	0.60	66.7	46.7	0.40	0.67	40.0	46.7	26.7	0.40	0.67	53.3	46.7	0.60	0.87
2275	Ekstraklasa 09/10	09/10	4901	Cracovia	30	9	7	14	34	1.13	25	39	-14	0.83	1.30	10	33.3	5	3	7	4	4	7	0	0.00	25.00	0.83	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WDLLW	5	2	1	2	4	6	9	5	55.6	20	14	23.3	66.7	40.0	20.0	0.80	0.40	66.7	26.7	0.47	1.07	26.7	20.0	6.7	0.27	0.20	66.7	46.7	0.47	0.60
2275	Ekstraklasa 09/10	09/10	3119	Polonia Warszawa	30	9	6	15	33	1.10	25	38	-13	0.83	1.27	6	20.0	6	3	6	3	3	9	0	0.00	25.00	0.83	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LWWWD	7	3	1	1	5	2	6	4	66.7	24	23	31.9	33.3	33.3	13.3	0.33	0.53	60.0	53.3	0.40	0.60	33.3	33.3	20.0	0.33	0.47	46.7	40.0	0.73	0.80
2275	Ekstraklasa 09/10	09/10	5064	MZKS Arka Gdynia	30	7	7	16	28	0.93	28	39	-11	0.93	1.30	6	20.0	4	5	6	3	2	10	0	0.00	28.00	0.93	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LWWLL	6	2	0	3	7	8	8	4	50.0	24	19	26.4	40.0	33.3	13.3	0.47	0.47	46.7	46.7	0.53	0.60	53.3	40.0	20.0	0.53	0.40	46.7	40.0	0.67	0.80
2275	Ekstraklasa 09/10	09/10	3114	MKS Odra Wodzisław Śląski	30	7	6	17	27	0.90	27	45	-18	0.90	1.50	7	23.3	5	3	7	2	3	10	0	0.00	27.00	0.90	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	DLLWL	7	1	1	3	6	9	6	3	50.0	23	22	31.9	26.7	60.0	20.0	0.27	0.73	53.3	60.0	0.67	0.67	26.7	46.7	6.7	0.27	0.53	26.7	53.3	1.00	0.67
2275	Ekstraklasa 09/10	09/10	7918	Piast Gliwice	30	7	6	17	27	0.90	30	50	-20	1.00	1.67	6	20.0	4	4	7	3	2	10	0	0.00	30.00	1.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LLDWL	3	1	1	3	5	9	6	5	83.3	24	19	26.4	40.0	53.3	20.0	0.47	0.67	46.7	40.0	0.67	0.87	33.3	46.7	13.3	0.33	0.53	26.7	40.0	1.00	0.80
1691	Ekstraklasa 08/09	08/09	3111	Wisła Kraków	30	19	7	4	64	2.13	53	21	32	1.77	0.70	15	50.0	13	1	1	6	6	3	0	0.00	53.00	1.77	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WWWWD	11	4	1	0	12	3	12	12	100.0	15	32	71.1	60.0	73.3	40.0	0.73	1.33	80.0	73.3	0.33	0.27	33.3	73.3	20.0	0.33	1.13	66.7	53.3	0.33	0.47
1691	Ekstraklasa 08/09	08/09	3106	Legia Warszawa	30	18	7	5	61	2.03	52	17	35	1.73	0.57	17	56.7	12	3	0	6	4	5	0	0.00	52.00	1.73	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WDWLW	12	3	1	1	9	4	12	10	83.3	13	16	41.0	66.7	86.7	60.0	1.13	1.40	73.3	86.7	0.33	0.13	40.0	33.3	20.0	0.53	0.40	66.7	73.3	0.40	0.27
1691	Ekstraklasa 08/09	08/09	3121	Lech Poznań	30	16	11	3	59	1.97	51	24	27	1.70	0.80	14	46.7	7	7	1	9	4	2	0	0.00	51.00	1.70	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	DDWWD	7	2	3	0	9	6	15	12	80.0	16	19	39.6	60.0	60.0	33.3	0.73	0.73	80.0	73.3	0.20	0.47	60.0	80.0	46.7	0.87	1.07	73.3	53.3	0.33	0.60
1691	Ekstraklasa 08/09	08/09	3119	Polonia Warszawa	30	15	9	6	54	1.80	40	23	17	1.33	0.77	16	53.3	7	6	2	8	3	4	0	0.00	40.00	1.33	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WDLWL	4	2	1	2	6	6	10	8	80.0	14	11	26.2	40.0	60.0	26.7	0.47	0.80	73.3	80.0	0.27	0.40	40.0	46.7	6.7	0.60	0.80	60.0	60.0	0.47	0.40
1691	Ekstraklasa 08/09	08/09	3128	GKS Bełchatów	30	17	3	10	54	1.80	40	28	12	1.33	0.93	13	43.3	9	3	3	8	0	7	0	0.00	40.00	1.33	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WDLLW	4	2	1	2	6	4	7	7	100.0	17	13	25.5	46.7	60.0	26.7	0.60	0.80	73.3	80.0	0.33	0.33	26.7	66.7	26.7	0.27	1.00	46.7	53.3	0.53	0.67
1691	Ekstraklasa 08/09	08/09	3108	Śląsk Wrocław	30	11	12	7	45	1.50	40	34	6	1.33	1.13	7	23.3	8	4	3	3	8	4	0	0.00	40.00	1.33	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LDWLD	5	1	2	2	5	8	9	7	77.8	23	35	50.7	66.7	66.7	53.3	0.80	0.87	60.0	60.0	0.40	0.40	20.0	60.0	13.3	0.27	0.73	60.0	40.0	0.67	0.80
1691	Ekstraklasa 08/09	08/09	7692	Polonia Bytom	30	10	5	15	35	1.17	30	46	-16	1.00	1.53	7	23.3	7	4	4	3	1	11	0	0.00	30.00	1.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LWLWL	6	2	0	3	5	9	5	5	100.0	23	14	20.3	46.7	60.0	20.0	0.53	0.73	73.3	40.0	0.27	0.93	26.7	26.7	0.0	0.27	0.47	40.0	26.7	0.73	1.13
1691	Ekstraklasa 08/09	08/09	3123	ŁKS Łódź	30	10	5	15	35	1.17	27	43	-16	0.90	1.43	10	33.3	6	3	6	4	2	9	0	0.00	27.00	0.90	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WLLWL	7	2	0	3	4	7	7	5	71.4	20	17	28.3	33.3	33.3	20.0	0.33	0.67	80.0	46.7	0.33	0.80	26.7	33.3	13.3	0.27	0.53	46.7	26.7	0.60	1.13
1691	Ekstraklasa 08/09	08/09	3105	Ruch Chorzów	30	9	7	14	34	1.13	22	32	-10	0.73	1.07	12	40.0	6	3	6	3	4	8	0	0.00	22.00	0.73	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LWWDD	7	2	2	1	6	6	4	4	100.0	18	16	29.6	26.7	40.0	13.3	0.33	0.53	80.0	60.0	0.27	0.47	20.0	26.7	6.7	0.27	0.33	53.3	66.7	0.73	0.67
1691	Ekstraklasa 08/09	08/09	7691	Jagiellonia Białystok	30	9	7	14	34	1.13	28	34	-6	0.93	1.13	9	30.0	9	2	4	0	5	10	0	0.00	28.00	0.93	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LLWLL	5	1	0	4	4	9	8	5	62.5	21	19	30.2	60.0	66.7	46.7	0.73	0.87	53.3	60.0	0.53	0.47	20.0	6.7	0.0	0.20	0.07	46.7	40.0	0.60	0.67
1691	Ekstraklasa 08/09	08/09	7918	Piast Gliwice	31	9	6	15	33	1.06	17	26	-9	0.55	0.84	12	38.7	5	3	7	4	3	8	0	0.00	17.00	0.55	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LWLDD	6	1	2	2	3	4	6	5	83.3	18	10	18.5	31.3	37.5	12.5	0.33	0.40	68.8	50.0	0.40	0.53	6.7	26.7	0.0	0.13	0.27	60.0	66.7	0.47	0.33
1691	Ekstraklasa 08/09	08/09	3114	MKS Odra Wodzisław Śląski	30	8	8	14	32	1.07	23	40	-17	0.77	1.33	10	33.3	5	5	5	3	3	9	0	0.00	23.00	0.77	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LLLWW	5	2	0	3	5	8	7	6	85.7	20	15	25.0	33.3	26.7	13.3	0.53	0.40	73.3	66.7	0.33	0.47	40.0	20.0	6.7	0.40	0.20	46.7	40.0	0.80	1.07
1691	Ekstraklasa 08/09	08/09	7913	KS Lechia Gdańsk	30	9	5	16	32	1.07	30	44	-14	1.00	1.47	7	23.3	7	3	5	2	2	11	0	0.00	30.00	1.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WLLWL	5	2	0	3	7	8	6	5	83.3	23	23	33.3	46.7	53.3	26.7	0.60	0.80	66.7	46.7	0.40	0.80	13.3	40.0	0.0	0.20	0.40	53.3	26.7	0.60	1.13
1691	Ekstraklasa 08/09	08/09	4901	Cracovia	30	7	9	14	30	1.00	24	40	-16	0.80	1.33	10	33.3	6	6	3	1	3	11	0	0.00	24.00	0.80	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	DDWLW	9	2	2	1	5	4	9	4	44.4	20	15	25.0	33.3	33.3	13.3	0.33	0.47	86.7	66.7	0.13	0.40	33.3	33.3	13.3	0.40	0.40	46.7	13.3	0.67	1.47
1691	Ekstraklasa 08/09	08/09	5064	MZKS Arka Gdynia	30	7	9	14	30	1.00	27	39	-12	0.90	1.30	8	26.7	6	2	7	1	7	7	0	0.00	27.00	0.90	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	WDLLD	7	1	2	2	8	9	5	3	60.0	22	23	34.8	40.0	46.7	20.0	0.40	0.87	53.3	60.0	0.60	0.53	26.7	13.3	0.0	0.40	0.13	60.0	40.0	0.53	0.93
1691	Ekstraklasa 08/09	08/09	3110	Górnik Zabrze	31	7	8	15	29	0.94	20	33	-13	0.65	1.06	11	35.5	6	4	5	1	4	10	0	0.00	20.00	0.65	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	\N	0	0	0.00	0	0.00	\N	0	0.00	0	0.00	0	0.00	0	0.00	\N	\N	\N	0	0	\N	0	0	\N	0.0	0.0	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0.00	0	0	0.00	0	0.00	0	0.00	LDWLW	10	2	1	2	4	3	5	4	80.0	19	8	14.0	40.0	60.0	26.7	0.47	0.67	73.3	53.3	0.40	0.60	12.5	6.3	0.0	0.13	0.07	37.5	50.0	0.60	0.60
\.


--
-- Data for Name: mart_upcoming_fixtures; Type: TABLE DATA; Schema: gold; Owner: airflow
--

COPY gold.mart_upcoming_fixtures (match_id, match_slug, custom_id, start_timestamp, status_type, home_team_id, home_team_name, away_team_id, away_team_name, tournament_id, tournament_name, season_id, season_name, season_year, round_number, extraction_date, extracted_at, created_at) FROM stdin;
15161024	cracovia-wisla-plock	xmbsbYb	2025-12-04 16:00:00+00	notstarted	3122	Wisła Płock	4901	Cracovia	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	8	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981897	ks-lechia-gdansk-gornik-zabrze	kmbsnid	2025-12-05 19:30:00+00	notstarted	7913	KS Lechia Gdańsk	3110	Górnik Zabrze	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	18	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981900	motor-lublin-mzks-arka-gdynia	obcspid	2025-12-06 11:15:00+00	notstarted	5064	MZKS Arka Gdynia	7915	Motor Lublin	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	18	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981904	radomiak-radom-pogon-szczecin	rmbsVVc	2025-12-06 13:45:00+00	notstarted	3117	Pogoń Szczecin	7295	Radomiak Radom	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	18	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981906	widzew-lodz-zaglebie-lubin	nmbspmb	2025-12-06 16:30:00+00	notstarted	3113	Zagłębie Lubin	3115	Widzew Łódź	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	18	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981903	piast-gliwice-legia-warszawa	gmbstid	2025-12-06 19:15:00+00	notstarted	7918	Piast Gliwice	3106	Legia Warszawa	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	18	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981902	bruk-bet-termalica-nieciecza-jagiellonia-bialystok	QddsbMo	2025-12-07 11:15:00+00	notstarted	36851	Bruk-Bet Termalica Nieciecza	7691	Jagiellonia Białystok	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	18	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981905	cracovia-lech-poznan	wmbsbYb	2025-12-07 13:45:00+00	notstarted	4901	Cracovia	3121	Lech Poznań	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	18	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981899	rakow-czestochowa-gks-katowice	mmbstfo	2025-12-07 16:30:00+00	notstarted	35268	Raków Częstochowa	3112	GKS Katowice	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	18	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981901	mks-korona-kielce-wisla-plock	xmbspbc	2025-12-08 18:00:00+00	notstarted	5065	MKS Korona Kielce	3122	Wisła Płock	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	18	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
15028166	rakow-czestochowa-zaglebie-lubin	nmbstfo	2025-12-14 13:45:00+00	notstarted	35268	Raków Częstochowa	3113	Zagłębie Lubin	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	4	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
15028170	motor-lublin-jagiellonia-bialystok	Qddspid	2025-12-14 16:30:00+00	notstarted	7915	Motor Lublin	7691	Jagiellonia Białystok	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	3	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
14079318	piast-gliwice-legia-warszawa	gmbstid	2025-12-14 19:15:00+00	notstarted	3106	Legia Warszawa	7918	Piast Gliwice	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	1	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981911	motor-lublin-pogon-szczecin	rmbspid	2026-01-30 16:00:00+00	notstarted	7915	Motor Lublin	3117	Pogoń Szczecin	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	19	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981909	mks-korona-kielce-legia-warszawa	gmbspbc	2026-01-30 16:00:00+00	notstarted	3106	Legia Warszawa	5065	MKS Korona Kielce	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	19	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981908	bruk-bet-termalica-nieciecza-cracovia	bYbsbMo	2026-01-30 16:00:00+00	notstarted	36851	Bruk-Bet Termalica Nieciecza	4901	Cracovia	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	19	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981907	rakow-czestochowa-wisla-plock	xmbstfo	2026-01-30 16:00:00+00	notstarted	3122	Wisła Płock	35268	Raków Częstochowa	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	19	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981913	zaglebie-lubin-gks-katowice	mmbsnmb	2026-01-30 17:00:00+00	notstarted	3113	Zagłębie Lubin	3112	GKS Katowice	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	19	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981914	ks-lechia-gdansk-lech-poznan	wmbsnid	2026-01-30 19:30:00+00	notstarted	3121	Lech Poznań	7913	KS Lechia Gdańsk	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	19	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981912	radomiak-radom-mzks-arka-gdynia	obcsVVc	2026-01-31 13:45:00+00	notstarted	7295	Radomiak Radom	5064	MZKS Arka Gdynia	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	19	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981916	jagiellonia-bialystok-widzew-lodz	pmbsQdd	2026-01-31 16:30:00+00	notstarted	3115	Widzew Łódź	7691	Jagiellonia Białystok	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	19	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981910	piast-gliwice-gornik-zabrze	kmbstid	2026-01-31 19:15:00+00	notstarted	3110	Górnik Zabrze	7918	Piast Gliwice	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	19	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981921	widzew-lodz-gks-katowice	mmbspmb	2026-02-06 16:00:00+00	notstarted	3112	GKS Katowice	3115	Widzew Łódź	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	20	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981915	mzks-arka-gdynia-legia-warszawa	gmbsobc	2026-02-06 16:00:00+00	notstarted	5064	MZKS Arka Gdynia	3106	Legia Warszawa	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	20	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981917	ks-lechia-gdansk-cracovia	bYbsnid	2026-02-06 16:00:00+00	notstarted	7913	KS Lechia Gdańsk	4901	Cracovia	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	20	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981918	lech-poznan-gornik-zabrze	kmbswmb	2026-02-06 16:00:00+00	notstarted	3110	Górnik Zabrze	3121	Lech Poznań	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	20	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981919	bruk-bet-termalica-nieciecza-pogon-szczecin	rmbsbMo	2026-02-06 16:00:00+00	notstarted	3117	Pogoń Szczecin	36851	Bruk-Bet Termalica Nieciecza	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	20	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981920	mks-korona-kielce-zaglebie-lubin	nmbspbc	2026-02-06 16:00:00+00	notstarted	5065	MKS Korona Kielce	3113	Zagłębie Lubin	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	20	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981922	piast-gliwice-wisla-plock	xmbstid	2026-02-06 16:00:00+00	notstarted	7918	Piast Gliwice	3122	Wisła Płock	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	20	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981926	motor-lublin-jagiellonia-bialystok	Qddspid	2026-02-06 16:00:00+00	notstarted	7691	Jagiellonia Białystok	7915	Motor Lublin	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	20	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981928	rakow-czestochowa-radomiak-radom	VVcstfo	2026-02-06 16:00:00+00	notstarted	35268	Raków Częstochowa	7295	Radomiak Radom	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	20	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981929	rakow-czestochowa-zaglebie-lubin	nmbstfo	2026-02-13 16:00:00+00	notstarted	3113	Zagłębie Lubin	35268	Raków Częstochowa	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	21	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981930	radomiak-radom-mks-korona-kielce	pbcsVVc	2026-02-13 16:00:00+00	notstarted	7295	Radomiak Radom	5065	MKS Korona Kielce	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	21	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981931	piast-gliwice-lech-poznan	wmbstid	2026-02-13 16:00:00+00	notstarted	3121	Lech Poznań	7918	Piast Gliwice	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	21	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981933	jagiellonia-bialystok-cracovia	bYbsQdd	2026-02-13 16:00:00+00	notstarted	4901	Cracovia	7691	Jagiellonia Białystok	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	21	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981935	gks-katowice-legia-warszawa	gmbsmmb	2026-02-13 16:00:00+00	notstarted	3112	GKS Katowice	3106	Legia Warszawa	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	21	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981927	mzks-arka-gdynia-pogon-szczecin	rmbsobc	2026-02-13 16:00:00+00	notstarted	3117	Pogoń Szczecin	5064	MZKS Arka Gdynia	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	21	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981925	motor-lublin-ks-lechia-gdansk	nidspid	2026-02-13 16:00:00+00	notstarted	7915	Motor Lublin	7913	KS Lechia Gdańsk	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	21	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981924	wisla-plock-widzew-lodz	pmbsxmb	2026-02-13 16:00:00+00	notstarted	3122	Wisła Płock	3115	Widzew Łódź	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	21	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981923	bruk-bet-termalica-nieciecza-gornik-zabrze	kmbsbMo	2026-02-13 16:00:00+00	notstarted	36851	Bruk-Bet Termalica Nieciecza	3110	Górnik Zabrze	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	21	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981938	mks-korona-kielce-lech-poznan	wmbspbc	2026-02-20 16:00:00+00	notstarted	5065	MKS Korona Kielce	3121	Lech Poznań	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	22	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981939	jagiellonia-bialystok-radomiak-radom	VVcsQdd	2026-02-20 16:00:00+00	notstarted	7691	Jagiellonia Białystok	7295	Radomiak Radom	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	22	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981940	bruk-bet-termalica-nieciecza-rakow-czestochowa	tfosbMo	2026-02-20 16:00:00+00	notstarted	35268	Raków Częstochowa	36851	Bruk-Bet Termalica Nieciecza	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	22	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981941	cracovia-widzew-lodz	pmbsbYb	2026-02-20 16:00:00+00	notstarted	3115	Widzew Łódź	4901	Cracovia	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	22	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981942	piast-gliwice-motor-lublin	pidstid	2026-02-20 16:00:00+00	notstarted	7918	Piast Gliwice	7915	Motor Lublin	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	22	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981932	wisla-plock-legia-warszawa	gmbsxmb	2026-02-20 16:00:00+00	notstarted	3106	Legia Warszawa	3122	Wisła Płock	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	22	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981934	pogon-szczecin-gornik-zabrze	kmbsrmb	2026-02-20 16:00:00+00	notstarted	3110	Górnik Zabrze	3117	Pogoń Szczecin	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	22	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981936	ks-lechia-gdansk-zaglebie-lubin	nmbsnid	2026-02-20 16:00:00+00	notstarted	7913	KS Lechia Gdańsk	3113	Zagłębie Lubin	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	22	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981937	mzks-arka-gdynia-gks-katowice	mmbsobc	2026-02-20 16:00:00+00	notstarted	5064	MZKS Arka Gdynia	3112	GKS Katowice	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	22	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981947	pogon-szczecin-widzew-lodz	pmbsrmb	2026-02-27 16:00:00+00	notstarted	3117	Pogoń Szczecin	3115	Widzew Łódź	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	23	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981948	piast-gliwice-cracovia	bYbstid	2026-02-27 16:00:00+00	notstarted	4901	Cracovia	7918	Piast Gliwice	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	23	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981949	gks-katowice-gornik-zabrze	kmbsmmb	2026-02-27 16:00:00+00	notstarted	3112	GKS Katowice	3110	Górnik Zabrze	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	23	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981945	bruk-bet-termalica-nieciecza-radomiak-radom	VVcsbMo	2026-02-27 16:00:00+00	notstarted	36851	Bruk-Bet Termalica Nieciecza	7295	Radomiak Radom	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	23	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981946	motor-lublin-mks-korona-kielce	pbcspid	2026-02-27 16:00:00+00	notstarted	7915	Motor Lublin	5065	MKS Korona Kielce	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	23	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981954	rakow-czestochowa-lech-poznan	wmbstfo	2026-02-27 16:00:00+00	notstarted	3121	Lech Poznań	35268	Raków Częstochowa	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	23	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981955	jagiellonia-bialystok-legia-warszawa	gmbsQdd	2026-02-27 16:00:00+00	notstarted	7691	Jagiellonia Białystok	3106	Legia Warszawa	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	23	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981943	ks-lechia-gdansk-mzks-arka-gdynia	obcsnid	2026-02-27 16:00:00+00	notstarted	5064	MZKS Arka Gdynia	7913	KS Lechia Gdańsk	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	23	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981944	wisla-plock-zaglebie-lubin	nmbsxmb	2026-02-27 16:00:00+00	notstarted	3113	Zagłębie Lubin	3122	Wisła Płock	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	23	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981951	cracovia-legia-warszawa	gmbsbYb	2026-03-06 16:00:00+00	notstarted	3106	Legia Warszawa	4901	Cracovia	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	24	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
13981960	lech-poznan-widzew-lodz	pmbswmb	2026-03-06 16:00:00+00	notstarted	3115	Widzew Łódź	3121	Lech Poznań	202	Ekstraklasa	76477	Ekstraklasa 25/26	25/26	24	2025-12-02	2025-12-02 19:21:28.832903+00	2025-12-16 09:06:11.927507+00
\.


--
-- Data for Name: mart_upcoming_predictions; Type: TABLE DATA; Schema: gold; Owner: airflow
--

COPY gold.mart_upcoming_predictions (match_id, match_date, season_id, season_name, season_year, home_team_id, home_team_name, away_team_id, away_team_name, tournament_name, predicted_home_goals, predicted_away_goals, predicted_total_xg, match_outlook, home_win_probability, draw_probability, away_win_probability, home_win_fair_odds, draw_fair_odds, away_win_fair_odds, created_at) FROM stdin;
15161024	2025-12-04 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3122	Wisła Płock	4901	Cracovia	Ekstraklasa	1.39	0.84	1.29	HOME_FAVORITE	42.2	35.1	22.7	2.37	2.85	4.40	2025-12-16 09:06:12.050562+00
13981897	2025-12-05 19:30:00+00	76477	Ekstraklasa 25/26	25/26	7913	KS Lechia Gdańsk	3110	Górnik Zabrze	Ekstraklasa	1.84	1.24	1.11	HOME_FAVORITE	52.5	26.7	20.8	1.90	3.75	4.80	2025-12-16 09:06:12.050562+00
13981900	2025-12-06 11:15:00+00	76477	Ekstraklasa 25/26	25/26	5064	MZKS Arka Gdynia	7915	Motor Lublin	Ekstraklasa	1.54	1.07	0.99	HOME_FAVORITE	40.2	34.8	25.0	2.49	2.87	4.00	2025-12-16 09:06:12.050562+00
13981904	2025-12-06 13:45:00+00	76477	Ekstraklasa 25/26	25/26	3117	Pogoń Szczecin	7295	Radomiak Radom	Ekstraklasa	2.49	1.44	1.75	BALANCED	42.4	28.7	29.0	2.36	3.49	3.45	2025-12-16 09:06:12.050562+00
13981906	2025-12-06 16:30:00+00	76477	Ekstraklasa 25/26	25/26	3113	Zagłębie Lubin	3115	Widzew Łódź	Ekstraklasa	2.04	1.23	1.60	HOME_FAVORITE	43.3	37.0	19.7	2.31	2.70	5.08	2025-12-16 09:06:12.050562+00
13981903	2025-12-06 19:15:00+00	76477	Ekstraklasa 25/26	25/26	7918	Piast Gliwice	3106	Legia Warszawa	Ekstraklasa	1.27	1.09	1.23	BALANCED	27.7	39.6	32.7	3.61	2.52	3.06	2025-12-16 09:06:12.050562+00
13981902	2025-12-07 11:15:00+00	76477	Ekstraklasa 25/26	25/26	36851	Bruk-Bet Termalica Nieciecza	7691	Jagiellonia Białystok	Ekstraklasa	1.07	1.57	1.11	BALANCED	21.8	46.0	32.1	4.58	2.17	3.11	2025-12-16 09:06:12.050562+00
13981905	2025-12-07 13:45:00+00	76477	Ekstraklasa 25/26	25/26	4901	Cracovia	3121	Lech Poznań	Ekstraklasa	1.30	1.28	1.55	AWAY_FAVORITE	26.4	31.7	42.0	3.79	3.16	2.38	2025-12-16 09:06:12.050562+00
13981899	2025-12-07 16:30:00+00	76477	Ekstraklasa 25/26	25/26	35268	Raków Częstochowa	3112	GKS Katowice	Ekstraklasa	1.46	1.21	1.07	BALANCED	28.0	47.4	24.7	3.58	2.11	4.06	2025-12-16 09:06:12.050562+00
13981901	2025-12-08 18:00:00+00	76477	Ekstraklasa 25/26	25/26	5065	MKS Korona Kielce	3122	Wisła Płock	Ekstraklasa	1.26	0.97	1.28	BALANCED	34.6	30.2	35.2	2.89	3.31	2.84	2025-12-16 09:06:12.050562+00
15028166	2025-12-14 13:45:00+00	76477	Ekstraklasa 25/26	25/26	35268	Raków Częstochowa	3113	Zagłębie Lubin	Ekstraklasa	1.36	1.18	1.14	BALANCED	26.2	44.0	29.8	3.82	2.27	3.36	2025-12-16 09:06:12.050562+00
15028170	2025-12-14 16:30:00+00	76477	Ekstraklasa 25/26	25/26	7915	Motor Lublin	7691	Jagiellonia Białystok	Ekstraklasa	1.29	1.18	1.50	BALANCED	26.3	34.5	39.2	3.80	2.90	2.55	2025-12-16 09:06:12.050562+00
14079318	2025-12-14 19:15:00+00	76477	Ekstraklasa 25/26	25/26	3106	Legia Warszawa	7918	Piast Gliwice	Ekstraklasa	1.25	0.90	1.09	BALANCED	33.7	40.8	25.6	2.97	2.45	3.91	2025-12-16 09:06:12.050562+00
13981911	2026-01-30 16:00:00+00	76477	Ekstraklasa 25/26	25/26	7915	Motor Lublin	3117	Pogoń Szczecin	Ekstraklasa	1.73	1.15	1.59	BALANCED	28.3	41.5	30.2	3.54	2.41	3.31	2025-12-16 09:06:12.050562+00
13981909	2026-01-30 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3106	Legia Warszawa	5065	MKS Korona Kielce	Ekstraklasa	1.20	0.97	1.33	BALANCED	28.0	41.3	30.7	3.57	2.42	3.25	2025-12-16 09:06:12.050562+00
13981908	2026-01-30 16:00:00+00	76477	Ekstraklasa 25/26	25/26	36851	Bruk-Bet Termalica Nieciecza	4901	Cracovia	Ekstraklasa	1.29	1.64	1.13	BALANCED	26.3	48.6	25.1	3.81	2.06	3.99	2025-12-16 09:06:12.050562+00
13981907	2026-01-30 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3122	Wisła Płock	35268	Raków Częstochowa	Ekstraklasa	1.33	1.08	1.56	BALANCED	36.5	41.7	21.8	2.74	2.40	4.58	2025-12-16 09:06:12.050562+00
13981913	2026-01-30 17:00:00+00	76477	Ekstraklasa 25/26	25/26	3113	Zagłębie Lubin	3112	GKS Katowice	Ekstraklasa	1.98	1.10	1.44	HOME_FAVORITE	39.5	38.3	22.2	2.53	2.61	4.51	2025-12-16 09:06:12.050562+00
13981914	2026-01-30 19:30:00+00	76477	Ekstraklasa 25/26	25/26	3121	Lech Poznań	7913	KS Lechia Gdańsk	Ekstraklasa	2.16	1.50	1.28	BALANCED	38.8	34.0	27.2	2.58	2.94	3.68	2025-12-16 09:06:12.050562+00
13981912	2026-01-31 13:45:00+00	76477	Ekstraklasa 25/26	25/26	7295	Radomiak Radom	5064	MZKS Arka Gdynia	Ekstraklasa	2.28	0.64	1.18	HOME_FAVORITE	53.9	28.1	18.0	1.85	3.56	5.57	2025-12-16 09:06:12.050562+00
13981916	2026-01-31 16:30:00+00	76477	Ekstraklasa 25/26	25/26	3115	Widzew Łódź	7691	Jagiellonia Białystok	Ekstraklasa	1.21	1.12	1.29	BALANCED	26.6	38.3	35.1	3.76	2.61	2.85	2025-12-16 09:06:12.050562+00
13981910	2026-01-31 19:15:00+00	76477	Ekstraklasa 25/26	25/26	3110	Górnik Zabrze	7918	Piast Gliwice	Ekstraklasa	1.59	1.02	1.33	HOME_FAVORITE	42.1	35.6	22.3	2.38	2.81	4.48	2025-12-16 09:06:12.050562+00
13981921	2026-02-06 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3112	GKS Katowice	3115	Widzew Łódź	Ekstraklasa	1.81	1.46	1.65	HOME_FAVORITE	38.7	43.4	17.9	2.59	2.30	5.59	2025-12-16 09:06:12.050562+00
13981915	2026-02-06 16:00:00+00	76477	Ekstraklasa 25/26	25/26	5064	MZKS Arka Gdynia	3106	Legia Warszawa	Ekstraklasa	1.37	1.09	1.21	BALANCED	37.3	31.9	30.8	2.68	3.13	3.25	2025-12-16 09:06:12.050562+00
13981917	2026-02-06 16:00:00+00	76477	Ekstraklasa 25/26	25/26	7913	KS Lechia Gdańsk	4901	Cracovia	Ekstraklasa	1.73	1.42	1.35	HOME_FAVORITE	46.5	31.5	22.0	2.15	3.18	4.54	2025-12-16 09:06:12.050562+00
13981918	2026-02-06 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3110	Górnik Zabrze	3121	Lech Poznań	Ekstraklasa	1.61	1.34	1.84	BALANCED	30.9	35.4	33.8	3.24	2.83	2.96	2025-12-16 09:06:12.050562+00
13981919	2026-02-06 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3117	Pogoń Szczecin	36851	Bruk-Bet Termalica Nieciecza	Ekstraklasa	2.16	1.64	2.14	BALANCED	35.2	41.0	23.8	2.84	2.44	4.21	2025-12-16 09:06:12.050562+00
13981920	2026-02-06 16:00:00+00	76477	Ekstraklasa 25/26	25/26	5065	MKS Korona Kielce	3113	Zagłębie Lubin	Ekstraklasa	1.59	1.07	1.49	BALANCED	32.2	41.6	26.1	3.10	2.40	3.82	2025-12-16 09:06:12.050562+00
13981922	2026-02-06 16:00:00+00	76477	Ekstraklasa 25/26	25/26	7918	Piast Gliwice	3122	Wisła Płock	Ekstraklasa	1.00	0.97	0.93	BALANCED	26.1	36.1	37.7	3.83	2.77	2.65	2025-12-16 09:06:12.050562+00
13981926	2026-02-06 16:00:00+00	76477	Ekstraklasa 25/26	25/26	7691	Jagiellonia Białystok	7915	Motor Lublin	Ekstraklasa	2.06	1.35	1.46	HOME_FAVORITE	48.1	31.3	20.6	2.08	3.20	4.85	2025-12-16 09:06:12.050562+00
13981928	2026-02-06 16:00:00+00	76477	Ekstraklasa 25/26	25/26	35268	Raków Częstochowa	7295	Radomiak Radom	Ekstraklasa	1.80	1.22	0.99	BALANCED	27.7	41.3	31.0	3.62	2.42	3.22	2025-12-16 09:06:12.050562+00
13981929	2026-02-13 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3113	Zagłębie Lubin	35268	Raków Częstochowa	Ekstraklasa	1.71	1.38	1.73	BALANCED	32.5	47.3	20.2	3.08	2.11	4.95	2025-12-16 09:06:12.050562+00
13981930	2026-02-13 16:00:00+00	76477	Ekstraklasa 25/26	25/26	7295	Radomiak Radom	5065	MKS Korona Kielce	Ekstraklasa	1.56	0.97	1.44	BALANCED	40.7	32.8	26.5	2.46	3.05	3.78	2025-12-16 09:06:12.050562+00
13981931	2026-02-13 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3121	Lech Poznań	7918	Piast Gliwice	Ekstraklasa	1.50	1.41	1.25	HOME_FAVORITE	40.9	36.3	22.8	2.44	2.76	4.38	2025-12-16 09:06:12.050562+00
13981933	2026-02-13 16:00:00+00	76477	Ekstraklasa 25/26	25/26	4901	Cracovia	7691	Jagiellonia Białystok	Ekstraklasa	1.17	1.01	1.21	BALANCED	27.4	38.4	34.2	3.65	2.60	2.93	2025-12-16 09:06:12.050562+00
13981935	2026-02-13 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3112	GKS Katowice	3106	Legia Warszawa	Ekstraklasa	1.59	1.32	1.65	BALANCED	34.4	40.3	25.3	2.90	2.48	3.96	2025-12-16 09:06:12.050562+00
13981927	2026-02-13 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3117	Pogoń Szczecin	5064	MZKS Arka Gdynia	Ekstraklasa	2.49	1.09	1.65	HOME_FAVORITE	49.6	32.8	17.6	2.02	3.05	5.67	2025-12-16 09:06:12.050562+00
13981925	2026-02-13 16:00:00+00	76477	Ekstraklasa 25/26	25/26	7915	Motor Lublin	7913	KS Lechia Gdańsk	Ekstraklasa	2.07	1.23	1.36	BALANCED	35.9	23.3	40.7	2.78	4.28	2.46	2025-12-16 09:06:12.050562+00
13981924	2026-02-13 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3122	Wisła Płock	3115	Widzew Łódź	Ekstraklasa	1.67	0.93	1.43	HOME_FAVORITE	46.2	33.5	20.3	2.16	2.99	4.93	2025-12-16 09:06:12.050562+00
13981923	2026-02-13 16:00:00+00	76477	Ekstraklasa 25/26	25/26	36851	Bruk-Bet Termalica Nieciecza	3110	Górnik Zabrze	Ekstraklasa	1.40	1.46	0.89	BALANCED	29.9	47.0	23.2	3.35	2.13	4.31	2025-12-16 09:06:12.050562+00
13981938	2026-02-20 16:00:00+00	76477	Ekstraklasa 25/26	25/26	5065	MKS Korona Kielce	3121	Lech Poznań	Ekstraklasa	1.38	1.34	1.77	BALANCED	27.2	39.0	33.8	3.68	2.56	2.96	2025-12-16 09:06:12.050562+00
13981939	2026-02-20 16:00:00+00	76477	Ekstraklasa 25/26	25/26	7691	Jagiellonia Białystok	7295	Radomiak Radom	Ekstraklasa	2.39	1.39	1.43	HOME_FAVORITE	43.6	30.4	26.1	2.30	3.29	3.84	2025-12-16 09:06:12.050562+00
13981940	2026-02-20 16:00:00+00	76477	Ekstraklasa 25/26	25/26	35268	Raków Częstochowa	36851	Bruk-Bet Termalica Nieciecza	Ekstraklasa	1.47	1.41	1.38	BALANCED	25.7	44.3	30.0	3.89	2.26	3.33	2025-12-16 09:06:12.050562+00
13981941	2026-02-20 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3115	Widzew Łódź	4901	Cracovia	Ekstraklasa	1.43	1.19	1.31	BALANCED	28.8	46.8	24.4	3.47	2.14	4.10	2025-12-16 09:06:12.050562+00
13981942	2026-02-20 16:00:00+00	76477	Ekstraklasa 25/26	25/26	7918	Piast Gliwice	7915	Motor Lublin	Ekstraklasa	1.44	1.07	1.01	BALANCED	30.6	42.9	26.5	3.27	2.33	3.77	2025-12-16 09:06:12.050562+00
13981932	2026-02-20 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3106	Legia Warszawa	3122	Wisła Płock	Ekstraklasa	1.14	0.86	1.11	BALANCED	31.2	28.9	39.9	3.21	3.46	2.51	2025-12-16 09:06:12.050562+00
13981934	2026-02-20 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3110	Górnik Zabrze	3117	Pogoń Szczecin	Ekstraklasa	1.93	1.03	1.59	BALANCED	37.1	40.2	22.7	2.69	2.49	4.40	2025-12-16 09:06:12.050562+00
13981936	2026-02-20 16:00:00+00	76477	Ekstraklasa 25/26	25/26	7913	KS Lechia Gdańsk	3113	Zagłębie Lubin	Ekstraklasa	1.84	1.35	1.38	HOME_FAVORITE	41.8	32.2	26.0	2.39	3.10	3.85	2025-12-16 09:06:12.050562+00
13981937	2026-02-20 16:00:00+00	76477	Ekstraklasa 25/26	25/26	5064	MZKS Arka Gdynia	3112	GKS Katowice	Ekstraklasa	1.53	1.10	1.05	BALANCED	35.8	39.9	24.3	2.79	2.51	4.12	2025-12-16 09:06:12.050562+00
13981947	2026-02-27 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3117	Pogoń Szczecin	3115	Widzew Łódź	Ekstraklasa	2.21	1.57	2.00	HOME_FAVORITE	41.2	42.4	16.3	2.43	2.36	6.13	2025-12-16 09:06:12.050562+00
13981948	2026-02-27 16:00:00+00	76477	Ekstraklasa 25/26	25/26	4901	Cracovia	7918	Piast Gliwice	Ekstraklasa	1.28	0.96	1.04	BALANCED	34.4	38.9	26.7	2.90	2.57	3.74	2025-12-16 09:06:12.050562+00
13981949	2026-02-27 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3112	GKS Katowice	3110	Górnik Zabrze	Ekstraklasa	1.65	1.19	1.28	HOME_FAVORITE	41.0	39.2	19.8	2.44	2.55	5.06	2025-12-16 09:06:12.050562+00
13981945	2026-02-27 16:00:00+00	76477	Ekstraklasa 25/26	25/26	36851	Bruk-Bet Termalica Nieciecza	7295	Radomiak Radom	Ekstraklasa	1.84	1.61	1.01	BALANCED	25.4	43.4	31.2	3.93	2.31	3.20	2025-12-16 09:06:12.050562+00
13981946	2026-02-27 16:00:00+00	76477	Ekstraklasa 25/26	25/26	7915	Motor Lublin	5065	MKS Korona Kielce	Ekstraklasa	1.34	1.19	1.57	BALANCED	27.9	35.7	36.4	3.58	2.80	2.75	2025-12-16 09:06:12.050562+00
13981954	2026-02-27 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3121	Lech Poznań	35268	Raków Częstochowa	Ekstraklasa	1.55	1.77	1.70	BALANCED	31.8	47.5	20.7	3.14	2.11	4.83	2025-12-16 09:06:12.050562+00
13981955	2026-02-27 16:00:00+00	76477	Ekstraklasa 25/26	25/26	7691	Jagiellonia Białystok	3106	Legia Warszawa	Ekstraklasa	1.89	1.38	1.68	HOME_FAVORITE	41.3	35.0	23.6	2.42	2.85	4.23	2025-12-16 09:06:12.050562+00
13981943	2026-02-27 16:00:00+00	76477	Ekstraklasa 25/26	25/26	5064	MZKS Arka Gdynia	7913	KS Lechia Gdańsk	Ekstraklasa	1.87	1.12	0.92	BALANCED	37.0	32.9	30.1	2.70	3.04	3.32	2025-12-16 09:06:12.050562+00
13981944	2026-02-27 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3113	Zagłębie Lubin	3122	Wisła Płock	Ekstraklasa	1.54	0.97	1.29	BALANCED	38.6	25.2	36.2	2.59	3.97	2.76	2025-12-16 09:06:12.050562+00
13981951	2026-03-06 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3106	Legia Warszawa	4901	Cracovia	Ekstraklasa	1.36	1.03	1.28	BALANCED	28.9	48.0	23.0	3.46	2.08	4.34	2025-12-16 09:06:12.050562+00
13981960	2026-03-06 16:00:00+00	76477	Ekstraklasa 25/26	25/26	3115	Widzew Łódź	3121	Lech Poznań	Ekstraklasa	1.34	1.39	1.63	AWAY_FAVORITE	24.7	33.7	41.7	4.05	2.97	2.40	2025-12-16 09:06:12.050562+00
\.


--
-- PostgreSQL database dump complete
--

\unrestrict ePATOjLgOBUYsHZaVWRL0uJGg8Lu2nwfMzNkwEpcdyqyJVAJKRP5JEf8hhV79sI

