#!/bin/bash

# if command -v openssl &> /dev/null; then
#     echo "OpenSSL is installed."
# else
#     echo "OpenSSL is not installed. Istalling OpenSSL."
#     sudo apt-get update
#     sudo apt-get install -y openssl
# fi

COMMON_NAME="tde-melo.42.fr"

openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
	-keyout nginx.key \
	-out nginx.crt -sha256 -subj "/CN=$COMMON_NAME"

mv nginx.crt /etc/ssl/certs
mv nginx.key /etc/ssl/private

