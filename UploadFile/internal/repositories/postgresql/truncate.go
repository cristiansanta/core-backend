package postgresql

import (
	"context"
	"fmt"
)

func (r Repository) Truncate(query string) (error) {

	if _,err := r.Connection.Exec(context.Background(),query); err!=nil{
		return fmt.Errorf("could not truncate values in Trucante: %s",err.Error())
	}
	// defer r.Connection.Close()
	return nil
}