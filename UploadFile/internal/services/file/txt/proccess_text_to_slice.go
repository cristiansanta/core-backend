package txt

import "fmt"

var incompleteArrays [][]string

// fillIncompleteArray llena un arreglo incompleto
func (s Service) FillIncompleteSlice(rows []string) ([]string,int) {
	lenghtIncompleteArray := len(incompleteArrays[0])
	quantity := s.TabRow - lenghtIncompleteArray

	for i := 0; i < quantity; i++ {
		incompleteArrays[0] = append(incompleteArrays[0], rows[i])
		// if i+1 == quantity {
		// 	break
		// }
	}

	return incompleteArrays[0],lenghtIncompleteArray
}

func (s Service) ProccessTextToSlice(text string) [][]string {
	//convert text to slice
	//filter slice
	//fild incomplete slice
	//convert slice to double slice

	// Convert text to slice
	rows := s.convertTextToSlice(text)
	// Filter rows
	filterRows := s.FilterFields(rows)

	// Initial double array
	doubleArray := [][]string{}
	offset := 0

	for i := 0; i < len(filterRows); i += s.TabRow {
		if len(incompleteArrays) > 0 {
			fmt.Printf("Arrays incompletos: %s",incompleteArrays)
			arrayComplete,lenghtIncompleteArray := s.FillIncompleteSlice(filterRows)
			fmt.Printf("Array completo:%s",arrayComplete)
			// Agrega el array completo a doubleArray
			doubleArray = append(doubleArray, arrayComplete)
			filterRows = filterRows[lenghtIncompleteArray:] 
			incompleteArrays = [][]string{} // Vacía el array de incompletos
		}

		if i == 0 && filterRows[i] == s.Columns[i]{
			i+=s.TabRow
			continue
		}
		
		col := filterRows[i:min(i+s.TabRow, len(filterRows))] // Obtener un sub-slice
		// if i == 0{
		// 	fmt.Printf("Primera fila: %s",col)
		// }
		if len(col) == s.TabRow {
			doubleArray = append(doubleArray, col)
		} else if len(col) < s.TabRow {
			incompleteArrays = append(incompleteArrays, col)
		}

		// if i + 1 > len(filterRows){
		// 	fmt.Printf("Ultima fila: %s",col)

		// }

		offset += s.TabRow
	}
	return doubleArray
}