#!/bin/bash


""" Instalación de Elasticsearch """

# Agregando la clave GPG pública a APT
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

# Agregamos a lista de fuentes de Elastic al directorio 'sources.list.d'
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list

# Actualizamos la lista de paquetes
sudo apt-get update

# Instalar elasticsearch
sudo apt-get install -y elasticsearch

# Iniciando el servicio de Elasticsearch con systemctl
sudo systemctl start elasticsearch

# add config en elasticsearch
echo "network.host: 0.0.0.0" >> /etc/elasticsearch/elasticsearch.yml
echo "cluster.initial_master_nodes: node-1" >> /etc/elasticsearch/elasticsearch.yml

# Reiniciamos el elasticsearch para que aplique los cambios
sudo service elasticsearch restart


""" Instalación de Kibana """

# Agregamos a lista de fuentes de Elastic al directorio 'sources.list.d'
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list

# Actualizamos la lista de paquetes
sudo apt-get update

# Instalar kibana
sudo apt-get install kibana

# Agregango permisos de escritura
sudo chmod -R 777 /etc/kibana/kibana.yml

# add config en kibana
sudo echo "server.host: 0.0.0.0" >> /etc/kibana/kibana.yml

# Reinicio de los servicios
sudo systemctl daemon-reload
sudo systemctl enable kibana
sudo systemctl restart kibana


""" Instalación de NGINX """
# Reemplazamos nuestra configuración de nginx al que viene por defecto
sudo cp /vagrant/elk/default /etc/nginx/sites-available/default

# Reiniciamos nuestro servidor NGINX para actualizar los cambios
sudo service nginx restart
sudo systemctl restart nginx


""" Instalación de Logstash """

# Agregamos a lista de fuentes de Elastic al directorio 'sources.list.d'
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list

# Actualizamos la lista de paquetes
sudo apt-get update

# Instalar logstash
sudo apt-get install logstash

# agregando archivos de configuración
sudo cp /vagrant/elk/02-beats-input.conf /etc/logstash/conf.d/02-beats-input.conf
#sudo cp /vagrant/elk/10-syslog-filter.conf /etc/logstash/conf.d/10-syslog-filter.conf
sudo cp /vagrant/elk/30-elasticsearch-output.conf /etc/logstash/conf.d/30-elasticsearch-output.conf

# Iniciamos el ervicio
sudo systemctl enable logstash --now
