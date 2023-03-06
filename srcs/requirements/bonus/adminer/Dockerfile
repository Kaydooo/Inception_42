FROM debian:buster

RUN apt-get update && apt-get install -y php php-mysql wget

WORKDIR /var/www

RUN wget https://www.adminer.org/latest.php && mv latest.php index.php

EXPOSE 8080
# runs php webserver on 0.0.0.0:8080 
CMD ["php","-S", "0.0.0.0:8080"]