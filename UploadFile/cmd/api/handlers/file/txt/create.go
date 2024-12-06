package txt

import (
	// "context"
	// "errors"
	"fmt"
	"mime/multipart"
	"strconv"

	// "sync"

	"github.com/gin-gonic/gin"
)

func (h Handler) Create(ctx *gin.Context, file *multipart.FileHeader) {
	//Traducir el request
	//Validacion
	//Consumir un servicio
	//Traducir el response

	// contextTimeout, cancel := context.WithTimeout(context.Background(), 7*time.Minute)
	channel := make(chan map[string]interface{})
	response := make(map[string]interface{})
	mainFilePath := ""
	mainResponse := map[string]interface{}{
		"code":    200,
		"message": "file upload successfully",
	}

	sizeMainFileStr := ctx.PostForm("sizeMainFile")
	sizeMainFile, err := strconv.Atoi(sizeMainFileStr)

	if err != nil {
		fmt.Printf("sizeMainFile is not a valid integer in Create: %s", err.Error())
		ctx.JSON(400, gin.H{"error": "Invalid data format. Please ensure the data is formatted correctly."})
		return
	}

	//--------------------------------------------
	go h.FileService.Create(ctx, file, sizeMainFile, channel)

	response = <-channel
	if err := response["error"]; err != nil {
		fmt.Printf("filed to create file: %s", err.(error).Error())
		mainResponse["code"] = response["code"]
		mainResponse["message"] = response["error_message"]
	}

	if ok := response["upload_file"]; ok.(bool) {
		fmt.Print("Linea 49 en Create")
		mainFilePath = response["path_file"].(string)

		go h.SaveContent(mainFilePath, channel)
		if response = <-channel; response["error"] != nil {
			mainResponse["code"] = response["code"]
			mainResponse["message"] = response["error_message"]
			fmt.Printf("failed save contend in handler SaveContent: %s", response["error"].(error).Error())
		} else {
			fmt.Println("file load in database successfully")
		}

	}
	ctx.JSON(mainResponse["code"].(int), gin.H{"message": mainResponse["message"]})

	close(channel)

	//-----------------------------------------------------------

}
