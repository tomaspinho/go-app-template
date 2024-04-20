-- name: Getexample :one
SELECT * FROM examples
WHERE id = $1 LIMIT 1;

-- name: ListExamples :many
SELECT * FROM examples
ORDER BY name;

-- name: CreateExample :one
INSERT INTO examples (
  name, description
) VALUES (
  $1, $2
)
RETURNING *;

-- name: UpdateExample :exec
UPDATE examples
  set name = $2,
  description = $3
WHERE id = $1;

-- name: DeleteExample :exec
DELETE FROM examples
WHERE id = $1;