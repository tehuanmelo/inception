#!/bin/sh

mkdir /var/run/mysqld
chmod 777 /var/run/mysqld

mysql_install_db --user=mysql --datadir=/var/lib/mysql
