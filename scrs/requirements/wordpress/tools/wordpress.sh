#!/bin/sh

if [ -f ./wp-config.php ]; then
	echo "wordpress exist"
	exit 0
fi

#Download wordpress and all config file
#wget http://wordpress.org/latest.tar.gz
#tar xfz latest.tar.gz
#mv wordpress/* .
#rm -rf latest.tar.gz
#rm -rf wordpress
mkdir -p /var/www/html
curl -O https://wordpress.org/latest.tar.gz && \
tar -xzf latest.tar.gz -C /var/www/html --strip-components=1 && \
rm latest.tar.gz

sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
cp wp-config-sample.php wp-config.php