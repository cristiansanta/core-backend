package txt

var incompleteArrays [][]string

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

		if i == 0 && filterRows[i] == s.Columns[i]{
			i+=s.TabRow
			continue
		}
		col := filterRows[i:min(i+s.TabRow, len(filterRows))] // Obtener un sub-slice
		if len(col) == s.TabRow {
			doubleArray = append(doubleArray, col)
		} else if len(col) < s.TabRow {
			incompleteArrays = append(incompleteArrays, col)
		}
		offset += s.TabRow
	}
	return doubleArray
}