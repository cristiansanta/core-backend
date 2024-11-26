package tickets

import (
	"SEARCHBYDOCUMENT/internal/domain"
	"database/sql"

	"github.com/gin-gonic/gin"
)

func Create(c *gin.Context, db *sql.DB) {
	var ticket domain.Ticket

	if err := c.ShouldBindJSON(&ticket); err != nil{
		c.JSON(500, gin.H{"error": "Error en los datos de entrada: " + err.Error()})
		return
	}

	query := `INSERT INTO tickets ("ID", "ID_TICKET", "CONTENIDO", "PALABRAS_CLAVES", "NUMERO_DOCUMENTO","ID_USUARIO") VALUES(nextval('tags_id_seq'::regclass), $1, $2, $3, $4, $5);`


if _,err :=  db.Exec(query,ticket.Id_ticket, ticket.Contenido, ticket.Palabras_claves, ticket.Numero_documento, ticket.Id_usuario); err != nil{
	c.JSON(500, gin.H{"error": "Error al crear el registro: " + err.Error()})
        return
}

c.JSON(200,gin.H{"msg":"register created succesfully"})
}