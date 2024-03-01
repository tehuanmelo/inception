#!/bin/sh


apk add --no-cache \
    php \
    php-curl \
    php-fpm \
    php-bcmath \
    php-gd php-soap \
    php-zip php-curl \
    php-mbstring \
    php-mysqlnd \
    php-gd \
    php-xml \
    php-intl \
    php-zip \
    php-mysqli \
    php-pdo_mysql \
    php-phar \
    curl \
    unzip \
    openrc\
    wget


sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" /etc/php81/php-fpm.d/www.conf
sed -i "s|;listen.owner = nobody|listen.owner = root|g" /etc/php81/php-fpm.d/www.conf 
sed -i "s|;listen.group = nobody|listen.group = root|g" /etc/php81/php-fpm.d/www.conf 
