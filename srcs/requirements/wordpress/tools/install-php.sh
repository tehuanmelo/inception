#!/bin/sh

apk update
apk upgrade

apk add \
php82 \
php82-json \
php82-mysqli \
php82-fpm \
php82-curl \
php82-dom \
php82-exif \
php82-fileinfo \
php82-intl \
php82-mbstring \
php82-openssl \
php82-xml \
php82-zip \
wget \
unzip

sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php82/php-fpm.d/www.conf
sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php82/php-fpm.d/www.conf 
sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php82/php-fpm.d/www.conf 

