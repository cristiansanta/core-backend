package txt

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strings"
	"sync"

	// "github.com/jackc/pgx/v5/pgxpool"
	// "sync"
	// "github.com/jackc/pgx/v5/pgxpool"
	"golang.org/x/text/transform"
)

func (s Service) SaveContent(mainFilePath string) error {
	//open file
	//read file
	//decode content
	//save in database

	//mainfile path

	openedFile, err := os.Open(mainFilePath)
	var wg sync.WaitGroup
	channel := make(chan map[string]interface{})


	// var db_connection *pgxpool.Pool

	if err != nil {
		return fmt.Errorf("could not open file: %s", err.Error())
	}

	//Cerrar el archivo
	defer openedFile.Close()

	//close waitGroup
	// defer wg.Done()

	reader := bufio.NewReader(openedFile)
	//Tamaño buffer 125mb
	buffer := make([]byte, 125*1024*1024)
	leftOver := ""
	// counter := 1

	for {
		n, err := reader.Read(buffer)
		if n > 0 {
			fmt.Println("Linea 40")
			decodeChunk, _, decodeErr := transform.Bytes(s.Decoder, buffer[:n])
			if decodeErr != nil {
				return fmt.Errorf("decoding error :%s", decodeErr.Error())
			}
			text := leftOver + string(decodeChunk)
			leftOver = ""

			// Encontrar la última posición de un espacio
			// lastDelim := strings.LastIndex(text, s.Character)
			lastDelim := strings.LastIndex(text, "\n")

			if lastDelim == -1 {
				lastDelim = len(text) // No hay delimitador, procesar todo
			}

			// Procesar hasta el último delimitador
			processedChunk := text[:lastDelim]
			leftOver = text[lastDelim:]
			// fmt.Print(leftOver)

			data := s.ProccessTextToSlice(string(processedChunk))
			dataFilter := s.FilterRows(data)

			rowsInterface := s.ToInterfaceSlice(dataFilter)
			// if counter == 2{
			// 	fmt.Print(rowsInterface)
			// }
			// (string(decodeChunk), 53, "UNIDAD VICTIMAS")
			wg.Add(1)
			go s.Repo.CopyFrom(s.Columns, rowsInterface, s.TemporaryTable, channel, &wg)

			if err := <-channel; err["error"] != nil {
				return fmt.Errorf("error could not execute copyfrom in SaveContent:%s", err["error"].(error).Error())
			}

			// else{
			// 	result := <-channel
			// 	db_connection = result["db_connection"].(*pgxpool.Pool)

			// }

			// fmt.Println(data)
		}

		if err != nil {
			fmt.Println("Linea 54")

			if err == io.EOF {
				fmt.Println("Linea 68")
				break

			}
			fmt.Println("Linea 79")

			return fmt.Errorf("could not read file in SaveContent:%s", err.Error())
		}
		fmt.Println("Linea 61")
		// counter += 1

	}

	wg.Wait()
	close(channel)

	// db_connection.Close()
	fmt.Println("rows copied succesfully")

	return nil

}
