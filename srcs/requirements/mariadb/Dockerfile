# buster or bullseye ?
FROM debian:buster

# ARG DEBIAN_FRONTEND=noninteractive **

# keep both server and client ? one of them ?
# maybe install apt-utils via docker-compose or in each Dockerfile
RUN apt-get upgrade && apt-get update && apt-get install -y mariadb-client mariadb-server
RUN apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common
RUN apt-get install -y php7.3-json php7.3-opcache php7.3-readline php-mbstring php-zip php-gd
RUN apt-get install -y php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip
# apt-utils & curl if you want not to have the debconf: delaying package configuration... warning 
# ** adds to the line above
 
# needed ? this is from ft_server's Dockerfile
#COPY srcs/ .

EXPOSE 3306

RUN service mysql start
RUN apt-get install -y aptitude expect

RUN SECURE_MYSQL=$(expect -c "set timeout 10 spawn mysql_secure_installation\
expect \"Enter current password for root (enter for none):\" send \"$MYSQL\r\"\
expect \"Change the root password?\" send \"n\r\" expect \"Remove anonymous users?\" send \"n\r\"\
expect \"Disallow root login remotely?\" send \"n\r\"\
expect \"Remove test database and access to it?\" send \"n\r\"\
expect \"Reload privilege tables now?\" send \"n\r\" expect eof ") echo "$SECURE_MYSQL"

# labels are mandatory from docker 1.3 and very usefull to avoid having multiple same containers
LABEL version="1.0"
LABEL description="MariaDB Server"

# HEALTHCHECK --start-period=5m \
  # CMD mariadb -e 'SELECT @@datadir;' || exit 1

CMD ["mysqld"]

# needed ? this is from ft_server's Dockerfile
# ENTRYPOINT ["bash", "start.sh"]

# hub.docker.com's way below keep on using it if you find it usefull, else, I am adding an
# rough example of MariaDB Dockefile above
# docker run --detach --name some-mariadb --env MARIADB_USER=sylducam --env MARIADB_PASSWORD=blabla --env MARIADB_ROOT_PASSWORD=blabla  mariadb:latest
# !! latest forbiden

# service mysql start\
# aptitude -y install expect SECURE_MYSQL=$(expect -c "set timeout 10 spawn mysql_secure_installation\
# expect \"Enter current password for root (enter for none):\" send \"$MYSQL\r\"\
# expect \"Change the root password?\" send \"n\r\" expect \"Remove anonymous users?\" send \"n\r\"\
# expect \"Disallow root login remotely?\" send \"n\r\"\
# expect \"Remove test database and access to it?\" send \"n\r\"\
# expect \"Reload privilege tables now?\" send \"n\r\" expect eof ") echo "$SECURE_MYSQL"\
# aptitude -y purge expect mysql -u root  < mysql.sql