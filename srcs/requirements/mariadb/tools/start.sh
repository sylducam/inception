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
# service mysql start
# mv mariadb/tools/my.cnf /etc/mysql/my.cnf
# mysql -u root < mariadb/tools/db-config.sql
# sleep 1 # Waiting for mysql to finish the edit
# service mysql stop

exec /usr/bin/mysqld_safe
# mysqld_safe --bind-address=0.0.0.0




# mkdir -p /run/mysqld/
# touch /run/mysqld/mysqld.sock
# mysql_install_db --ldata=/var/lib/mysql --user=mysql
# mysqladmin -u root password "blabla"
# echo "test1\n"
# echo "test2\n"
# chmod -R 755 /var/run/mysqld
# echo "test3\n"
# killall mysqld mysqld_safe
# 