#!/bin/bash

# Create the bind mounts for storing the wordpress data
if [ ! -d "/home/${USER}/volumes" ]; then
        mkdir ~/volumes
        mkdir ~/volumes/mariadb
        mkdir ~/volumes/wordpress
fi