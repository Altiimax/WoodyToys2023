FROM ubuntu:latest  

RUN apt-get update
RUN apt install telnet -y
RUN apt install iputils-ping -y
RUN apt install curl -y
RUN apt install nano -y

# création du user
RUN adduser tutu
RUN mkhomedir_helper tutu
RUN echo "tutu:tutu" | chpasswd
RUN mkdir /home/tutu/mail
RUN apt install mutt -y
COPY .muttrc /home/tutu

CMD tail -f /dev/null