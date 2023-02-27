FROM debian:buster

RUN apt-get update -y && apt-get install -y mariadb-server

RUN chmod 777 /var/lib/mysql

COPY ./conf/setup.sh /tmp/
ENTRYPOINT ["sh", "/tmp/setup.sh"]
