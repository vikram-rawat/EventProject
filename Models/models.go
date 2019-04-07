package models

import (
	"EventShoop/defaults"
	"database/sql"
	"log"

	_ "github.com/lib/pq"
)

// DB is the database object
var DB *sql.DB

// Init function should open a connection for the databse in the beginning
func init() {
	config := defaults.GetYaml()
	dev := config.Database.Development
	con := "user=" + dev.User + " " +
		"password=" + dev.Password + " " +
		"dbname=" + dev.Dbname + " " +
		"sslmode=" + dev.Sslmode
	var err error
	DB, err = sql.Open(dev.Driver, con)
	if err != nil {
		log.Fatal(err)
	}
}
