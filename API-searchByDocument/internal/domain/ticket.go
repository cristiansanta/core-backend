package domain


type Ticket struct {
	Id_ticket int `json:"id_ticket"`
	Titulo string `json:"titulo"`
	Contenido string `json:"contenido"`
	Palabras_claves string `json:"palabras_clave"`
	Numero_documento int `json:"numero_documento"`
	Id_usuario int `json:"id_usuario"`
}