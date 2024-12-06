package txt

import "fmt"

func (s Service) TruncateTable() error{
	query := s.Querys["truncate"]
	if err := s.Repo.Truncate(query); err != nil {
		return fmt.Errorf("could not delete data in TruncateTable:%s",err.Error())
	}
	return nil
}