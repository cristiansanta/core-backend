package routes

import (
	"SEARCHBYDOCUMENT/pkg/handlers" // Ajustar según el path real de tu proyecto
	"database/sql"

	"github.com/gin-gonic/gin"
)

func InitRoutes(router *gin.Engine, db *sql.DB) {
	// Rutas de API versión 1
	api := router.Group("/api/v1")
	{
		// Ruta para obtener los contadores globales sin filtro de ID
		api.GET("/registro", func(c *gin.Context) {
			handlers.GetRegistroByID(c, db)
		})
		api.GET("/programa/:NUM_DOC_IDENTIDAD", func(c *gin.Context) {
			handlers.GetProgramDetails(c, db)
		})

	}
}
