/* rename the database */
CREATE DATABASE IF NOT EXISTS wordpress;
/* below is just a test, you will have to put the password in the .env file */
GRANT ALL ON wordpress.* TO 'sylducam'@'localhost' IDENTIFIED BY 'root' WITH GRANT OPTION;
