package txt

import (
	"fmt"
	"regexp"
	"strings"
)



// filterFields filtra los campos de un texto dado según las opciones y el número de filas de tabla.
func (s Service)FilterFields(text []string) []string {
	deleteValue := s.FilterWords[0]
	result := []string{}

	regex := regexp.MustCompile(fmt.Sprintf(`.+%s`, regexp.QuoteMeta(deleteValue)))
	indexInsert := -1
	oldValue := ""

	
	for index, row := range text {
		row = strings.ReplaceAll(row, "\n", "")
		row = strings.ReplaceAll(row, "\t", "")
		oldValue = row

		if regex.MatchString(row) {
			indexInsert = index + 1 // Establece la posición para insertar el deleteValue en la siguiente fila
			result = append(result, strings.Replace(row, deleteValue, "", -1))
		} else if index == indexInsert {
			result = append(result, deleteValue) // Inserta el deleteValue en la siguiente fila
			result = append(result, oldValue)    // Luego inserta el valor original que fue reemplazado
			indexInsert = -1                     // Reinicia el índice de inserción
		} else {
			result = append(result, row) // Si no es un caso de reemplazo, inserta el valor original
		}
	}

	return result
}
