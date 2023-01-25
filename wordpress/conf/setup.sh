#!/bin/sh

sed -i 's/listen =.*/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php
sleep 2
if ! command -v wp &> /dev/null
then
  echo "WP-CLI not found, downloading and setting up..."
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
fi

if [ ! -d "/var/www/html/wp-content" ]; then

  echo "wp-content directory not found, installing WordPress..."
  wp --allow-root core download
  wp --allow-root config create --dbname=wordpress --dbuser=kaydoo --dbpass=lujwll --dbhost=mariadb
  #wp --allow-root db create
  wp --allow-root core install --url=localhost --title=KinG --admin_user=kaydooo --admin_password=lujwll --admin_email=m3t9mm@gmail.com

  echo "WordPress has been successfully installed."
else
  echo "wp-content directory found, WordPress already installed."
fi

/usr/sbin/php-fpm7.3 --nodaemonize
