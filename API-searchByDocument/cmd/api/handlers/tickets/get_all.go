package tickets

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
	tickets := []domain.Ticket{}
	var ticket domain.Ticket

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





	rows,err := db.Query(`SELECT "ID_TICKET","TITULO", "CONTENIDO", "PALABRAS_CLAVES", "NUMERO_DOCUMENTO","ID_USUARIO" FROM public.tickets LIMIT $1 OFFSET $2`,pageSize,offset)


	if err != nil{
		fmt.Printf("ocurrion un error en GetAll: %s",err.Error())
		c.JSON(500, gin.H{"error": "Internal server error"})
		return
	}

	defer rows.Close()




	for rows.Next() {
		if err := rows.
		Scan(
			&ticket.Id_ticket,&ticket.Titulo,&ticket.Contenido,&ticket.Palabras_claves,&ticket.Numero_documento,&ticket.Id_usuario); err != nil{
				fmt.Printf("error scaneando los datos: %s",err.Error())
				c.JSON(500, gin.H{"error": "Error al ejecutar la consulta: " + err.Error()})
				return

			}


			tickets = append(tickets, ticket)
	}

	c.JSON(200,gin.H{"data": tickets})


	
}
