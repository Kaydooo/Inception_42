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

if [ ! -f "/var/www/html/wp-content/wp-config.php" ]; then

  echo "wp-content.php not found, installing WordPress..."
  wp --allow-root core download
  wp --allow-root config create --dbname=wordpress --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb
  wp --allow-root user create $WP_USER1  $WP_EMAIL1 --user_pass=$WP_PASS1 --role=editor
  #wp --allow-root db create
  wp --allow-root core install --url=localhost --title=KinG --admin_user=$WP_USER --admin_password=$WP_PASS --admin_email=$WP_EMAIL
  chmod 777 /var/www/html/wp-content
  chmod 777 /var/www/html/wp-content/*
  echo "WordPress has been successfully installed."

  wp config set WP_CACHE true --allow-root
	wp config set WP_CACHE_KEY_SALT "Unique_KEY_:)" --allow-root
	wp config set WP_REDIS_HOST redis --allow-root
	wp config set WP_REDIS_PORT 6379 --allow-root
  wp plugin install redis-cache --activate --allow-root
  wp redis enable --allow-root

else
  echo "WordPress already installed."
fi

/usr/sbin/php-fpm7.3 --nodaemonize
