FROM debian:buster


RUN apt-get update && apt-get install -y nginx openssl


COPY ./default /etc/nginx/sites-available/default

RUN mkdir /etc/nginx/cert

RUN chmod 777 /etc/nginx/cert

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/nginx/cert/private.key -out /etc/nginx/cert/cert.pem \
 -subj "/C=AE/ST=Abu Dhabi/L=Abu Dhabi/O=IT/CN=localhost"

ENTRYPOINT ["nginx", "-g", "daemon off;"]


