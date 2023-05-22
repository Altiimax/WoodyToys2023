# Image de base
FROM ubuntu:latest

# Installation des paquets nécessaires
RUN apt-get update && apt-get install -y bind9

#Création du répertoire pour les logs
RUN mkdir /var/log/named

# Copie les fichiers de configuration
COPY named.conf /etc/bind/named.conf
COPY woodytoys.forward.zone /etc/bind/
COPY woodytoys.reverse.zone /etc/bind/


# Ouverture des ports
EXPOSE 53/tcp
EXPOSE 53/udp

# Lancement de bind9
CMD ["named" ,"-g"]