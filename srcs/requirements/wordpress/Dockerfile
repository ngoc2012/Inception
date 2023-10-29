FROM debian:buster

RUN apt-get update && apt-get -y install \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	redis \
	php-redis \
	#&& rm -rf /var/lib/apt/lists/*

# I need to install wp_cli command and put it in the right directory /usr/local/bin
#RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#  && chmod +x wp-cli.phar \
#  && mv wp-cli.phar /usr/local/bin/wp

#https://ubuntu.com/tutorials/install-and-configure-wordpress#3-install-wordpress
RUN mkdir -p /srv/www
RUN chown www-data: /srv/www
COPY ./tools/latest.tar.gz /srv/www
RUN tar -xzf /srv/www/latest.tar.gz -C /srv/www
RUN rm /srv/www/latest.tar.gz
#RUN curl https://wordpress.org/latest.tar.gz | tar zx -C /srv/www

# Copy the .conf in the html directory
#COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

#Create the folder to enable php start
#RUN mkdir /run/php

##we copy the script, give the right to launch it in local on our computer
#COPY ./tools/wordpress.sh /usr/local/bin/
#RUN chmod +x /usr/local/bin/wordpress.sh
#ENTRYPOINT ["/usr/local/bin/wordpress.sh"]
#
##We go the html directory
WORKDIR /srv/www/wordpress
RUN chown -R www-data:www-data /srv/www/wordpress
RUN cp wp-config-sample.php wp-config.php
RUN sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
RUN sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
RUN sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config.php
RUN sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php

#RUN echo "================== Expose ==================="
##We expose the 9000 port
EXPOSE 9000
#
##Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
#CMD ["/usr/sbin/php-fpm7.3", "-F"]
#
##Give File Ownership to wordpress
#RUN echo "================== file ownership ==================="
#RUN chown -R www-data:www-data /var/www/html/
