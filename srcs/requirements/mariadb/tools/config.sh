#!/bin/bash

sed -i "s/DB_NAME/$DB_NAME/g"							"$DB_TOOLS/db-config.sql"
sed -i "s/MYSQL_USER/$MYSQL_USER/g"						"$DB_TOOLS/db-config.sql"
sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g"				"$DB_TOOLS/db-config.sql"
sed -i "s/MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/g"	"$DB_TOOLS/db-config.sql"
cat $DB_TOOLS/db-config.sql 

service mysql start
mv $DB_TOOLS/my.cnf /etc/mysql/my.cnf
mysql -u root < $DB_TOOLS/db-config.sql
echo coucou
sleep 1 # Waiting for mysql to finish the edit
# service mysql stop