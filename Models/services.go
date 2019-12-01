package models

import (
	"fmt"
	"log"
)

// Services Type is for recording service names in database.
type Services struct {
	ServicesName string
}

// SQLServices get data from sql query Services
func SQLServices() ([]Services, error) {
	rows, err := DB.Query("SELECT * FROM get_services()")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()
	servicesSl := []Services{}
	for rows.Next() {
		s := Services{}
		err := rows.Scan(
			&s.ServicesName,
		)
		if err != nil {
			fmt.Println(err)
		}
		servicesSl = append(servicesSl, s)
	}
	if err = rows.Err(); err != nil {
		return nil, err
	}
	return servicesSl, nil
}
