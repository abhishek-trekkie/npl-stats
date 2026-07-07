CREATE TABLE
    players (
        player_id SERIAL PRIMARY KEY,
        player_name VARCHAR(100) NOT NULL,
        role VARCHAR(50),
        batting_style VARCHAR(50),
        bowling_style VARCHAR(50),
        generalized_role VARCHAR(30),
        batting_type_id INT,
        bowling_type_id INT,
        cricket_class_id INT,
        country_id INT NOT NULL,
        CONSTRAINT fk_players_country FOREIGN KEY (country_id) REFERENCES country (country_id) ON UPDATE CASCADE ON DELETE RESTRICT,
        CONSTRAINT fk_players_batting_type FOREIGN KEY (batting_type_id) REFERENCES batting_types (batting_type_id) ON UPDATE CASCADE ON DELETE SET NULL,
        CONSTRAINT fk_players_bowling_type FOREIGN KEY (bowling_type_id) REFERENCES bowling_types (bowling_type_id) ON UPDATE CASCADE ON DELETE SET NULL,
        CONSTRAINT fk_players_cricket_class FOREIGN KEY (cricket_class_id) REFERENCES cricket_class (cricket_class_id) ON UPDATE CASCADE ON DELETE SET NULL
    );
