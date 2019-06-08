package routes

import (
	models "EventShoop/Models"
	"log"
	"net/http"

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
	}
	return r
}

func apiStates(c *gin.Context) {
	states, err := models.SQLStates()
	if err != nil {
		log.Fatal(err)
	}
	c.JSON(http.StatusOK, states)
}
func home(c *gin.Context) {
	c.HTML(http.StatusOK, "index.html", nil)
}
func vendorlogin(c *gin.Context) {
	c.HTML(http.StatusOK, "vendor_login.html", nil)
}
func registration(c *gin.Context) {
	c.HTML(http.StatusOK, "registration_form.html", nil)
}
func vendorpage(c *gin.Context) {
	c.HTML(http.StatusOK, "vendor_page.html", nil)
}
