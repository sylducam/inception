#!/bin/bash

# under which condition sould I execute or not execute this script ?
# if []
	# then
# fi

#MYSQL
# service mysql start
cd /etc/init.d
mysqld start
cd /
mysql -u root < mariadb/tools/db-config.sql
/bin/sh /usr/bin/mysqld_safe
# killall mysqld mysqld_safe
# while :
# do
	# echo "Do something; hit [CTRL+C] to stop!"
# done