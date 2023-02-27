FROM debian:buster
RUN apt-get update && apt-get install -y redis

RUN sed -i '/^bind/c\#' /etc/redis/redis.conf
RUN sed -i '/^# maxmemory <bytes>/c\maxmemory 128mb' /etc/redis/redis.conf
RUN sed -i '/^supervised/c\supervised systemd' /etc/redis/redis.conf
RUN sed -i '/^protected-mode yes/c\protected-mode no' /etc/redis/redis.conf

 
EXPOSE 6379

CMD ["redis-server", "/etc/redis/redis.conf", "--daemonize no"]


