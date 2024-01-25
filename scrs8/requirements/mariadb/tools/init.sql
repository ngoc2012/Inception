CREATE DATABASE $MYSQL_DATABASE;

CREATE USER '$MYSQL_ROOT_NAME'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_ROOT_NAME'@'%' WITH GRANT OPTION;

CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';

ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;

---- Create root user
--CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
--GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
--
---- Debug: Print the list of users after creating root user
--SELECT user, host FROM mysql.user;
--
---- Alter root user password
--ALTER USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
--
---- Debug: Print the list of users after altering root user
--SELECT user, host FROM mysql.user;

FLUSH PRIVILEGES;