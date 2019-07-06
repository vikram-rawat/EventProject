package routes

import (
	"github.com/gin-gonic/gin"
)

// Allroutes : used for creating and managing
// all the routes
func Allroutes() *gin.Engine {
	r := gin.Default()
	r.LoadHTMLGlob("eventshoop/templates/**/*")
	r.Static("/public", "eventshoop/public/assets/")
	r.GET("/", home)
	r.GET("/vendorlogin", vendorlogin)
	r.GET("/registration", registration)
	r.GET("/vendorpage", vendorpage)
	api := r.Group("/json/api")
	{
		api.GET("/states", apiStates)
		api.GET("/locations", apiLocation)
	}
	return r
}
