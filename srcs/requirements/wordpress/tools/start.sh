#!/bin/bash

# under which condition sould I execute or not execute this script ?
# if []
	# then
# fi
# while :
# do
# 	echo "Do something; hit [CTRL+C] to stop!"
# done
#MYSQL
# add if condition above but get it right
exec /usr/bin/mysqld_safe

# mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress;
# # CREATE USER_NAME '$USER_NAME' IDENTIFIED BY '$USER_PASSWORD' \
# # GRANT ALL ON wordpress.* TO '$USER_NAME'@'%' \
# # FLUSH PRIVILES;"

# mysql -u root < db-config.sql

# mysqld_safe --bind-address=0.0.0.0

# mysql_install_db --ldata=/var/lib/mysql --user=mysql
# mysqladmin -u root password "blabla"