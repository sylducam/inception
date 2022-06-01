#!/bin/bash

# wp-cli installation
exec curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
exec chmod +x wp-cli.phar
exec mv wp-cli.phar /usr/local/bin/wp
exec wp core install --url=sylducam.42.fr --title=${DB_NAME} --admin_user=${USER_NAME} --admin_password=${USER_PASSWORD} --allow-root --path=/var/www/html/wordpress

