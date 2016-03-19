-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- DROP tournment db if exists
DROP DATABASE IF EXISTS tournament;

-- Create database called tournament
CREATE DATABASE tournament;

-- Connect to tournament database
\c tournament;

-- Create table named players to store plays' ID and NAME
CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT
    );

-- Create table named match_record to store match result
CREATE TABLE match_record (
    match_id SERIAL,
    tournament TEXT,
    winner INTEGER REFERENCES players(id),
    loser INTEGER REFERENCES players(id),
    primary key (match_id)
    );

CREATE VIEW wins AS
    SELECT players.id, players.name, count(winner) AS wins
    FROM match_record RIGHT JOIN players
    ON match_record.winner = players.id
    GROUP BY players.id
    ORDER BY wins DESC;

CREATE VIEW losses AS
    SELECT players.id, players.name, count(loser) AS losses
    FROM match_record RIGHT JOIN players
    ON match_record.loser = players.id
    GROUP BY players.id
    ORDER BY losses DESC;

CREATE VIEW matches AS
    SELECT wins.id, wins.name, wins, wins + losses AS matches
    FROM wins JOIN losses
    ON wins.id = losses.id
    ORDER BY wins DESC;

-- Disconnect from tournament database
\q
