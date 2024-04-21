CREATE TABLE "examples" (
  id           BIGSERIAL PRIMARY KEY,

  name         text      NOT NULL,
  description  text,

  created_at TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP   DEFAULT CURRENT_TIMESTAMP
);
