FROM debian:buster
RUN apt-get update && apt-get install -y redis

# deletes any bind directive (if any) which will make redis use the default value that allows everyone in the newtwork to connect to redis
RUN sed -i '/^bind/c\#' /etc/redis/redis.conf
# protected-mode directive is a security feature that will allow only authorized connections.. so we need to change it's value to no as well.  
RUN sed -i '/^protected-mode yes/c\protected-mode no' /etc/redis/redis.conf

# RUN sed -i '/^# maxmemory <bytes>/c\maxmemory 128mb' /etc/redis/redis.conf
# RUN sed -i '/^supervised/c\supervised systemd' /etc/redis/redis.conf

 
EXPOSE 6379

CMD ["redis-server", "/etc/redis/redis.conf", "--daemonize no"]


