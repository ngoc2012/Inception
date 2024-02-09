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

cp wp-config-sample.php wp-config.php
cp /usr/local/bin/hide-toolbar.php wp-content/plugins

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
#wp plugin install redis-cache --activate --allow-root
#wp plugin update --all --allow-root
#wp redis enable --allow-root

# Install WordPress (if not already installed)
wp core install --url="https://$DOMAIN_NAME" --title="Inception" --admin_user="$WORDPRESS_USER" --admin_password="$WORDPRESS_PWD" --admin_email="minh-ngu@student.42.fr" --allow-root

wp plugin install https://downloads.wordpress.org/plugin/redis-cache.latest-stable.zip --activate --allow-root
wp plugin update --all --allow-root
# Next, enable the drop-in:

wp redis enable --allow-root
# Check the connection:
wp redis status --allow-root
wp option update show_on_front 'page' --quiet --allow-root

fi

chown -R www-data:www-data /var/www/html
chmod -R 776 /var/www/html

exec "$@"