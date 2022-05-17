-- rename the database
CREATE DATABASE IF NOT EXISTS DB_NAME;
CREATE USER 'MYSQL_USER' IDENTIFIED BY 'MYSQL_PASSWORD';
GRANT ALL ON DB_NAME.* TO 'MYSQL_USER'@'%';
-- what's the use of the next line ?
-- UPDATE mysql.user SET plugin = '' WHERE user = 'sylducam' AND host = 'localhost';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'MYSQL_ROOT_PASSWORD';
