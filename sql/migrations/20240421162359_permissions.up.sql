CREATE TYPE operation_type AS ENUM ('CREATE', 'READ', 'UPDATE', 'DELETE');

CREATE TABLE permissions (
  id          BIGSERIAL    PRIMARY KEY,
  name        VARCHAR(50)  UNIQUE NOT NULL,
  description VARCHAR(100),
  operation   operation_type
);