FROM debian:buster

RUN apt-get update -y && apt-get install -y curl php php-fpm php-mysql mariadb-client

WORKDIR /var/www/html/ 
RUN chmod 777 /var/www/html
COPY ./tools/setup.sh /tmp/

EXPOSE 9000

ENTRYPOINT ["sh", "/tmp/setup.sh"]

