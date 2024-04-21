package pkg

import (
	"log/slog"
	"os"

	"github.com/tomaspinho/go-app-template/config"
)

func init() {
	var logger *slog.Logger
	if config.Config.App.Env == "dev" {
		logger = slog.New(slog.NewTextHandler(os.Stdout, &slog.HandlerOptions{
			Level: slog.LevelDebug,
		}))
	} else {
		level := slog.Level(0)

		err := level.UnmarshalText([]byte(config.Config.Log.Level))

		if err != nil {
			slog.Error("Cannot unmarshal provided LOG_LEVEL", "level", config.Config.Log.Level, "error", err)
			os.Exit(-1)
		}

		logger = slog.New(slog.NewJSONHandler(os.Stdout, &slog.HandlerOptions{
			Level: level,
		}))
	}

	slog.SetDefault(logger)
}
