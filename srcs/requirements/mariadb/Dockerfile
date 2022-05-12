FROM debian:buster

# keep both server and client ? one of them ?
# maybe install apt-utils via docker-compose or in each Dockerfile
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y vim
RUN apt-get install -y procps
RUN apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client
# RUN apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common
# RUN apt-get install -y php7.3-json php7.3-opcache php7.3-readline php-mbstring php-zip php-gd
# RUN apt-get install -y php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

COPY tools/start.sh mariadb/tools/start.sh
COPY tools/db-config.sql mariadb/tools/db-config.sql

EXPOSE 3307

#PHPMYADMIN (REMAKE IT)
# RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
# RUN tar xf phpMyAdmin-latest-all-languages.tar.gz
# RUN rm phpMyAdmin-latest-all-languages.tar.gz
# RUN mv phpMyAdmin* /var/www/html/phpmyadmin

# labels are mandatory from docker 1.3 and very usefull to avoid having multiple same containers
LABEL description="MariaDB"

CMD ["bash", "mariadb/tools/start.sh"]

# hub.docker.com's way below keep on using it if you find it usefull, else, I am adding an
# rough example of MariaDB Dockefile above
# docker run --detach --name some-mariadb --env MARIADB_USER=sylducam --env MARIADB_PASSWORD=blabla --env MARIADB_ROOT_PASSWORD=blabla  mariadb:latest
# !! latest forbiden