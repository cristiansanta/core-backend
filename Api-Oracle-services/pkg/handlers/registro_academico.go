package handlers

import (
	"database/sql"
	"net/http"
	"github.com/gin-gonic/gin"
)

func GetRegistroByID(c *gin.Context, db *sql.DB) {
	query := `
        SELECT 
            SUM(CASE WHEN rg."RGA_ESTADO" = '7' THEN 1 ELSE 0 END) AS "APRENDICES_EN_FORMACION",
            SUM(CASE WHEN rg."RGA_ESTADO" = '3' THEN 1 ELSE 0 END) AS "APRENDICES_CERTIFICADOS",
            SUM(CASE WHEN rg."RGA_ESTADO" = '12' THEN 1 ELSE 0 END) AS "APRENDICES_POR_CERTIFICAR",
            SUM(CASE WHEN rg."RGA_ESTADO" = '2' THEN 1 ELSE 0 END) AS "APRENDICES_CANCELADOS"
        FROM 
            "INTEGRACION"."V_REGISTRO_ACADEMICO_B" rg`

	// Variables para almacenar los resultados
	var aprendicesEnFormacion, aprendicesCertificados, aprendicesPorCertificar, aprendicesCancelados int

	// Ejecutar la consulta y escanear los resultados
	err := db.QueryRow(query).Scan(
		&aprendicesEnFormacion,
		&aprendicesCertificados,
		&aprendicesPorCertificar,
		&aprendicesCancelados,
	)
	if err != nil {
		if err == sql.ErrNoRows {
			// Manejar el caso en el que no hay resultados
			c.JSON(http.StatusNotFound, gin.H{"error": "No se encontraron registros en la tabla"})
			return
		}
		// Manejar otros errores de la base de datos
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al consultar la base de datos"})
		return
	}

	// Retornar los resultados en formato JSON
	c.JSON(http.StatusOK, gin.H{
		"APRENDICES_EN_FORMACION":   aprendicesEnFormacion,
		"APRENDICES_CERTIFICADOS":   aprendicesCertificados,
		"APRENDICES_POR_CERTIFICAR": aprendicesPorCertificar,
		"APRENDICES_CANCELADOS":     aprendicesCancelados,
	})
}
