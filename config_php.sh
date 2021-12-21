#!/bin/bash

# Creamos un nuevo directorio donde redireccionara el NGINX
mkdir -p /home/vagrant/www

# Reemplazamos nuestra configuración de nginx al que viene por defecto
sudo cp /vagrant/nginx/default /etc/nginx/sites-available/default

# Reiniciamos nuestro servidor NGINX para que actualice los cambios
sudo service nginx restart
