package routes

import (
    "SEARCHBYDOCUMENT/cmd/api/handlers/victimas"
    "database/sql"
    "github.com/gin-gonic/gin"
)

func RegisterRoutes(e *gin.Engine, db *sql.DB) {
    victimasGroup := e.Group("/api/v1/victimas")
    {
        // Se utilizan funciones anónimas para pasar la base de datos al handler
        victimasGroup.POST("/", func(c *gin.Context) { victimas.CreateEvent(c, db) })
        victimasGroup.GET("/:cedula", func(c *gin.Context) { victimas.GetEventByCedula(c, db) })
    }
}
