#!/bin/bash

# need condition
# exec wp core install --url=sylducam.42.fr --title=${DB_NAME} --admin_user=${USER_NAME} --admin_password=${USER_PASSWORD} --allow-root --path=/var/www/html/wordpress
exec /usr/sbin/php-fpm7.3 -F -R