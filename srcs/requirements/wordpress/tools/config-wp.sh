#!/bin/sh


install wordpress page
cd /var/www/
wp core install  --url="$DOMAIN_NAME" --title="$TITLE" --admin_user="$ADM_USER" --admin_password="$ADM_PASS" --admin_email="$ADM_EMAIL"
wp user create "$WP_USER" "$WP_USER_EMAIL" --role=subscriber --user_pass="$WP_USER_PASS" 
php-fpm81 -F
