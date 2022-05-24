FROM debian:buster

# keep both server and client ? one of them ?
# maybe install apt-utils via docker-compose or in each Dockerfile
# check if you need all of the below
ENV BASEDIR=/inception/mariadb
ENV DB_TOOLS=${BASEDIR}/tools

ARG USERNAME
ARG USER_PASSWORD
ARG MYSQL_ROOT_PASSWORD
ARG DB_NAME

WORKDIR ${BASEDIR}

RUN apt-get update && apt-get -y upgrade
# del line below
RUN apt-get install -y vim
# del line below ?
RUN apt-get install -y procps
RUN apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client
# del line below ?
RUN apt-get install -y coreutils

COPY tools ${DB_TOOLS}
RUN chmod 744 ${DB_TOOLS}/config.sh
RUN ${DB_TOOLS}/config.sh

EXPOSE 3307

#PHPMYADMIN (REMAKE IT)
# RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
# RUN tar xf phpMyAdmin-latest-all-languages.tar.gz
# RUN rm phpMyAdmin-latest-all-languages.tar.gz
# RUN mv phpMyAdmin* /var/www/html/phpmyadmin

LABEL description="MariaDB"

# -- rename the database
# RUN mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress; \
# CREATE USERNAME '$USERNAME' IDENTIFIED BY '$USER_PASSWORD'; \
# GRANT ALL ON wordpress.* TO '$USERNAME'@'%'; \
# FLUSH PRIVILEGES;"
# -- what's the use of the next line ?
# -- UPDATE mysql.user SET plugin = '' WHERE user = 'sylducam' AND host = 'localhost';
# -- SHOW DATABASES;


# CMD ["tail", "-f"]
CMD ["bash", "tools/start.sh"]

# hub.docker.com's way below keep on using it if you find it usefull, else, I am adding an
# rough example of MariaDB Dockefile above
# docker run --detach --name some-mariadb --env MARIADB_USERNAME=sylducam --env MARIADB_USER_PASSWORD=blabla --env MARIADB_ROOT_PASSWORD=blabla  mariadb:latest
# !! latest forbiden