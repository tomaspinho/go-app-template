MIGRATIONS_PATH=./sql/migrations

include .envrc

DATABASE_URL_NO_OPTS=$(shell echo "${DATABASE_URL}" | sed -e "s/\?.*//g")
DATABASE_NAME=$(shell basename ${DATABASE_URL_NO_OPTS})
DATABASE_HOST=$(shell dirname ${DATABASE_URL_NO_OPTS})
drop_db:
	psql "$(DATABASE_HOST)" -c "drop database $(DATABASE_NAME)"

create_db:
	psql "$(DATABASE_HOST)" -c "create database $(DATABASE_NAME)"

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
	git rm pkg/db/*

# Makes the template your own by replacing all references to github.com/lol/new
# with the new module name. Set MODULE_NAME
own:
	find . -type f -exec sed -i 's#github\.com/tomaspinho/go-app-template#$(MODULE_NAME)#g' {} +