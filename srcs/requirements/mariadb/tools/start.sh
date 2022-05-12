#!/bin/bash

# under which condition sould I execute or not execute this script ?
# if []
	# then
# fi

#MYSQL
service mysql start
mysql -u root < mariadb/tools/db-config.sql
# killall mysqld mysqld_safe
/bin/sh /usr/bin/mysqld_safe
# while :
# do
	# echo "Do something; hit [CTRL+C] to stop!"
# done