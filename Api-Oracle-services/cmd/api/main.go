package main

import (
	"database/sql"
	"log"

	"SEARCHBYDOCUMENT/pkg/routes" // Ajustar según el path real de tu proyecto

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	_ "github.com/godror/godror" // Importación necesaria para Oracle
)

func main() {
	// Conexión a la base de datos
	db, err := sql.Open("godror", `user="system" password="123456" connectString="192.168.1.105:1521/xe"`)
	if err != nil {
		log.Fatalf("Error al conectar a la base de datos: %v", err)
	}
	defer db.Close()

	if err := db.Ping(); err != nil {
		log.Fatalf("Error al hacer ping a la base de datos: %v", err)
	}

	log.Println("Conexión a la base de datos exitosa")

	// Inicializar el servidor Gin
	router := gin.Default()

	 // Configuración CORS 
	 corsConfig := cors.DefaultConfig()
	 corsConfig.AllowOrigins = []string{"http://localhost:5173"}
	 corsConfig.AllowMethods = []string{"GET", "POST"}
	 corsConfig.AllowHeaders = []string{"Origin", "Content-Type", "Authorization"}
	 corsConfig.ExposeHeaders = []string{"Content-Length"}
	 corsConfig.AllowCredentials = true
	 corsConfig.MaxAge = 12 * 3600
 
	 router.Use(cors.New(corsConfig))

	// Registrar las rutas
	routes.InitRoutes(router, db)

	// Ejecutar el servidor en el puerto 8080
	if err := router.Run(":8083"); err != nil {
		log.Fatalf("Error al iniciar el servidor: %v", err)
	}
}
