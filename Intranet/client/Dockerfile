FROM ubuntu:latest

RUN apt-get update
RUN apt install telnet -y
RUN apt install iputils-ping -y
RUN apt install curl -y
RUN apt install nano -y

# création du user
RUN adduser toto
RUN mkhomedir_helper toto
RUN echo "toto:toto" | chpasswd
RUN mkdir /home/toto/mail
RUN apt install mutt -y
COPY .muttrc /home/toto

CMD tail -f /dev/null
