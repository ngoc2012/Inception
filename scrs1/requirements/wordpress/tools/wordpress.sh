#!/bin/sh

if [ -f ./wp-config.php ]; then
	echo "wordpress exist"
else

echo "Start wordpress download"

mkdir -p /var/www/html
curl -O https://wordpress.org/latest.tar.gz && \
tar -xzf latest.tar.gz -C /var/www/html --strip-components=1 && \
rm latest.tar.gz

echo "End wordpress download"

fi

cp wp-config-sample.php wp-config.php

sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config.php
sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php
sed -i "/^define( 'DB_COLLATE', '' );/a define('FS_METHOD', 'direct');" wp-config.php

wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --raw --allow-root
wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
#wp config set WP_REDIS_PASSWORD $REDIS_PASSWORD --allow-root
wp config set WP_REDIS_CLIENT phpredis --allow-root
wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root
wp redis enable --allow-root

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

exec "$@"