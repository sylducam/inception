#!/bin/bash

set -e # exit if commands below have exit code != 0

# need condition
wp core install --url=sylducam.42.fr --title="$DB_NAME" --admin_user="$USER_NAME" \
--admin_password="$USER_PASSWORD" --admin_email=sylducam@gmail.com --allow-root \
--path=/var/www/html/wordpress
sleep 10
# echo ICI
wp user create --path=/var/www/html/wordpress "$WP_USER_NAME" "$WP_USER_EMAIL" --allow-root --user_pass="$WP_USER_PASSWORD" || true

exec /usr/sbin/php-fpm7.3 -F -R