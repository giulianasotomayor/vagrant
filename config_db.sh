#!/bin/bash

# Creando un usuario con su password en mariaDB
sudo mysql -uroot -pnone -e "GRANT ALL ON *.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'keepcoding' WITH GRANT OPTION"

# Recargando los permisos
sudo mysql -uroot -pnone -e "FLUSH PRIVILEGES"

# Creamos una base de datos 'wordpress' si es que no existe
sudo mysql -uwordpressuser -pkeepcoding -e "CREATE DATABASE IF NOT EXISTS wordpress character set utf8"
