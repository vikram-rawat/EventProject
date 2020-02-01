package routes

import (
	"github.com/gin-gonic/gin"
)

// Allroutes : used for creating and managing
// all the routes
func Allroutes() *gin.Engine {
	r := gin.Default()
	r.LoadHTMLGlob("templates/**/*")
	r.Static("/public", "public/")
	r.GET("/", home)
	r.GET("/vendorlogin", vendorlogin)
	r.GET("/registration", registration)
	r.GET("/vendorpage", vendorpage)
	api := r.Group("/json/api")
	{
		api.GET("/states", apiStates)
		api.GET("/services", apiServices)
		api.GET("/locations", apiLocation)
	}
	return r
}
