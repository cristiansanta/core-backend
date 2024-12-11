package txt

import "fmt"

func (h Handler) SaveContent(mainFilePath string, channel chan<- map[string]interface{}) {

	fmt.Print("Linea 49 en SaveContent")

	// defer wg.Done()
	err := h.FileService.SaveContent(mainFilePath)
	response := map[string]interface{}{
		"error":         nil,
		"error_message": "Internal server error",
		"code":          500,
	}

	if err != nil {
		response["error"] = err
		channel <- response
		return
	} else {
		if err := h.Delete(mainFilePath); err != nil {
			response["error"] = err
		} else if err := h.SaveMainTable(); err != nil {
			response["error"] = err
		}
		channel <- response

	}

}
