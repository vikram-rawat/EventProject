package models

import "log"

// States Type is for recording states table in database.
type States struct {
	Statesid   int
	Countryid  int
	StatesName string
}

// SQLStates get data from sql query states
func SQLStates() ([]States, error) {
	rows, err := DB.Query("SELECT * FROM statics.states")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()
	statesSl := []States{}
	for rows.Next() {
		s := States{}
		err := rows.Scan(
			&s.Statesid,
			&s.Countryid,
			&s.StatesName,
		)
		if err != nil {
			log.Fatal(err)
		}
		statesSl = append(statesSl, s)
	}
	if err = rows.Err(); err != nil {
		return nil, err
	}
	return statesSl, nil
}
