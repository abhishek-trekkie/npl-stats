package handler

import (
	"net/http"
	"strings"

	"github.com/a-h/templ"
	"github.com/labstack/echo/v5"
)

func Respond(c *echo.Context, component templ.Component, data any) error {
	accept := c.Request().Header.Get(echo.HeaderAccept)

	if strings.Contains(accept, echo.MIMEApplicationJSON) {
		return c.JSON(http.StatusOK, data)
	}

	c.Response().Header().Set(echo.HeaderContentType, echo.MIMETextHTMLCharsetUTF8)
	return component.Render(c.Request().Context(), c.Response())
}
