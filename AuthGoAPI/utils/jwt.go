package utils

import (
	"errors"
	"os"
	"sync"
	"time"

	"github.com/dgrijalva/jwt-go"
)

var (
    jwtKey = []byte(getEnvOrDefault("JWT_SECRET_KEY", "default_secret_key"))
    invalidatedTokens = make(map[string]time.Time)
    mutex sync.RWMutex
)

func getEnvOrDefault(key, defaultValue string) string {
    if value := os.Getenv(key); value != "" {
        return value
    }
    return defaultValue
}

func GenerateToken(username string) (string, error) {
    claims := jwt.MapClaims{
        "username": username,
        "exp":     time.Now().Add(time.Hour * 24).Unix(),
        "iat":     time.Now().Unix(),
    }

    token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
    return token.SignedString(jwtKey)
}

func ValidateToken(tokenString string) (jwt.MapClaims, error) {
    token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
        if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
            return nil, errors.New("unexpected signing method")
        }
        return jwtKey, nil
    })

    if err != nil {
        return nil, err
    }

    if claims, ok := token.Claims.(jwt.MapClaims); ok && token.Valid {
        return claims, nil
    }

    return nil, errors.New("invalid token claims")
}

func InvalidateToken(tokenString string) {
    mutex.Lock()
    defer mutex.Unlock()
    invalidatedTokens[tokenString] = time.Now()
}

func IsTokenInvalidated(tokenString string) bool {
    mutex.RLock()
    defer mutex.RUnlock()
    _, exists := invalidatedTokens[tokenString]
    return exists
}