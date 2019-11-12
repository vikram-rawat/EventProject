package main

import (
	routes "EventShoop/controller"
)

func main() {
	r := routes.Allroutes()
	// manners.ListenAndServe(":4242", r)
	r.Run(":9090") // listen and serve on 0.0.0.0:9090
}
