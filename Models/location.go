package models

import (
	"fmt"
	"log"
)

// Locations Type is for recording location table in database.
type Locations struct {
	LocationName string
}

// SQLLocations get data from sql query states
func SQLLocations(st string) ([]Locations, error) {
	query := "SELECT * FROM get_location('" + st + "')"

	rows, err := DB.Query(query)
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()
	locationSl := []Locations{}
	for rows.Next() {
		l := Locations{}
		err := rows.Scan(
			&l.LocationName,
		)
		if err != nil {
			fmt.Println(err)
		}
		locationSl = append(locationSl, l)
	}
	if err = rows.Err(); err != nil {
		return nil, err
	}

	return locationSl, nil
}
