package handlers

import (
	"database/sql"
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

func GetProgramDetails(c *gin.Context, db *sql.DB) {
	// Obtener el documento de identidad desde los parámetros de la URL
	docIdentidad := c.Param("NUM_DOC_IDENTIDAD")

	// Consulta SQL
	query := `SELECT
        RGA.FIC_ID,
        PRF.PRF_DENOMINACION,
        RGA.RGA_ESTADO,
        PRF.PRF_TIPO_PROGRAMA,
        NF.NFS_NOMBRE,
        FIC.FIC_FCH_INICIALIZACION,
        FIC.FIC_FCH_FINALIZACION
    FROM 
        "INTEGRACION".V_REGISTRO_ACADEMICO_B RGA
    INNER JOIN 
        "INTEGRACION".V_FICHA_CARACTERIZACION_B FIC
        ON FIC.FIC_ID = RGA.FIC_ID
    INNER JOIN 
        "INTEGRACION".V_PROGRAMA_FORMACION_B PRF
        ON RGA.PRF_ID = PRF.PRF_ID
    INNER JOIN 
        "C##VICTIMAS".NIVEL_FORMACION NF
        ON FIC.NFS_ID_OFRECIDO = NF.NFS_ID
    INNER JOIN 
        "INTEGRACION".V_PERSONA_B VPB
        ON RGA.NIS = VPB.NIS
    WHERE 
        VPB.NUM_DOC_IDENTIDAD = :docIdentidad`

	// Variables para almacenar los resultados
	var results []map[string]interface{}

	// Ejecutar la consulta
	rows, err := db.Query(query, sql.Named("docIdentidad", docIdentidad))
	if err != nil {
		fmt.Println(err.Error())
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al ejecutar la consulta"})
		return
	}
	defer rows.Close()

	// Iterar sobre los resultados
	for rows.Next() {
		var (
			ficID                string
			prfDenominacion      string
			rgaEstado            string
			prfTipoPrograma      string
			nfsNombre            string
			ficFchInicializacion string
			ficFchFinalizacion   string
		)
		if err := rows.Scan(&ficID, &prfDenominacion, &rgaEstado, &prfTipoPrograma, &nfsNombre, &ficFchInicializacion, &ficFchFinalizacion); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al procesar los resultados"})
			return
		}

		results = append(results, gin.H{
			"FIC_ID":                 ficID,
			"PRF_DENOMINACION":       prfDenominacion,
			"RGA_ESTADO":             rgaEstado,
			"PRF_TIPO_PROGRAMA":      prfTipoPrograma,
			"NFS_NOMBRE":             nfsNombre,
			"FIC_FCH_INICIALIZACION": ficFchInicializacion,
			"FIC_FCH_FINALIZACION":   ficFchFinalizacion,
		})
	}

	// Enviar los resultados como JSON
	c.JSON(http.StatusOK, results)
}
