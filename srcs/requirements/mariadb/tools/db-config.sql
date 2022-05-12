/* rename the database */
CREATE DATABASE IF NOT EXISTS wordpress;
/* below is just a test, you will have to put the password in the .env file */
CREATE USER 'sylducam' IDENTIFIED BY 'blabla';
GRANT ALL ON wordpress.* TO 'sylducam'@'%';
UPDATE mysql.user SET plugin = '' WHERE user = 'sylducam' AND host = 'localhost';
FLUSH PRIVILEGES;
-- SHOW DATABASES;
