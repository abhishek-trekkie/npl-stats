package handler

import (
	"github.com/habu-gabu/npl-stats/internal/config"
	"github.com/habu-gabu/npl-stats/internal/view/page"
	"github.com/labstack/echo/v5"
)

type HomeHandler struct {
	App *config.Application
}

func NewHomeHandler(app *config.Application) *HomeHandler {
	return &HomeHandler{
		App: app,
	}
}

func (h *HomeHandler) Index(c *echo.Context) error {
	return Respond(
		c,
		page.Home(),
		nil)
}
