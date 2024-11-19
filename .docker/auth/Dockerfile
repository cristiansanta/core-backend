FROM golang:1.23.3-alpine

WORKDIR /app

# Instalar dependencias del sistema
RUN apk add --no-cache gcc musl-dev

# Copiar todo el código fuente
COPY . .

# Descargar dependencias
RUN go mod download

# Compilar la aplicación
RUN go build -o main .

EXPOSE 8080

CMD ["./main"]