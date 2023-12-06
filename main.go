package main

import (
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

func hello(c *gin.Context) {
	c.JSON(http.StatusOK, "hello")
}

func timenow(c *gin.Context) {

	nu := time.Now()
	c.IndentedJSON(http.StatusOK, nu)
}

func main() {
	router := gin.Default()
	router.GET("/", hello)
	router.GET("/time", timenow)

	router.Run(":8080")
}
