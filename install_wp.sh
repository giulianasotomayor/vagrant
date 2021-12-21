#!/bin/bash

# Nos ubicamos donde esta wordpress comprimido
cd /home/vagrant

# Copiamos el proyecto comprimido de wordpress
# wget https://wordpress.org/wordpress-5.8.2.tar.gz
cp /vagrant/wordpress/wordpress-5.8.2.tar.gz /home/vagrant/wordpress-5.8.2.tar.gz

# Descomprimir el wordpress
tar xzvf wordpress-5.8.2.tar.gz

# Creamos un archivo .htaccess
touch /home/vagrant/wordpress/.htaccess

# Copiamos nuestro archivo de configuracion de wordpress
cp /vagrant/wordpress/wp-config.php /home/vagrant/wordpress/wp-config.php

# Creamos un carpeta update
mkdir -p /home/vagrant/wordpress/wp-content/upgrade

# Copiamos el proyecto de wordpress al directorio donde tenemos configurado nginx y php
cp -a /home/vagrant/wordpress/. /home/vagrant/www

# Generamos claves secretas de WordPress y agregamos al archivo de configuración
curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> /home/vagrant/wordpress/wp-config.php

# Actualizamos los permisos
sudo chown -R www-data:www-data /home/vagrant/www
sudo find /home/vagrant/www/ -type d -exec chmod 750 {} \;
sudo find /home/vagrant/www/ -type f -exec chmod 640 {} \;

# Instalamos wp-cli para configurar la pagina de wordpress
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

# Nos ubicamos donde esta el proyecto de wordpress
cd /home/vagrant/www

# configuramos la pagina de wordpres con wp-cli
wp core install --url="192.168.1.30" --title="Sistema Sistema Sistema" --admin_user="keepcoding" --admin_password="keepcoding" --admin_email="giu.sotomayor7@gmail.com" --allow-root
