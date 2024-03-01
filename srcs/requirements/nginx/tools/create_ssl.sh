#!/bin/sh

# Create directory if not created
if [ ! -d "/etc/nginx/ssl/" ]; then
    mkdir -p /etc/nginx/ssl/
    chmod -R 777 /etc/nginx/
fi

sed -i "s|DOMAIN_NAME|${DOMAIN_NAME}|g" /etc/nginx/http.d/nginx.conf
sed -i "s|CERT_|${CERT_}|g" /etc/nginx/http.d/nginx.conf
sed -i "s|KEY_|${KEY_}|g" /etc/nginx/http.d/nginx.conf

# generate the keys and certificates
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ${KEY_} -out ${CERT_} -subj "/C=AE/ST=AbuDhabi/L=AbuDhabi/O=42AbuDhabi/CN="${DOMAIN_NAME}""

# Running this command "nginx -g daemon off;" tells Nginx to stay in the foreground
nginx -g "daemon off;"
