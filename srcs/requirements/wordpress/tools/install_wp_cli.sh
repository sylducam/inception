#!/bin/bash

# wp-cli installation
# echo ICI0
# exec curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# echo ICI1
# exec chmod +x wp-cli.phar
# echo ICI2
# exec mv wp-cli.phar /usr/local/bin/wp
echo ICI3
sleep 3
exec wp core install --url=sylducam.42.fr --title="$DB_NAME" --admin_user="$USER_NAME" \
--admin_password="$USER_PASSWORD" --admin_email=sylducam@gmail.com --allow-root \
--path=/var/www/html/wordpress
echo ICI4

