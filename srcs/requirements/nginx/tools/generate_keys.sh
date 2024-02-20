#!/bin/bash

COMMON_NAME="tde-melo.42.fr"

openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
	-keyout nginx.key \
	-out nginx.crt -sha256 -subj "/CN=$COMMON_NAME"

mv nginx.crt /etc/ssl/certs
mv nginx.key /etc/ssl/private

