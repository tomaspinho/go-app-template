package handlers

import (
	"log/slog"
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/tomaspinho/go-app-template/pkg/db"
)

// Handler
func ListExamples(c echo.Context) error {
	examples, err := db.DB.ListExamples(c.Request().Context())

	if err != nil {
		slog.Error("Error fetching examples", "error", err)
		return c.JSON(http.StatusInternalServerError, map[string]any{
			"error": true,
		})
	}

	return c.JSON(http.StatusOK, echo.Map{
		"examples": examples,
	})
}
