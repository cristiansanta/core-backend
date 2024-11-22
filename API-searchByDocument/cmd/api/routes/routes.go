package routes

import (
	"SEARCHBYDOCUMENT/cmd/api/handlers/tickets"
	"SEARCHBYDOCUMENT/cmd/api/handlers/victimas"
	"database/sql"

	"github.com/gin-gonic/gin"
)

func RegisterRoutes(e *gin.Engine, db *sql.DB) {
    routeGroup := e.Group("/api/v1/victimas")
    {
        // Se utilizan funciones anónimas para pasar la base de datos al handler
        routeGroup.POST("/", func(c *gin.Context) { victimas.CreateEvent(c, db) })
        routeGroup.GET("/:cedula", func(c *gin.Context) { victimas.GetEventByCedula(c, db) })
        routeGroup.POST("/ticket", func(c *gin.Context) { tickets.Create(c,db) })
    }
}
