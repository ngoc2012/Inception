#!/bin/bash

# Check if the database exists
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
  echo "Database already exists"
else

echo "Securing MySQL installation..."
# Make sure that NOBODY can access the server without a password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;"
# Kill the anonymous users
#mysql -e "DROP USER ''@'localhost'"
# Because our hostname varies we'll use some Bash magic here.
#mysql -e "DROP USER ''@'$(hostname)'"
# Kill off the demo database
#mysql -e "DROP DATABASE test"
# Make our changes take effect
#mysql -e "FLUSH PRIVILEGES"
# Any subsequent tries to run queries this way will get access denied because lack of usr/pwd param

#echo "Securing MySQL installation..."
#  MYSQL_SECURE_INSTALLATION_CMD="mysql_secure_installation -p$#{MYSQL_ROOT_PASSWORD} -n -w -r -y"
#  echo -e "\n\n\n\n\n\n" | $MYSQL_SECURE_INSTALLATION_CMD
#
#  echo "MySQL secured successfully."

# Run mysql_secure_installation with automatic answers
#echo "Securing MySQL installation..."
#echo "y
#${MYSQL_ROOT_PASSWORD}
#${MYSQL_ROOT_PASSWORD}
#y
#y
#y
#y
#" | mysql_secure_installation

#mysql_secure_installation << _EOF_
#
#Y
#root4life
#root4life
#Y
#n
#Y
#Y
#_EOF_

#  # Run mysql_secure_installation with automatic answers
#echo "Securing MySQL installation..."
#echo "mysql_secure_installation <<EOF
#${MYSQL_ROOT_PASSWORD}
#Y
#${MYSQL_ROOT_PASSWORD}
#${MYSQL_ROOT_PASSWORD}
#Y
#Y
#Y
#Y
#EOF
#"#

#mysql_secure_installation <<EOF
#${MYSQL_ROOT_PASSWORD}
#Y
#${MYSQL_ROOT_PASSWORD}
#${MYSQL_ROOT_PASSWORD}
#Y
#Y
#Y
#Y
#EOF

echo "MySQL secured successfully."

  # Import database using init.sql
  envsubst < /usr/local/bin/init.sql | mysql -u root -p$MYSQL_ROOT_PASSWORD
  echo "End of import."
fi

exec "$@"