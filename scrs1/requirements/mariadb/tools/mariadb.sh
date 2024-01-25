#!/bin/bash

# Check if the MYSQL_ROOT_PASSWORD environment variable is set
if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
  echo "Error: MYSQL_ROOT_PASSWORD is not set. Set it in your .env file."
  exit 1
fi

# Execute the SQL query to check if the database exists
result=$(mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SHOW DATABASES LIKE '$MYSQL_DATABASE';" 2>/dev/null)

# Check if the result contains the database name
if [[ "$result" == *"$MYSQL_DATABASE"* ]]; then
    echo "Database '$MYSQL_DATABASE' exists."
else


#if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then 
#	echo "Database already exists"
#	exit 0
#fi

# Set the root password
echo "mariadb-server-10.3 mysql-server/root_password password $MYSQL_ROOT_PASSWORD" | debconf-set-selections
echo "mariadb-server-10.3 mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD" | debconf-set-selections

# Run MySQL initialization scripts
echo "Starting MySQL service..."
service mysql start
echo "MySQL service started."

# Perform variable substitution and execute the SQL script
#envsubst < /usr/local/bin/init.sql | mariadb -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -h #"$MYSQL_HOSTNAME" -P "$3306"
#envsubst < /usr/local/bin/init.sql
echo "Attempting to connect to MySQL server..."
#envsubst < /usr/local/bin/init.sql | mariadb -u root -p"$MYSQL_ROOT_PASSWORD" -h "$MYSQL_HOSTNAME" -P "3306"
envsubst < /usr/local/bin/init.sql | mysql -u root
echo "Connected to MySQL server."

#mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "source /usr/local/bin/init.sql"

# Stop MySQL service to let the CMD start it properly
service mysql stop

fi

exec "$@"