#!/bin/bash

sed -i 's/bind-address .*=.*/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i '/^#port/c\port = 3306' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start


if [ ! -d "/var/lib/mysql/wordpress" ]; then
  mysql -uroot  -e "CREATE DATABASE $DB_NAME; GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'; 	   FLUSH PRIVILEGES;"
  echo "wordpress database created "

fi

service mysql stop

mysqld --console

