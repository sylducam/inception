FROM debian:buster

# expose effective in yml, here only for readability
EXPOSE 9000

ENV BASEDIR=/home/sylducam/wordpress_container
ENV WP_CONF=${BASEDIR}/conf
ENV WP_TOOLS=${BASEDIR}/tools

# need args below ?
ARG USER_NAME
ARG USER_PASSWORD
ARG MYSQL_ROOT_PASSWORD
ARG DB_NAME

WORKDIR ${BASEDIR}

RUN apt-get update && apt-get -y upgrade
# del line below
RUN apt-get install -y vim
RUN apt-get install -y curl
RUN apt-get install -y php
RUN apt-get install -y php-fpm
RUN apt-get install -y php-mysqli
RUN mkdir /run/php

# wordpress installation
RUN mkdir -p /var/www/html
RUN chmod -R 755 /var/www/*
RUN apt-get install -y wget
RUN wget https://wordpress.org/wordpress-5.9.3.tar.gz
RUN tar xf wordpress-5.9.3.tar.gz
RUN mv wordpress /var/www/html

# wp-cli installation
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf ${WP_CONF}
COPY tools ${WP_TOOLS}
RUN mv conf/wp-config.php /var/www/html/wordpress
RUN sed -i "s|%%DB_NAME%%|$DB_NAME|" /var/www/html/wordpress/wp-config.php
RUN sed -i "s|%%WORDPRESS_DB_USER%%|$USER_NAME|" /var/www/html/wordpress/wp-config.php
RUN sed -i "s|%%WORDPRESS_DB_PSSWD%%|$USER_PASSWORD|" /var/www/html/wordpress/wp-config.php
RUN sed -i "s|listen =.*|listen = 0.0.0.0:9000|" /etc/php/7.3/fpm/pool.d/www.conf
RUN wp core install --url=sylducam.42.fr --title=${DB_NAME} --admin_user=${USER_NAME} --admin_password=${USER_PASSWORD} --allow-root --path=/var/www/html/wordpress

LABEL description="wordpress"

# CMD ["tail", "-f"]
CMD ["bash", "tools/start.sh"]