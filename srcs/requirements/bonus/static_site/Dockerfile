FROM debian:buster

RUN apt-get update && apt-get install -y nginx

# RUN apt install -y nginx

COPY ./conf/default /etc/nginx/sites-available/default

COPY ./conf/site /var/www/moa

ENTRYPOINT ["nginx", "-g", "daemon off;"]




