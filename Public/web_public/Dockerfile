FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install net-tools iproute2 iputils-ping dnsutils curl nano -y

RUN apt-get install apache2 php php-cli php-mysql libapache2-mod-php -y

COPY ./index.html /var/www/html/www/
COPY ./b2b.php /var/www/html/b2b/
COPY ./www-l2-2-ephec-ti-be.conf /etc/apache2/sites-available/
COPY ./b2b-l2-2-ephec-ti-be.conf /etc/apache2/sites-available/
COPY fullchain.pem /etc/apache2/
COPY privkey.pem /etc/apache2/

COPY ./apache2.conf /etc/apache2/

RUN a2enmod ssl
RUN a2ensite www-l2-2-ephec-ti-be.conf && a2ensite b2b-l2-2-ephec-ti-be.conf

CMD [ "apache2ctl", "-D", "FOREGROUND" ]