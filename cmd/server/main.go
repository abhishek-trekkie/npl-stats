package main

import (
	"context"
	"log"

	"github.com/habu-gabu/npl-stats/internal/config"
	"github.com/habu-gabu/npl-stats/internal/router"
	"github.com/habu-gabu/npl-stats/internal/sqlc"

	"github.com/jackc/pgx/v5/pgxpool"
	"github.com/labstack/echo/v5"
	"github.com/labstack/echo/v5/middleware"
)

func main() {

	cfg := &config.Config{}

	config.LoadServerFlags(cfg)

	if err := config.LoadEnv(cfg); err != nil {
		log.Fatal(err)
	}

	pool, err := pgxpool.New(context.Background(), cfg.DatabaseURL)
	if err != nil {
		log.Fatal(err)
	}

	app := &config.Application{
		DB:      pool,
		Config:  cfg,
		Queries: sqlc.New(pool),
	}

	e := echo.New()

	e.Use(middleware.RequestLogger())
	e.Use(middleware.Recover())

	router.MountRoutes(e, app)

	if err := e.Start(":1323"); err != nil {
		e.Logger.Error("failed to start server", "error", err)
	}
}
