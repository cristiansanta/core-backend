package main

import (
    "github.com/gin-gonic/gin"
    "github.com/gin-contrib/cors"
    "github.com/login/config"    // Ajusta según tu módulo
    "github.com/login/handlers"
    "github.com/login/middleware" // Nueva importación
    "github.com/login/models"
    "github.com/login/services"
    "log"
)

func main() {
    // Inicializar DB
    db := config.SetupDB()

    // Migrar modelo
    err := db.AutoMigrate(&models.User{})
    if err != nil {
        log.Fatal("Failed to migrate database:", err)
    }

    // Inicializar servicios y handlers
    authService := services.NewAuthService(db)
    authHandler := handlers.NewAuthHandler(authService)

    // Configurar router
    r := gin.Default()

    // Configurar CORS
    r.Use(cors.New(cors.Config{
        AllowOrigins:     []string{"http://localhost:5173"},
        AllowMethods:     []string{"POST"},
        AllowHeaders:     []string{"Origin", "Content-Type", "Authorization"},
        ExposeHeaders:    []string{"Content-Length"},
        AllowCredentials: true,
    }))

    // Rutas públicas de autenticación
    auth := r.Group("/api/auth")
    {
        auth.POST("/signup", authHandler.SignUp)
        auth.POST("/signin", authHandler.SignIn)
        auth.POST("/logout", middleware.AuthMiddleware(), authHandler.Logout) // Nueva ruta protegida
    }

    // Grupo de rutas protegidas (ejemplo)
    protected := r.Group("/api")
    protected.Use(middleware.AuthMiddleware())
    {
        // Aquí puedes agregar tus rutas protegidas
    }

    // Iniciar servidor
    if err := r.Run(":8080"); err != nil {
        log.Fatal("Failed to start server:", err)
    }
}