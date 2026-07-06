/* name: ListPlayers :many */
SELECT
    p.player_id,
    p.player_name,
    c.name AS country_name,
    c.flag_code,
    cc.name AS cricket_class
FROM
    players p
    LEFT JOIN country c ON c.country_id = p.country_id
    LEFT JOIN cricket_class cc ON cc.cricket_class_id = p.cricket_class_id
ORDER BY
    p.player_id;
