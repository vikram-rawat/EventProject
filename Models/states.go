package models

import (
	"fmt"
	"log"
)

// States Type is for recording states table in database.
type States struct {
	StatesName   string
	DistrictName string
	CityName     string
}

// SQLStates get data from sql query states
func SQLStates() ([]States, error) {
	rows, err := DB.Query("SELECT * FROM get_address()")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()
	statesSl := []States{}
	for rows.Next() {
		s := States{}
		err := rows.Scan(
			&s.StatesName,
			&s.DistrictName,
			&s.CityName,
		)
		if err != nil {
			fmt.Println(err)
		}
		statesSl = append(statesSl, s)
	}
	if err = rows.Err(); err != nil {
		return nil, err
	}
	return statesSl, nil
}
