#!/bin/bash

service mysql start
mv mariadb/tools/my.cnf /etc/mysql/my.cnf
mysql -u root < mariadb/tools/db-config.sql
sleep 1 # Waiting for mysql to finish the edit
service mysql stop