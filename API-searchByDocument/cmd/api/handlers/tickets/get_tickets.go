package tickets

import (
	"SEARCHBYDOCUMENT/internal/domain"
	"database/sql"
	"fmt"

	"github.com/gin-gonic/gin"
)

func GetTickets(c *gin.Context, db *sql.DB) {
	tickets := []domain.Tickets{} // Asegúrate de que `Ticket` esté definido en tu dominio
	numeroDocumento := c.Param("numero_documento")

	if numeroDocumento == "" {
		c.JSON(400, gin.H{"error": "El parámetro 'numero_documento' es requerido"})
		return
	}

	query := `
		SELECT 
			x."FECHA_HORA",
			x."ID_TICKET",
			x."TITULO",
			x."CONTENIDO"
		FROM public.tickets x 
		WHERE "NUMERO_DOCUMENTO" = $1;
	`

	// Ejecutar la consulta con el parámetro dinámico
	rows, err := db.Query(query, numeroDocumento)
	if err != nil {
		fmt.Printf("could not do query in getTickets: %s", err.Error())
		c.JSON(500, gin.H{"error": "Error interno del servidor"})
		return
	}
	defer rows.Close()

	for rows.Next() {
		var ticket domain.Tickets
		if err := rows.Scan(&ticket.FechaHora, &ticket.IDTicket, &ticket.Titulo, &ticket.Contenido); err != nil {
			if err == sql.ErrNoRows {
				c.JSON(404, gin.H{"error": "No se encontraron resultados"})
			} else {
				c.JSON(500, gin.H{"error": "Error al escanear la consulta: " + err.Error()})
			}
			return
		}
		tickets = append(tickets, ticket)
	}

	if len(tickets) == 0 {
		c.JSON(404, gin.H{"error": "No se encontraron resultados"})
		return
	}

	c.JSON(200, gin.H{"data": tickets})
}
