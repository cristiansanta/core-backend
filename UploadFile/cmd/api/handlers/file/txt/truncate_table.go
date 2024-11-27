package txt

import "fmt"

func (h Handler) TruncateTable() error {
	if err := h.FileService.TruncateTable(); err != nil {
		return fmt.Errorf("error in TruncateTable: %s",err.Error())
	}
	return nil

}