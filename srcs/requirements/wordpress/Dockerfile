FROM debian:buster

ENV BASEDIR=/inception/wordpress
ENV WP_CONF=${BASEDIR}/conf
ENV WP_TOOLS=${BASEDIR}/tools

# need args below ?
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD
ARG DB_NAME

WORKDIR ${BASEDIR}

COPY conf ${WP_CONF}
COPY tools ${WP_TOOLS}

RUN mkdir /var/www
RUN mkdir /var/www/html
RUN chmod -R 755 /var/www/*
RUN apt-get install -y wget
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xf latest.tar.gz
RUN mv wordpress /var/www/html
RUN mv conf/wp-config.php /var/www/html/wordpress


RUN chmod 744 ${WP_TOOLS}/config.sh
RUN ${WP_TOOLS}/config.sh

EXPOSE 80 443

#PHPMYADMIN (REMAKE IT)
# RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
# RUN tar xf phpMyAdmin-latest-all-languages.tar.gz
# RUN rm phpMyAdmin-latest-all-languages.tar.gz
# RUN mv phpMyAdmin* /var/www/html/phpmyadmin

LABEL description="wordpress"

# -- rename the database
# RUN mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress; \
# CREATE USER '$MYSQL_USER' IDENTIFIED BY '$MYSQL_PASSWORD'; \
# GRANT ALL ON wordpress.* TO '$MYSQL_USER'@'%'; \
# FLUSH PRIVILEGES;"
# -- what's the use of the next line ?
# -- UPDATE mysql.user SET plugin = '' WHERE user = 'sylducam' AND host = 'localhost';
# -- SHOW DATABASES;


# CMD ["tail", "-f"]
CMD ["bash", "tools/start.sh"]

# hub.docker.com's way below keep on using it if you find it usefull, else, I am adding an
# rough example of MariaDB Dockefile above
# docker run --detach --name some-mariadb --env MARIADB_USER=sylducam --env MARIADB_PASSWORD=blabla --env MARIADB_ROOT_PASSWORD=blabla  mariadb:latest
# !! latest forbiden