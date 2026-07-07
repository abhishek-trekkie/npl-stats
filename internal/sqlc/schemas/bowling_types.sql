CREATE TABLE
    bowling_types (
        bowling_type_id SERIAL PRIMARY KEY,
        name VARCHAR(50) NOT NULL UNIQUE,
        arm VARCHAR(5) NOT NULL CHECK (arm IN ('Right', 'Left')),
        category VARCHAR(10) NOT NULL CHECK (category IN ('Pace', 'Spin')),
        pace_class VARCHAR(20),
        spin_type VARCHAR(20),
        abbreviation VARCHAR(10) NOT NULL UNIQUE,
        CHECK (
            (
                category = 'Pace'
                AND pace_class IS NOT NULL
                AND spin_type IS NULL
            )
            OR (
                category = 'Spin'
                AND spin_type IS NOT NULL
                AND pace_class IS NULL
            )
        )
    );
