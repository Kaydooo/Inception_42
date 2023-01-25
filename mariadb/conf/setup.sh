#!/bin/bash

service mysql start

#mysqld --console 

sleep 3
if [ ! -d "/var/lib/mysql/wordpress" ]; then
  mysql -uroot  -e "CREATE DATABASE wordpress; GRANT ALL PRIVILEGES ON *.* TO 'kaydoo'@'%' IDENTIFIED BY 'lujwll'; 	   FLUSH PRIVILEGES;"
  echo "wordpress database created "

fi


sed -i 's/bind-address .*=.*/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's/.port .*=.*/port = 3306/g' /etc/mysql/mariadb.conf.d/50-server.cnf

sleep 1000000
