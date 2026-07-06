/* name: ListPlayers :many */
SELECT
    p.player_id as id,
    p.player_name as name,

    bat.name as batting_style,
    ball.name as bowling_style,

    c.name AS country,
    c.flag_code,

    cc.name AS class

FROM
  players p
  LEFT JOIN batting_types bat ON bat.id = p.batting_type_id
  LEFT JOIN bowling_types ball ON ball.id = p.bowling_type_id
  LEFT JOIN cricket_class cc ON cc.id = p.cricket_class_id
  LEFT JOIN country c ON c.id = p.country_id
ORDER BY
    p.player_id;

/* name: GetPlayerByID :one */
SELECT
    p.player_id as id,
    p.player_name as name,

    bat.name as batting_style,
    ball.name as bowling_style,

    c.name AS country,
    c.flag_code,

    cc.name AS class

FROM
  players p
  LEFT JOIN batting_types bat ON bat.id = p.batting_type_id
  LEFT JOIN bowling_types ball ON ball.id = p.bowling_type_id
  LEFT JOIN cricket_class cc ON cc.id = p.cricket_class_id
  LEFT JOIN country c ON c.id = p.country_id

WHERE p.player_id = $1;
