package domain

// Definir la estructura para manejar los resultados de conteo de etnias
type Etnica struct {
	Indigena                     int `json:"indigena"`
	NegroAfrocolombiano          int `json:"negro_o_afrocolombiano"`
	IndigenaAcreditadoRA         int `json:"indigena_acreditado_ra"`
	GitanoRom                    int `json:"gitano_rom"`
	GitanoRromAcreditadoRA       int `json:"gitano_rrom_acreditado_ra"`
	NegroAfrocolombiano2         int `json:"negro_o_afrocolombiano_2"`
	Palenquero                   int `json:"palenquero"`
	Pertenenciaetnica            int `json:"pertenenciaetnica"`
}
