#!/bin/bash

set -e # exit if commands below have exit code != 0

# need condition
wp core install --url=sylducam.42.fr --title="$DB_NAME" --admin_user="$USER_NAME" \
--admin_password="$USER_PASSWORD" --admin_email=sylducam@gmail.com --allow-root \
--path=/var/www/html/wordpress

exec /usr/sbin/php-fpm7.3 -F -R