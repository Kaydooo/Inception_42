FROM debian:buster

RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/portainer/portainer/releases/download/2.17.1/portainer-2.17.1-linux-amd64.tar.gz \
    && tar -xzf portainer-2.17.1-linux-amd64.tar.gz \
    && rm -rf portainer-2.17.1-linux-amd64.tar.gzy
    
WORKDIR ./portainer
ENTRYPOINT ["./portainer"]