FROM ubuntu:latest

RUN apt update
RUN apt-get -y install systemd
RUN apt install -y apache2
RUN apt install -y apache2-utils
RUN apt clean

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]