FROM mysql:latest

RUN chown -R mysql:root /var/lib/mysql/

#ARG MYSQL_DATABASE
#ARG MYSQL_USER
#ARG MYSQL_PASSWORD
#ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=testb2b
ENV MYSQL_USER=usertest
ENV MYSQL_PASSWORD=usertest123
ENV MYSQL_ROOT_PASSWORD=rootpassword

COPY setup.sql /mysql/setup.sql