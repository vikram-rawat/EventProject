package routes

import (
	models "EventShoop/Models"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

// api for states name
func apiStates(c *gin.Context) {
	states, err := models.SQLStates()
	if err != nil {
		log.Fatal(err)
	}
	c.JSON(http.StatusOK, states)
}

// api for location
func apiLocation(c *gin.Context) {
	state := c.Query("state")
	locations, err := models.SQLLocations(state)
	if err != nil {
		log.Fatal(err)
	}
	c.JSON(http.StatusOK, locations)
}

// serve home page
func home(c *gin.Context) {
	c.HTML(http.StatusOK, "index.html", gin.H{
		"thisjs": "public/js/main.js",
	})
}

// serve vendor login page
func vendorlogin(c *gin.Context) {
	c.HTML(http.StatusOK, "vendor_login.html", nil)
}

// serve vendor registration page
func registration(c *gin.Context) {
	c.HTML(http.StatusOK, "registration_form.html", nil)
}

// serve vendor home page
func vendorpage(c *gin.Context) {
	c.HTML(http.StatusOK, "vendor_page.html", nil)
}
