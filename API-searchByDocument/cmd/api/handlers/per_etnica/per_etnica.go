package per_etnica

import (
	// "SEARCHBYDOCUMENT/internal/domain"
	"database/sql"
	"fmt"

	"github.com/gin-gonic/gin"
)

func Etnica(c *gin.Context, db *sql.DB) {
	counters := []interface{}{}

	// Consulta SQL para contar los diferentes valores de 'PERTENENCIAETNICA'
	query := `SELECT
    COUNT(CASE WHEN "PERTENENCIAETNICA" = 'INDIGENA' THEN 1 END) AS "INDIGENA",
    COUNT(CASE WHEN "PERTENENCIAETNICA" = 'NEGRO(A) O AFROCOLOMBIANO(A)' THEN 1 END) AS "NEGRO(A) O AFROCOLOMBIANO(A)",
    COUNT(CASE WHEN "PERTENENCIAETNICA" = 'INDIGENA (ACREDITADO RA)' THEN 1 END) AS "INDIGENA (ACREDITADO RA)",
    COUNT(CASE WHEN "PERTENENCIAETNICA" = 'GITANO(A) ROM' THEN 1 END) AS "GITANO(A)ROM",
    COUNT(CASE WHEN "PERTENENCIAETNICA" = 'GITANO (RROM) (ACREDITADO RA)' THEN 1 END) AS "GITANO(RROM)(ACREDITADO RA)",
    COUNT(CASE WHEN "PERTENENCIAETNICA" = 'NEGRO(A) O AFROCOLOMBIANO(A)' THEN 1 END) AS "NEGRO(A)O AFROCOLOMBIANO(A)",
    COUNT(CASE WHEN "PERTENENCIAETNICA" = 'PALENQUERO' THEN 1 END) AS "PALENQUERO",
    COUNT(CASE WHEN "PERTENENCIAETNICA" = 'PERTENENCIAETNICA' THEN 1 END) AS "PERTENENCIAETNICA"
FROM 
    public.ruv_victimas rv;`

	// Ejecutar la consulta con el parámetro dinámico
	rows, err := db.Query(query)

	if err != nil {
		fmt.Printf("could not do query in GetLineaAtencion:%s", err.Error())
		c.JSON(500, gin.H{"error": "Server internal error"})
		return
	}
	defer rows.Close()

	// Crear una estructura para almacenar el resultado del conteo
	var result struct {
		Indigena               int `json:"indigena"`
		NegroAfrocolombiano    int `json:"negro_o_afrocolombiano"`
		IndigenaAcreditadoRA   int `json:"indigena_acreditado_ra"`
		GitanoRom              int `json:"gitano_rom"`
		GitanoRromAcreditadoRA int `json:"gitano_rrom_acreditado_ra"`
		NegroAfrocolombiano2   int `json:"negro_o_afrocolombiano_2"`
		Palenquero             int `json:"palenquero"`
		Pertenenciaetnica      int `json:"pertenenciaetnica"`
	}

	
 
	// Escanear los resultados de la consulta
	for rows.Next() {
		if err := rows.Scan(
			&result.Indigena,
			&result.NegroAfrocolombiano,
			&result.IndigenaAcreditadoRA,
			&result.GitanoRom,
			&result.GitanoRromAcreditadoRA,
			&result.NegroAfrocolombiano2,
			&result.Palenquero,
			&result.Pertenenciaetnica,
		); err != nil {
			c.JSON(500, gin.H{"error": "Error al procesar los resultados: " + err.Error()})
			return
		}

		counters = append(counters,result)

}

	// Responder con los datos de los conteos
	c.JSON(200, gin.H{
		"data": counters,
	})
}
