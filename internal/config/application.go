package config

import (
	"flag"
	"os"

	"github.com/habu-gabu/npl-stats/internal/sqlc"
	"github.com/jackc/pgx/v5/pgxpool"
	"github.com/joho/godotenv"
)

type Application struct {
	DB      *pgxpool.Pool
	Config  *Config
	Queries *sqlc.Queries
}
type Config struct {
	Host      string
	Port      int
	StaticDir string

	DatabaseURL string
	JWTSecret   string
}

func LoadServerFlags(cfg *Config) {
	flag.StringVar(&cfg.Host, "host", "0.0.0.0", "Server host")
	flag.IntVar(&cfg.Port, "port", 1323, "Server port")
	flag.StringVar(&cfg.StaticDir, "static-dir", "static", "Static files directory")

	flag.Parse()
}

func LoadEnv(cfg *Config) error {
	if err := godotenv.Load(); err != nil {
		return err
	}

	cfg.DatabaseURL = os.Getenv("DATABASE_URL")
	cfg.JWTSecret = os.Getenv("JWT_SECRET")

	return nil
}
