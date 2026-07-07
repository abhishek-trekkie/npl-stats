CREATE TABLE
    cricket_class (
        cricket_class_id SERIAL PRIMARY KEY,
        name VARCHAR(30) NOT NULL UNIQUE,
        is_specialist BOOLEAN NOT NULL,
        abbreviation VARCHAR(10) NOT NULL UNIQUE,
        description TEXT
    );
