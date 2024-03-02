#!bin/sh

chown -R mysql:mysql /var/lib/mysql

mkdir /var/run/mysqld
chmod 777 /var/run/mysqld

sed -i "s/#bind-address=0.0.0.0/bind-address=0.0.0.0/g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s/skip-networking/skip-networking=0/g" /etc/my.cnf.d/mariadb-server.cnf

mysql_install_db --user=mysql --datadir=/var/lib/mysql

cat << EOF > /tmp/create_db.sql
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';
CREATE DATABASE ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

/usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
rm -f /tmp/create_db.sql
