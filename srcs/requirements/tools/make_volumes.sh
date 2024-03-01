#!/bin/bash

if [ ! -d "/home/${USER}/volumes" ]; then
        mkdir ~/volumes
        mkdir ~/volumes/mariadb
        mkdir ~/volumes/wordpress
fi