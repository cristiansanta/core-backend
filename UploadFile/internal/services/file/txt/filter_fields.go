package txt

import (
	"fmt"
	"regexp"
	"strings"
)



// filterFields filtra los campos de un texto dado según las opciones y el número de filas de tabla.
func (s Service)FilterFields(text []string) []string {
	deleteValue := s.FilterWords[0]
	// emptyValue := s.FilterWords[1]
	result := []string{}

	regex := regexp.MustCompile(fmt.Sprintf(`.+%s`, regexp.QuoteMeta(deleteValue)))
	indexInsert := -1
	// offset := s.TabRow
	oldValue := ""

	
	for index, row := range text {
		// row = strings.TrimSpace(row)
		row = strings.ReplaceAll(row, "\n", "")
		row = strings.ReplaceAll(row, "\t", "")
		oldValue = row

		// if index < len(s.Columns){
		// 	fmt.Println("Valor viejo antes del if"+oldValue)
		// 	fmt.Printf("ultimo dato row:%s y ultimo dato columna: %s",row,s.Columns[index])
		// }

		// if index == len(s.Columns) - 1{
		// 	if s.Columns[index] == oldValue{
		// 		fmt.Printf("Es verdad la columna %s y el oldValue %s",s.Columns[index],oldValue)
		// 	}else{
		// 		fmt.Printf("Es falso la columna %s y el oldValue %s",s.Columns[index],oldValue)
		// 	}
		// }

		// if index < len(s.Columns) && (oldValue == s.Columns[index] || oldValue == strings.Replace(s.Columns[index],"_","",1)){
		// 	// fmt.Printf("columnas:%s,indice: %d,oldValue:%s",s.Columns[index],index,oldValue)
		// 	continue
		// }
		// fmt.Print("nnn")

		// if index == len(s.Columns){
		// 	fmt.Print("Despues de columnas "+oldValue)
		// }




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

		// if len(result) == offset{
		// 	lastIndex := offset - 1
		// 	if result[lastIndex] == " "{
		// 		fmt.Print("Si hay espacio en blanco")
		// 	}
		// 	fmt.Printf("Linea 37 ultimo %s y penultimo %s",result[lastIndex],result[lastIndex - 1])
		// 	if result[lastIndex] == deleteValue{
		// 	fmt.Print("Linea 41")
		// 		result = append(result[:lastIndex], append([]string{"NULL"}, result[lastIndex:]...)...)
		// 	}
		// 	// fmt.Print("Linea 43")
		// 	offset += s.TabRow 
			
		// }

	}

	return result
}