package defaults

import (
	"io/ioutil"
	"log"

	yaml "gopkg.in/yaml.v2"
)

// Database struct to hold connection values
type Config struct {
	Database struct {
		Development struct {
			Driver   string
			Host     string
			Port     int
			User     string
			Password string
			Dbname   string
			Sslmode  string
		}
	}
}

func GetYaml() Config {
	conf := Config{}
	file, err := ioutil.ReadFile("E:/Go_code/src/EventShoop/connection.yaml")
	if err != nil {
		log.Fatal(err)
	}
	err = yaml.Unmarshal(file, &conf)
	if err != nil {
		log.Fatalf("error: %v", err)
	}
	return conf
}
