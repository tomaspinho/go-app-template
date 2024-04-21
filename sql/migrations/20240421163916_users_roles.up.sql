CREATE TABLE users_roles (
  user_id    bigint    REFERENCES users(id),
  role_id    bigint    REFERENCES roles(id),

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);