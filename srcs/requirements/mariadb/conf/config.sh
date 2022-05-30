#!/bin/bash

sed -i "s/DB_NAME/$DB_NAME/g"							"$DB_CONF/db-config.sql"
sed -i "s/USER_NAME/$USER_NAME/g"						"$DB_CONF/db-config.sql"
sed -i "s/USER_PASSWORD/$USER_PASSWORD/g"				"$DB_CONF/db-config.sql"
sed -i "s/MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/g"	"$DB_CONF/db-config.sql"
cat $DB_CONF/db-config.sql 

service mysql start
mv $DB_CONF/my.cnf /etc/mysql/my.cnf
mysql -u root < $DB_CONF/db-config.sql
sleep 1 # Waiting for mysql to finish the edit
# service mysql stop