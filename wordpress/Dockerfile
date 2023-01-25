FROM debian:buster

RUN apt-get update -y && apt-get install -y curl php php-cli php-fpm php-mysql php-zip php-gd php-mbstring php-curl php-xml mariadb-client

WORKDIR /var/www/html/ 
COPY ./conf/setup.sh /tmp/
#RUN chmod 777 setup.sh

ENTRYPOINT ["sh", "/tmp/setup.sh"]

#WORKDIR /home/temp
#RUN mkdir -p /var/www/html/ddd
#COPY  ./conf/setup.sh .
#COPY  ./conf/setup.sh ..
#RUN chmod 777 setup.sh
#RUN mkdir -p /run/php
#WORKDIR /var/www/html
#RUN sh setup.sh
#RUN cp * -rf /var/www/html
#WORKDIR /var/www/html/wordpress
#RUN 
#RUN ls ..  && touch /var/whww/html/LOL_TEST
