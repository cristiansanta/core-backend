package txt


func (h Handler) SaveContent(mainFilePath string, channel chan<- map[string]interface{}) {

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
		h.Delete(mainFilePath)
		
		if err := h.SaveMainTable(); err != nil{
			response["error"] = err
		}
		channel <- response

	}

}
