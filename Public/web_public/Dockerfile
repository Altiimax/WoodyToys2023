FROM ubuntu:latest

RUN apt update
RUN apt-get -y install systemd
RUN apt install -y apache2
RUN apt install -y apache2-utils
RUN apt install -y nano
RUN apt clean

COPY ./html/index.html /var/www/html

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]