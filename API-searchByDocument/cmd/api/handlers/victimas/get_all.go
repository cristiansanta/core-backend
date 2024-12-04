package victimas

import (
	"SEARCHBYDOCUMENT/internal/domain"
	"database/sql"
	"strconv"

	// "encoding/json"
	"fmt"
	// "io"

	// "strconv"

	"github.com/gin-gonic/gin"
)

func GetAll(c *gin.Context, db *sql.DB) {
	victimas := []domain.Victima{}
	var victima domain.Victima

		// Obtener parámetros de consulta
	pageParam := c.DefaultQuery("page", "1")
	pageSizeParam := c.DefaultQuery("pageSize", "10")

	page,err := strconv.Atoi(pageParam)

	if err != nil || page < 1 {
		c.JSON(400, gin.H{"error": "Error el parametro page es incorrecto: " + err.Error()})
	}
	
	pageSize,err := strconv.Atoi(pageSizeParam)

	if err != nil || pageSize < 1 {
		c.JSON(400, gin.H{"error": "Error el parametro pageSize es incorrecto: " + err.Error()})
	}


	offset := (page - 1) * pageSize





	rows,err := db.Query(`SELECT "ID_PERSONA", "ID_HOGAR", "TIPO_DOCUMENTO", "DOCUMENTO", 
            "PRIMERNOMBRE", "SEGUNDONOMBRE", "PRIMERAPELLIDO", "SEGUNDOAPELLIDO", "FECHANACIMIENTO", 
            "PERTENENCIAETNICA", "GENERO", 
            "HECHO", "FECHAOCURRENCIA", "CODDANEMUNICIPIOOCURRENCIA", 
            "PRESUNTOACTOR","FECHAREPORTE", "TIPOPOBLACION", 
            "TIPOVICTIMA", "PAIS", "CIUDAD", "CODDANEMUNICIPIORESIDENCIA", 
            "FECHAVALORACION", "ESTADOVICTIMA", 
            "NOMBRECOMPLETO", "IDSINIESTRO", "IDMIJEFE", "TIPODESPLAZAMIENTO", 
            "CONSPERSONA", "RELACION", "CODDANEDECLARACION", "CODDANELLEGADA", 
            "CODIGOHECHO", "DISCAPACIDAD", "DESCRIPCIONDISCAPACIDAD", "FUD_FICHA", "AFECTACIONES" FROM public.ruv_victimas LIMIT $1 OFFSET $2`,pageSize,offset)


	if err != nil{
		fmt.Printf("ocurrion un error en GetAll: %s",err.Error())
		c.JSON(500, gin.H{"error": "Internal server error"})
		return
	}

	defer rows.Close()




	for rows.Next() {
		if err := rows.
		Scan(
			&victima.IdPersona, &victima.IdHogar, &victima.TipoDocumento, &victima.Documento,
			&victima.PrimerNombre, &victima.SegundoNombre, &victima.PrimerApellido, &victima.SegundoApellido, &victima.FechaNacimiento,
			&victima.PertenenciaEtnica, &victima.Genero,
			&victima.Hecho, &victima.FechaOcurrencia, &victima.CodDaneMunicipioOcurrencia,
			 &victima.PresuntoActor,&victima.FechaReporte, &victima.TipoPoblacion,
			&victima.TipoVictima, &victima.Pais, &victima.Ciudad, &victima.CodDaneMunicipioResidencia, &victima.FechaValoracion, &victima.EstadoVictima,
			&victima.NombreCompleto, &victima.IdSiniestro, &victima.IdMiJefe, &victima.TipoDesplazamiento,
			&victima.ConsPersona, &victima.Relacion, &victima.CodDaneDeclaracion, &victima.CodDaneLlegada,
			&victima.CodigoHecho, &victima.Discapacidad, &victima.DescripcionDiscapacidad, &victima.FudFicha, &victima.Afectaciones); err != nil{
				fmt.Printf("error scaneando los datos: %s",err.Error())
				c.JSON(500, gin.H{"error": "Error al ejecutar la consulta: " + err.Error()})
				return

			}


			victimas = append(victimas, victima)
	}

	c.JSON(200,gin.H{"data": victimas})


	
}
