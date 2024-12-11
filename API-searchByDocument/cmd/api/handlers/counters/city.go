package counters

import (
	"SEARCHBYDOCUMENT/internal/domain"
	"database/sql"
	"fmt"

	"github.com/gin-gonic/gin"
)



func GetCities(c *gin.Context, db *sql.DB) {
	cities := []domain.City{}

	query := `SELECT "CIUDAD", COUNT(*) AS "cantidad_repeticiones"
	FROM public.ruv_victimas_temp
	GROUP BY "CIUDAD"
	having "CIUDAD" <> 'NULL'
	ORDER BY "cantidad_repeticiones" DESC
	LIMIT 10;`

	// Ejecutar la consulta con el parámetro dinámico
	rows, err := db.Query(query)

	if err != nil {
		fmt.Printf("could not do query in GetCities:%s", err.Error())
		c.JSON(500, gin.H{"error": "Server internal error"})
		return
	}

	defer rows.Close()

	var result domain.City
	for rows.Next() {
		if err := rows.Scan(&result.Ciudad,&result.Cantidad_repeticiones); err != nil {
			if err == sql.ErrNoRows {
				c.JSON(404, gin.H{"error": "No se encontraron resultados"})
			} else {
				c.JSON(500, gin.H{"error": "Error al ejecutar la consulta: " + err.Error()})
			}
			return
		}

		cities = append(cities, result)

	}

	c.JSON(200, gin.H{"data": cities})
}
