FROM debian:buster

RUN apt-get update -y && apt-get install -y mariadb-server

COPY ./conf/setup.sh /tmp/
ENTRYPOINT ["sh", "/tmp/setup.sh"]
