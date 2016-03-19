Tournament Results
---------------------
---
Running with Python 2.7.11 and PostgreSQL 9.5


Download Python and PostgreSQL 9.5
-----------
---
https://www.python.org/downloads/
http://www.postgresql.org/download/

Files In Content
----------------
---
* tournament.sql
* tournament.py
* tournament_test.py
* readme.md


Program Execution
----------------
---
1. $ vagran up
2. $ vagran ssh
3. $ psql -f tournament.sql
4. $ python tournament_test.py


File Description
------
---
* #### PostgreSQL: tournament.sql
    This file is used to set up database schema and views.
    + Database
        Name of database: tournament
    + Tables
        - players
        
            |   id   | name |
            |:------:|:----:|
            | SERIAL | TEXT |

        - match_record

            | match_id | tournamet |  winner |  loser  |
            |:--------:|:---------:|:-------:|:-------:|
            |  SERIAL  |    TEXT   | INTEGER | INTEGER |

    + Views
        - wins return below table

            |   id   | name |   wins  |
            |:------:|:----:|:-------:|
            | SERIAL | TEXT | INTEGER |
            |        |      |   DESC  |

        - losses return below table

            |   id   | name |  losses |
            |:------:|:----:|:-------:|
            | SERIAL | TEXT | INTEGER |
            |        |      |   DESC  |

        - matches return below table

            |   id   | name |   wins  | matches |
            |:------:|:----:|:-------:|:-------:|
            | SERIAL | TEXT | INTEGER | INTEGER |
            |        |      |   DESC  |         |
    

* #### Python: tournament.py
    
    |    tournament.py   |                                  function                                 |
    |------------------|-------------------------------------------------------------------------|
    | connect()          | Meant to connect to the database.                                         |
    | deleteMatches()    | Remove all the matches record from the database.                          |
    | deletePlayers()    | Remove all the player record from the database.                           |
    | countPlayers()     | Returns the number of players currently registered.                       |
    | registerPlayer()   | Adds a player to the database.                                            |
    | playersStandings() | Returns a list of the players and their win records, sorted by wins.      |
    | reportMatch()      | Populate the matches table and record the winner and loser into database. |
    | swissPairings      | Returns a list of pairs of players for the next round of a match.         |

* #### Python: tournament_test.py
    Using tournament_test.py for unit test.
