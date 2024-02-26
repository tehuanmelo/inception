#!/bin/sh

if [ ! -d /var/www/ ]; then
    mkdir -p /var/www/
fi

cd /var/www/

wget https://wordpress.org/latest.zip
unzip latest.zip
cp -rf wordpress/* ./
rm -rf wordpress latest.zip

if [ ! -f ./wp-config.php ]; then
    cp ./wp-config-sample.php ./wp-config.php
    sed -i "s|database_name_here|${DB_NAME}|g" ./wp-config.php
    sed -i "s|username_here|${DB_USER}|g" ./wp-config.php
    sed -i "s|password_here|${DB_PASS}|g" ./wp-config.php
    sed -i "s|localhost|mariadb|g" ./wp-config.php
fi

chmod -R 777 wp-content/