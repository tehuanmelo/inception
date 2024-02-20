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

