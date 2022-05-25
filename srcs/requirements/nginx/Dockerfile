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

RUN	 mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
# rewrite the line below the way you use to copy or move files you copied in the container, from
# your srcs, using the conf and tools folders
# COPY ./data/nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=AURA/L=Lyon/O=42/OU=sylducam/CN=localhost/emailAddress=sylducam@student.42-lyon.fr"
RUN cp ${NGINX_CONF}/self-signed.conf /etc/nginx/snippets
RUN cp ${NGINX_CONF}/ssl-params.conf /etc/nginx/snippets
# need following ?
RUN cp ${NGINX_CONF}/default /etc/nginx/sites-available/default
# RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled

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
# CMD ["nginx", "-g", "daemon off;"]
# CMD ["bash", "tools/start.sh"]

# hub.docker.com's way below keep on using it if you find it usefull, else, I am adding an
# rough example of MariaDB Dockefile above
# docker run --detach --name some-mariadb --env MARIADB_USER_NAME=sylducam --env MARIADB_USER_PASSWORD=blabla --env MARIADB_ROOT_PASSWORD=blabla  mariadb:latest
# !! latest forbiden