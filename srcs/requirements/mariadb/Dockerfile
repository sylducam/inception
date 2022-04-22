# buster or bullseye ?
FROM debian:bullseye

# ARG DEBIAN_FRONTEND=noninteractive **

# keep both server and client ? one of them ?
# maybe install apt-utils via docker-compose or in each Dockerfile
RUN apt-get update && apt-get install -y mariadb-client mariadb-server
# apt-utils & curl if you want not to have the debconf: delaying package configuration... warning 
# ** adds to the line above
 
# needed ? this is from ft_server's Dockerfile
#COPY srcs/ .

EXPOSE 3306

HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 1

CMD ["mysqld"]

# needed ? this is from ft_server's Dockerfile
# ENTRYPOINT ["bash", "start.sh"]

# hub.docker.com's way below keep on using it if you find it usefull, else, I am adding an
# rough example of MariaDB Dockefile above
# docker run --detach --name some-mariadb --env MARIADB_USER=sylducam --env MARIADB_PASSWORD=blabla --env MARIADB_ROOT_PASSWORD=blabla  mariadb:latest
# should I use "latest" >> see message from tglory on compatibility OS/pkg (Debian 10/11)
