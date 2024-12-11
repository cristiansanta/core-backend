package txt

import (
"os"
"fmt"
)

func (s *Service) Delete(mainFilePath string) error{
	s.UploadFile = true;
	err := os.Remove(mainFilePath)

	if err != nil{
		return fmt.Errorf("error deleted file in Dete: %s",err.Error())
	}
	return nil
}