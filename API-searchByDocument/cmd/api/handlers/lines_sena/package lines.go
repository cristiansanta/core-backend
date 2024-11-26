package lines_sena

import (
	"SEARCHBYDOCUMENT/internal/domain"
	"database/sql"

	"github.com/gin-gonic/gin"
)

func GetLineaAtencion(c *gin.Context, db *sql.DB) {
	departamento := c.Param("departamento")
	if departamento == "" {
		c.JSON(400, gin.H{"error": "El parámetro 'departamento' es requerido"})
		return
	}

	query := `SELECT 
                 laa.departamento,
                 laa.ciudad,
                 laa.contacto,
                 laa.direccion,
                 laa.horario_atencion,
                 laa.telefono 
              FROM public."LINEA_ATENCION_SENA" laa 
              WHERE departamento = $1;`

	// Ejecutar la consulta con el parámetro dinámico
	row := db.QueryRow(query, departamento)

	var result domain.LineaAtencion
	if err := row.Scan(&result.Departamento, &result.Ciudad, &result.Contacto, &result.Direccion, &result.HorarioAtencion, &result.Telefono); err != nil {
		if err == sql.ErrNoRows {
			c.JSON(404, gin.H{"error": "No se encontraron resultados"})
		} else {
			c.JSON(500, gin.H{"error": "Error al ejecutar la consulta: " + err.Error()})
		}
		return
	}

	c.JSON(200, gin.H{"data": result})
}



