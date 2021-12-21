#!/bin/bash


# Agregando la clave GPG pública a APT
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

# Agregamos a lista de fuentes de Elastic al directorio 'sources.list.d'
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list

# Actualizamos la lista de paquetes
sudo apt-get update

# Instalar filebeat
sudo apt-get install -y filebeat


# Reemplazamos nuestra configuración de filebeat por el que viene por defecto
sudo cp /vagrant/elk/filebeat.yml /etc/filebeat/filebeat.yml

# Agragando permisos necesarios
sudo chown root /etc/filebeat/filebeat.yml
sudo chmod go-w /etc/filebeat/filebeat.yml

# reiniciamos el servivio
sudo service filebeat restart

# Habilitamosel modulo de system
sudo filebeat modules enable system

# Habilitamosel modulo de nginx
sudo filebeat modules enable nginx

# Iniciando el servicio de filebeat con systemctl
sudo systemctl enable filebeat --now

