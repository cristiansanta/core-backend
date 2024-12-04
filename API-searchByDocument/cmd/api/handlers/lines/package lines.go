package lines

import (
	"SEARCHBYDOCUMENT/internal/domain"
	"database/sql"
	"fmt"

	"github.com/gin-gonic/gin"
)

func GetLineaAtencion(c *gin.Context, db *sql.DB) {
	departamento := c.Param("departamento")
	lineasAtencion := []domain.LineaAtencion{}
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
              FROM public."LINEA_ATENCION_APE" laa 
              WHERE departamento = $1;`

	// Ejecutar la consulta con el parámetro dinámico
	rows,err := db.Query(query, departamento)

	if err != nil{
		fmt.Printf("could not do query in GetLineaAtencion:%s",err.Error())
		c.JSON(500, gin.H{"error": "Server internal error"})
		return
	}

	defer rows.Close()

	
	var result domain.LineaAtencion
	for rows.Next(){
		if err := rows.Scan(&result.Departamento, &result.Ciudad, &result.Contacto, &result.Direccion, &result.HorarioAtencion, &result.Telefono); err != nil {
			if err == sql.ErrNoRows {
				c.JSON(404, gin.H{"error": "No se encontraron resultados"})
			} else {
				c.JSON(500, gin.H{"error": "Error al ejecutar la consulta: " + err.Error()})
			}
			return
		}

		lineasAtencion =  append(lineasAtencion,result)


	}



	c.JSON(200, gin.H{"data": lineasAtencion})
}



