package pkg

import (
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"

	"github.com/tomaspinho/go-app-template/config"
	"github.com/tomaspinho/go-app-template/pkg/handlers"
)

func Run() {
	// Echo instance
	e := echo.New()

	// Middleware
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	// Routes
	e.GET("/examples/", handlers.ListExamples)

	// Start server
	e.Logger.Fatal(e.Start(":" + config.Config.App.Port))
}
