CREATE DATABASE wordpress;
/* below is just a test, you will have to put the password in the .env file */
GRANT ALL ON wordpress.* TO '$USER'@'localhost' IDENTIFIED BY 'root' WITH GRANT OPTION;