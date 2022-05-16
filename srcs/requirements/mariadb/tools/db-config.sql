-- rename the database
CREATE DATABASE IF NOT EXISTS wordpress;
-- below is just a test, you will have to put the password in the .env file
CREATE USER '$MYSQL_USER' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL ON wordpress.* TO '$MYSQL_USER'@'%';
-- what's the use of the next line ?
UPDATE mysql.user SET plugin = '' WHERE user = 'sylducam' AND host = 'localhost';
FLUSH PRIVILEGES;
-- SHOW DATABASES;
