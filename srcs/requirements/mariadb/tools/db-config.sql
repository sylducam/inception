-- rename the database
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER '$MYSQL_USER' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL ON wordpress.* TO '$MYSQL_USER'@'%';
-- what's the use of the next line ?
-- UPDATE mysql.user SET plugin = '' WHERE user = 'sylducam' AND host = 'localhost';
FLUSH PRIVILEGES;
-- SHOW DATABASES;
