FROM golang:1.23.3-alpine AS base

WORKDIR /app

# Instalar dependencias del sistema
RUN apk add --no-cache gcc musl-dev



#Etapa de desarrollo
FROM base AS dev
#hotreload
RUN go install github.com/air-verse/air@latest

# Copiar todo el código fuente
COPY go.mod go.sum .air.toml ./

# Descargar dependencias
RUN go mod download

EXPOSE 8082

CMD ["air", "-c", ".air.toml"]



#Etapa de produccion
FROM base AS pro
COPY . .

RUN go mod download
# Compilar la aplicación
RUN go build -o main ./cmd/api

EXPOSE 8082

CMD ["./main"]