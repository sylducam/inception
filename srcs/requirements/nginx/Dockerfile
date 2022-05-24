FROM debian:buster

ENV BASEDIR=/inception/nginx
ENV NGINX_CONF=${BASEDIR}/conf
ENV NGINX_TOOLS=${BASEDIR}/tools

# need args below ?
ARG USER_NAME
ARG USER_PASSWORD
ARG MYSQL_ROOT_PASSWORD
ARG DB_NAME

WORKDIR ${BASEDIR}

RUN apt-get update && apt-get -y upgrade
# del line below
RUN apt-get install -y vim
RUN apt-get install -y openssl
RUN apt-get install -y nginx

COPY conf ${NGINX_CONF}
COPY tools ${NGINX_TOOLS}
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=AURA/L=Lyon/O=42/OU=sylducam/CN=localhost/emailAddress=sylducam@student.42-lyon.fr"
RUN mv ${NGINX_CONF}/self-signed.conf /etc/nginx/snippets
RUN mv ${NGINX_CONF}/ssl-params.conf /etc/nginx/snippets
# need following ?
RUN mv ${NGINX_CONF}/default /etc/nginx/sites-available/default
# RUN ln -s etc/nginx/sites-available/default etc/nginx/sites-enabled

RUN mkdir -p /var/www/html
RUN chmod -R 755 /var/www/*
RUN apt-get install -y wget
RUN wget https://wordpress.org/wordpress-5.9.3.tar.gz
RUN tar xf wordpress-5.9.3.tar.gz
RUN mv wordpress /var/www/html

COPY conf ${WP_CONF}
COPY tools ${WP_TOOLS}
RUN mv conf/wp-config.php /var/www/html/wordpress
RUN sed -i "s|%%WORDPRESS_DB_USER%%|$USER_NAME|" /var/www/html/wordpress/wp-config.php
RUN sed -i "s|%%WORDPRESS_DB_PSSWD%%|$USER_PASSWORD|" /var/www/html/wordpress/wp-config.php

EXPOSE 80 443

#PHPMYADMIN (REMAKE IT)
# RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
# RUN tar xf phpMyAdmin-latest-all-languages.tar.gz
# RUN rm phpMyAdmin-latest-all-languages.tar.gz
# RUN mv phpMyAdmin* /var/www/html/phpmyadmin

LABEL description="nginx"

# -- rename the database
# RUN mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress; \
# CREATE USER_NAME '$USER_NAME' IDENTIFIED BY '$USER_PASSWORD'; \
# GRANT ALL ON wordpress.* TO '$USER_NAME'@'%'; \
# FLUSH PRIVILEGES;"
# -- what's the use of the next line ?
# -- UPDATE mysql.user SET plugin = '' WHERE user = 'sylducam' AND host = 'localhost';
# -- SHOW DATABASES;


CMD ["tail", "-f"]
# CMD ["bash", "tools/start.sh"]

# hub.docker.com's way below keep on using it if you find it usefull, else, I am adding an
# rough example of MariaDB Dockefile above
# docker run --detach --name some-mariadb --env MARIADB_USER_NAME=sylducam --env MARIADB_USER_PASSWORD=blabla --env MARIADB_ROOT_PASSWORD=blabla  mariadb:latest
# !! latest forbiden