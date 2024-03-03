#!/bin/bash

# Create the bind mounts for storing the wordpress data
if [ ! -d "${HOME}/data/" ]; then
        mkdir -p ~/data/mariadb
        mkdir -p ~/data/wordpress
fi