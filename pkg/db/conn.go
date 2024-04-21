package db

import (
	"context"
	"log/slog"
	"os"

	"github.com/tomaspinho/go-app-template/config"

	"github.com/jackc/pgx/v5/pgxpool"
)

var DBPool *pgxpool.Pool
var DB *Queries

func init() {
	pool, err := pgxpool.New(context.Background(), config.Config.DB.URL)

	if err != nil {
		slog.Error("Error creating database connection pool", "error", err)
		os.Exit(-1)
	}

	DBPool = pool

	DB = New(DBPool)
}
