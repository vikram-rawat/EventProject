package models

import (
	"fmt"
	"log"
)

// UserExist Type is for checking if user exists
type UserExist struct {
	UserExists bool
}

// SQLVerifyUser get data from sql query verifyUsers
func SQLVerifyUser(st string) ([]UserExist, error) {
	query := "SELECT * FROM proc_func.verify_userid('" + st + "')"

	rows, err := DB.Query(query)
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()
	verifySl := []UserExist{}
	for rows.Next() {
		s := UserExist{}
		err := rows.Scan(
			&s.UserExists,
		)
		if err != nil {
			fmt.Println(err)
		}
		verifySl = append(verifySl, s)
	}
	if err = rows.Err(); err != nil {
		return nil, err
	}
	return verifySl, nil
}
