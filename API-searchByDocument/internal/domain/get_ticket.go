package domain

type Tickets struct {
    FechaHora  string `json:"fecha_hora"`
    IDTicket   int    `json:"id_ticket"`
    Titulo     string `json:"titulo"`
    Contenido  string `json:"contenido"`
}