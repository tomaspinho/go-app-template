CREATE TABLE roles_permissions (
  role_id       bigint    REFERENCES roles(id),
  permission_id bigint    REFERENCES permissions(id),

  created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);