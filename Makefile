MIGRATIONS_PATH=./sql/migrations

include .envrc
migrate:
	migrate -source file://$(MIGRATIONS_PATH) -database "${DATABASE_URL}" up

create_migration:
	migrate create -ext sql -dir $(MIGRATIONS_PATH) $(name)

install_tools:
	go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest

	go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@v4.17.1

	go install github.com/direnv/direnv@latest
	direnv allow .

	type -P "asdf" && echo "asdf in PATH, reshiming..." && asdf reshim

# Cleans example code from template and allows you to commit the changes
clean_template:
	git rm sql/migrations/*
	git rm sql/queries/*