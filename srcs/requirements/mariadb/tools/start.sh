#!/bin/bash

# under which condition sould I execute or not execute this script ?
# if []
	# then
# fi

#MYSQL
# service mysql start
# add if condition above but get it right
mysql_install_db --ldata=/var/lib/mysql --user=mysql
mysqladmin -u root password "blabla"
echo "test1\n"
mv mariadb/tools/my.cnf /etc/mysql/my.cnf
echo "test2\n"
mysql -u root < mariadb/tools/db-config.sql
chmod -R 755 /var/run/mysqld
echo "test3\n"
# /bin/sh /usr/bin/mysqld_safe
mysqld_safe --bind-address=0.0.0.0
# killall mysqld mysqld_safe
# while :
# do
	# echo "Do something; hit [CTRL+C] to stop!"
# done