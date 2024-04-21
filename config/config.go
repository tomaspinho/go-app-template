package config

import (
	"log/slog"
	"os"

	"github.com/caarlos0/env/v11"
)

type Configuration struct {
	App struct {
		Port string `env:"PORT" envDefault:"8080"`
		Env  string `env:"ENV" envDefault:"dev"`
	} `envPrefix:"APP_"`

	DB struct {
		URL string `env:"URL"`
	} `envPrefix:"DATABASE_"`

	Log struct {
		Level string `env:"LEVEL" envDefault:"info"`
	} `envPrefix:"LOG_"`
}

var Config *Configuration

func init() {
	Config = &Configuration{}
	if err := env.Parse(Config); err != nil {
		slog.Error("Error parsing config", err)
		os.Exit(-1)
	}
}
