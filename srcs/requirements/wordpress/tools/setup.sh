#!/bin/sh

sed -i 's/listen =.*/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php 

if ! command -v wp &> /dev/null
then
  echo "WP-CLI not found, downloading  ..."
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
fi

if [ ! -f "/var/www/html/wp-content/wp-config.php" ]; then

  echo "wp-content.php not found, installing WordPress..."
  wp --allow-root core download
  wp --allow-root config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST
  wp --allow-root core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL
  wp --allow-root user create $WP_USER $WP_EMAIL --user_pass=$WP_PASS --role=editor

  wp --allow-root theme install "ExS Dark" 
  wp --allow-root theme activate "exs-dark"
 
  chown -R www-data:www-data /var/www/html/
  chmod -R 775 /var/www/html
  echo "WordPress has been successfully installed."

  wp config set WP_CACHE true --allow-root
	wp config set WP_CACHE_KEY_SALT $REDIS_KEY --allow-root
	wp config set WP_REDIS_HOST $REDIS_HOST --allow-root
	wp config set WP_REDIS_PORT $REDIS_PORT --allow-root
  wp plugin install redis-cache --activate --allow-root
  wp redis enable --allow-root

else
  echo "WordPress is already configured"
fi

/usr/sbin/php-fpm7.3 --nodaemonize
