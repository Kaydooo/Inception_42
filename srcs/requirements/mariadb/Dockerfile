FROM debian:buster

RUN apt-get update -y && apt-get install -y mariadb-server

RUN chmod 777 /var/lib/mysql

COPY ./tools/setup.sh /tmp/

EXPOSE 3306

ENTRYPOINT ["sh", "/tmp/setup.sh"]
