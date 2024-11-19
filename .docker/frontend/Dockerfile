# Etapa de construcción
FROM node:18.13.0-alpine as build-stage

RUN apk add --no-cache git
RUN git config --global core.autocrlf input

WORKDIR /app

# Limpiar y preparar el entorno
RUN rm -rf node_modules
RUN rm -rf dist

# Copiar solo los archivos necesarios primero
COPY frontend_rav/package*.json ./

# Instalar dependencias
RUN npm ci

# Copiar el resto de archivos
COPY frontend_rav/ ./

# Construir la aplicación
RUN npm run build

# Etapa de producción
FROM nginx:alpine as production-stage

# Copiar la configuración de nginx
COPY .docker/frontend/nginx.conf /etc/nginx/conf.d/default.conf

# Copiar los archivos construidos
COPY --from=build-stage /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]