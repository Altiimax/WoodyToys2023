FROM ubuntu:latest

RUN apt-get update -y && apt-get install
RUN apt install dovecot-imapd dovecot-pop3d -y
RUN apt install postfix -y
RUN apt install telnet -y

COPY main.cf /etc/postfix/
COPY dovecot.conf /etc/dovecot/

#create users and change password
RUN adduser tutu
RUN mkhomedir_helper tutu
RUN echo "tutu:tutu" | chpasswd
RUN adduser toto
RUN mkhomedir_helper toto
RUN echo "toto:toto" | chpasswd

# copy run script
COPY run.sh /run.sh
RUN chmod u+x /run.sh

EXPOSE 25/tcp
EXPOSE 110/tcp
EXPOSE 143/tcp

CMD ["sh", "./run.sh"]