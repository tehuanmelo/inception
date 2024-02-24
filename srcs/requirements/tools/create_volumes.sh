#!/bin/sh

if [ ! -d /home/${USER}/volumes ]; then
    mkdir /home/${USER}/volumes
    mkdir /home/${USER}/volumes/mariadb
    mkdir /home/${USER}/volumes/wordpress
fi