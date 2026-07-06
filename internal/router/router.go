package router

import (
	"github.com/habu-gabu/npl-stats/internal/config"
	"github.com/habu-gabu/npl-stats/internal/handler"
	"github.com/labstack/echo/v5"
)

func registerRoutes(e *echo.Echo, app *config.Application) {
	home := handler.NewHomeHandler(app)

	e.GET("/", home.Index)

	playerHander := handler.NewPlayerHandler(app)
	players := e.Group("/players")
	players.GET("", playerHander.ListPlayers)
	players.GET("/:id", playerHander.GetPlayer)

}

func registerStaticRoutes(e *echo.Echo, app *config.Application) {
	e.Static("/static", app.Config.StaticDir)
}

func MountRoutes(e *echo.Echo, app *config.Application) {
	registerRoutes(e, app)
	registerStaticRoutes(e, app)
}
