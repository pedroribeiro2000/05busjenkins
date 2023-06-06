#!/bin/bash
# Actualizar la lista de paquetes disponibles
apt-get update

# Instalar paquetes para permitir que APT utilice un repositorio HTTPS
apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release 

apt-get install -y openjdk-11-jre-headless

# Añadir la clave GPG oficial de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Añadir el repositorio de Docker a la lista de fuentes de APT
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" |  tee /etc/apt/sources.list.d/docker.list > /dev/null

# Actualizar la lista de paquetes disponibles con los nuevos paquetes de Docker
apt-get update

# Instalar la última versión de Docker
apt-get install -y docker-ce docker-ce-cli containerd.io

# Agregar usuario vagrant a grupo docker correctamente

usermod -aG docker vagrant

docker run -tdi --name jenkins --restart=always -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts


echo "APROVISIONAMIENTO EJECUTADO"
