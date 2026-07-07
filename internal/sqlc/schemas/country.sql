CREATE TABLE
    country (
        country_id SERIAL PRIMARY KEY,
        name VARCHAR(32) NOT NULL UNIQUE,
        flag_code VARCHAR(8) UNIQUE
    );
