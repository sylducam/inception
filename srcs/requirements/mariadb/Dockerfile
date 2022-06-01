FROM debian:buster

ENV BASEDIR=/home/sylducam/mariadb_container
ENV DB_TOOLS=${BASEDIR}/tools
ENV DB_CONF=${BASEDIR}/conf

ARG USER_NAME
ARG USER_PASSWORD
ARG MYSQL_ROOT_PASSWORD
ARG DB_NAME

WORKDIR ${BASEDIR}

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl
RUN apt-get install -y mariadb-server

COPY tools ${DB_TOOLS}
COPY conf ${DB_CONF}
RUN chmod 744 ${DB_CONF}/config.sh
RUN ${DB_CONF}/config.sh
RUN sed -i "s|127.0.0.1|0.0.0.0|" /etc/mysql/mariadb.conf.d/50-server.cnf

LABEL description="MariaDB"

CMD ["bash", "tools/start.sh"]