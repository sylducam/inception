#!/bin/bash

# if [[ ! -d /var/lib/mysql/$DB_NAME ]]; then
    # mysql_install_db --ldata=/var/lib/mysql --user=mysql

    # service mysql start
    
# exec mysqladmin -u root -p "$MYQSL_ROOT_PASSWORD"

    # service mysql stop

# fi

exec /usr/bin/mysqld_safe

# mysql -u root < db-config.sql

# mysqld_safe --bind-address=0.0.0.0

# mysql_install_db --ldata=/var/lib/mysql --user=mysql
# mysqladmin -u root password "blabla"