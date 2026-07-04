package handler

import (
	"github.com/habu-gabu/npl-stats/internal/view/page"
	"github.com/labstack/echo/v5"
)

func Home(c *echo.Context) error {
	c.Response().Header().Set(echo.HeaderContentType, echo.MIMETextHTMLCharsetUTF8)

	return page.Home().Render(
		c.Request().Context(),
		c.Response(),
	)
}
