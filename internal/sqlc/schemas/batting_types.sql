CREATE TABLE
    batting_types (
        batting_type_id SERIAL PRIMARY KEY,
        name VARCHAR(30) NOT NULL UNIQUE,
        hand VARCHAR(5) NOT NULL CHECK (hand IN ('Right', 'Left')),
        style VARCHAR(20) NOT NULL CHECK (style IN ('Conventional', 'Switch-Hit')),
        abbreviation VARCHAR(5) NOT NULL UNIQUE
    );
