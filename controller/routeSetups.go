package routes

import (
	models "EventShoop/Models"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

func apiStates(c *gin.Context) {
	states, err := models.SQLStates()
	if err != nil {
		log.Fatal(err)
	}
	c.JSON(http.StatusOK, states)
}

func apiLocation(c *gin.Context) {
	locations, err := models.SQLLocations("haryana")
	if err != nil {
		log.Fatal(err)
	}
	c.JSON(http.StatusOK, locations)
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
