FROM debian:buster

EXPOSE 443

ENV BASEDIR=/home/sylducam/nginx_container
ENV NGINX_CONF=${BASEDIR}/conf

WORKDIR ${BASEDIR}

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl
RUN apt-get install -y openssl
RUN apt-get install -y nginx

COPY conf ${NGINX_CONF}

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout \
/etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj \
"/C=FR/ST=AURA/L=Lyon/O=42/OU=sylducam/CN=localhost/emailAddress=sylducam@student.42-lyon.fr"
RUN cp ${NGINX_CONF}/default /etc/nginx/sites-enabled

RUN chown -R www-data:www-data /var/www/html
RUN chmod 755 /var/www/*

LABEL description="nginx"

CMD ["nginx", "-g", "daemon off;"]