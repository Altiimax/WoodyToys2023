# Image de base
FROM ubuntu:latest

# Paquets nécessaires
RUN apt-get update -y && apt-get install -y
RUN apt install dovecot-imapd dovecot-pop3d -y
RUN apt install postfix -y
RUN apt install amavisd-new -y
RUN apt install spamassassin -y
RUN apt install clamav -y
RUN apt install fail2ban -y

# Certificats LetsEncrypt pour le ssl
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

# fichiers antivirus, antispam et DKIM signature
COPY amavis/15-content_filter_mode /etc/amavis/conf.d/
COPY amavis/05-node_id /etc/amavis/conf.d/
COPY amavis/50-user /etc/amavis/conf.d/
RUN mkdir /var/lib/amavis/dkim
COPY /amavis/dkimkey.pem /var/lib/amavis/dkim/
RUN chown amavis:amavis /var/lib/amavis/dkim -R

# fail2ban pour postfix et dovecot
COPY /fail2ban/jail.local /etc/fail2ban/
COPY /fail2ban/custom.conf /etc/fail2ban/jail.d/

# Utilisateurs et mots de passe
RUN adduser tutu
RUN mkhomedir_helper tutu
RUN echo "tutu:tutu" | chpasswd
RUN adduser toto
RUN mkhomedir_helper toto
RUN echo "toto:toto" | chpasswd

# Ajout d'utilisateurs dans les groupes amavis et clamav pour les droits de lecture/écriture
RUN adduser clamav amavis 
RUN adduser amavis clamav

# Activation de Spamassassin
RUN update-rc.d spamassassin enable

# Téléchargement de la base de données pour antivirus
RUN freshclam

# Ports à exposer
EXPOSE 993/tcp
EXPOSE 995/tcp
EXPOSE 465/tcp
EXPOSE 587/tcp
EXPOSE 25/tcp

# Lancement des services
CMD service postfix start && \
    service dovecot start && \
    service amavis restart && \
    service spamassassin restart && \
    service fail2ban start && \
    tail -f /dev/null