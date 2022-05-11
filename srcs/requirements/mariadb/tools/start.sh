#!/bin/bash

# under which condition sould I execute or not execute this script ?
# if []
	# then
# fi

#MYSQL
service mysql start
mysql -u root  < mariadb/tools/db-config.sql

/bin/sh usr/bin/mysqld_safe