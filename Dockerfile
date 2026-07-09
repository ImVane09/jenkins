# Dockerfile
FROM node:24-alpine

# Crear directorio de la aplicación
WORKDIR /usr/src/app

# Copiar archivos al contenedor
COPY package*.json ./
COPY index.js .

# FIX: Decirle a npm que no se ponga estricto con el certificado autofirmado de Nexus
RUN npm config set strict-ssl false

# Instalar dependencias
RUN npm install

# Copiar el resto de los archivos
COPY users.json .       

# Exponer el puerto de la aplicación
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["node", "index.js"]