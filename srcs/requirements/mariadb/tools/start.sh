#!/bin/bash

# under which condition sould I execute or not execute this script ?
# if []
	# then
# fi

#MYSQL
mysql -u root  < db-config.sql

mysqld_safe