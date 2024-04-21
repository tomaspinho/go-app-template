CREATE TABLE roles (
    id    BIGSERIAL    PRIMARY KEY,

    name        VARCHAR(50) UNIQUE NOT NULL,
    description VARCHAR(100),

    created_at  TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP   DEFAULT CURRENT_TIMESTAMP
);