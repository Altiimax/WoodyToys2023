# Image de base
FROM ubuntu:latest

# Paquets nécessaires
RUN apt-get update -y && apt-get install
RUN apt install dovecot-imapd dovecot-pop3d -y
RUN apt install postfix -y
RUN apt install amavisd-new -y
RUN apt install spamassassin -y
RUN apt install clamav -y

# Fichiers de configuration
COPY private.pem /etc/certificat/
COPY fullchain.pem /etc/certificat/

# Fichiers pour postfix
COPY postfix/main.cf /etc/postfix/
COPY postfix/master.cf /etc/postfix/

# Fichiers pour dovecot
COPY dovecot/dovecot.conf /etc/dovecot/
COPY dovecot/10-ssl.conf /etc/dovecot/conf.d/
COPY dovecot/10-master.conf /etc/dovecot/conf.d/
COPY dovecot/10-auth.conf /etc/dovecot/conf.d/

# fichiers antivirus
COPY amavis/15-content_filter_mode /etc/amavis/conf.d/
COPY amavis/05-node_id /etc/amavis/conf.d/

# Utilisateurs et mots de passe
RUN adduser tutu
RUN mkhomedir_helper tutu
RUN echo "tutu:tutu" | chpasswd
RUN adduser toto
RUN mkhomedir_helper toto
RUN echo "toto:toto" | chpasswd

RUN adduser clamav amavis 
RUN adduser amavis clamav

# RUN postmap /etc/postfix/virtual

# Spamassassin et activation
RUN update-rc.d spamassassin enable

# Téléchargement de la base de données pour antivirus
RUN freshclam

# Ports à exposer
EXPOSE 993/tcp
EXPOSE 995/tcp
EXPOSE 465/tcp
EXPOSE 587/tcp

# Lancement des services
CMD service postfix start && \
    service dovecot start && \
    service amavis restart && \
    service spamassassin restart && \
    tail -f /dev/null