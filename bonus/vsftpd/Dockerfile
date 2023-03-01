FROM debian:buster

ARG FTP_USER
ARG FTP_PASS

RUN apt-get update && apt-get install -y vsftpd nano

RUN useradd $FTP_USER && echo "$FTP_USER:$FTP_PASS" | chpasswd \
    && usermod -aG www-data $FTP_USER


RUN mkdir -p /var/run/vsftpd/empty

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

RUN mkdir /home/$FTP_USER

CMD ["vsftpd", "/etc/vsftpd.conf"]

