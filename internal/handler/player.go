package handler

import (
	"strconv"

	"github.com/habu-gabu/npl-stats/internal/config"
	"github.com/labstack/echo/v5"
)

type PlayerHandler struct {
	App *config.Application
}

func NewPlayerHandler(app *config.Application) *PlayerHandler {
	return &PlayerHandler{
		App: app,
	}
}

func (h *PlayerHandler) GetPlayer(c *echo.Context) error {
	id := c.Param("id")

	playerID, _ := strconv.Atoi(id)

	player, err := h.App.Queries.GetPlayerByID(c.Request().Context(), int32(playerID))
	if err != nil {
		return c.JSON(500, err.Error())
	}

	return c.JSON(200, player)
}
