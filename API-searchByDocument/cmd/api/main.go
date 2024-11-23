package main

import (
    "database/sql"
    "fmt"
    "log"
    "os"
    "SEARCHBYDOCUMENT/cmd/api/routes"
    "github.com/gin-contrib/cors"
    "github.com/gin-gonic/gin"
    _ "github.com/lib/pq"
)

var db *sql.DB

func main() {
    // Construir la cadena de conexión usando variables de entorno
    dsn := fmt.Sprintf("host=%s user=%s password=%s dbname=%s port=%s sslmode=disable",
        getEnv("DB_HOST", "localhost"),     // En Docker será "postgres", por defecto "localhost"
        getEnv("DB_USER", "admin"),
        getEnv("DB_PASSWORD", "gestion72"),
        getEnv("DB_NAME", "db_ruv"),
        getEnv("DB_PORT", "5432"),
    )

    // Inicializar la conexión a la base de datos
    var err error
    db, err = sql.Open("postgres", dsn)
    if err != nil {
        log.Fatal("Error al conectar a la base de datos:", err)
    }
    defer db.Close()

    // Verificar la conexión
    if err = db.Ping(); err != nil {
        log.Fatal("Error al hacer ping a la base de datos:", err)
    }

    log.Println("Conexión exitosa a la base de datos PostgreSQL")

    // Instancia de Gin
    g := gin.Default()

    // Configuración CORS 
    corsConfig := cors.DefaultConfig()
    corsConfig.AllowOrigins = []string{getEnv("FRONTEND_URL", "http://localhost:5173")}
    corsConfig.AllowMethods = []string{"GET", "POST"}
    corsConfig.AllowHeaders = []string{"Origin", "Content-Type", "Authorization"}
    corsConfig.ExposeHeaders = []string{"Content-Length"}
    corsConfig.AllowCredentials = true
    corsConfig.MaxAge = 12 * 3600

    g.Use(cors.New(corsConfig))

    // Registrar rutas
    routes.RegisterRoutes(g, db)

    // Obtener el puerto del servidor desde variables de entorno
    port := getEnv("PORT", "8082")
    serverAddr := fmt.Sprintf(":%s", port)

    log.Printf("Servidor iniciando en el puerto %s", port)

    // Ejecutar el servidor
    if err := g.Run(serverAddr); err != nil {
        log.Fatal("Error al iniciar el servidor:", err)
    }
}

// Función helper para obtener variables de entorno con valores por defecto
func getEnv(key, defaultValue string) string {
    if value := os.Getenv(key); value != "" {
        return value
    }
    return defaultValue
}
