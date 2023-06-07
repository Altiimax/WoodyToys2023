# Image de la distribution à utiliser
FROM ubuntu:latest

# Installe les paquets requis
RUN apt-get update -y && apt-get install
RUN apt install dovecot-imapd dovecot-pop3d -y
RUN apt install postfix -y
RUN apt install telnet -y

# Copie les fichiers postfix et dovecot
COPY main.cf /etc/postfix/
COPY dovecot.conf /etc/dovecot/

# Créer les utilisateurs + répertoire et modifie le mdp
RUN adduser tutu
RUN mkhomedir_helper tutu
RUN echo "tutu:tutu" | chpasswd
RUN adduser toto
RUN mkhomedir_helper toto
RUN echo "toto:toto" | chpasswd

# copy run script
COPY run.sh /run.sh
RUN chmod u+x /run.sh

# Ouverture des ports sur le container
EXPOSE 25/tcp
EXPOSE 110/tcp
EXPOSE 143/tcp

# Lancement des services
CMD service dovecot start && \
    service postfix start && \
    tail -f /dev/null