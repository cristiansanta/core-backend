package db

import (
	"database/sql"

	_ "github.com/godror/godror"
)

func InitOracleDB() (*sql.DB, error) {
	db, err := sql.Open("godror", `user="system" password="123456" connectString="localhost:1521/XE"`)
	if err != nil {
		return nil, err
	}
	if err = db.Ping(); err != nil {
		return nil, err
	}
	return db, nil
}
