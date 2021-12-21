#!/bin/bash

apt-get update >/dev/null 2>&1
apt-get install -y  nginx \
                    mariadb-server \
                    mariadb-common \
                    php-fpm \
                    php-mysql \
                    expect \
                    php-curl \
                    php-gd \
                    php-intl \
                    php-mbstring \
                    php-soap \
                    php-xml \
                    php-xmlrpc \
                    php-zip \
                    w3m \
                    net-tools \
                    apt-transport-https

exit 0
