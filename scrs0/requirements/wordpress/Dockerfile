# Use Debian as the base image
FROM debian:bullseye-slim

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
        php7.4 \
        php7.4-fpm \
        php7.4-mysql \
        php7.4-json \
        php7.4-xml \
        php7.4-curl \
        php7.4-gd \
        php7.4-mbstring \
        php7.4-zip \
        php7.4-opcache \
        curl \
        tar \
        unzip

# Create a directory for WordPress
RUN mkdir -p /var/www/html

# Download and extract WordPress
RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz -C /var/www/html --strip-components=1 && \
    rm latest.tar.gz

# https://github.com/rlerdorf/php7dev/issues/48
# create the log file, so php-fpm can write on it:
RUN touch /var/log/fpm-php.www.log && chmod 666 /var/log/fpm-php.www.log
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

#Create the folder to enable php start
RUN mkdir /run/php

# Set the ownership of the WordPress directory
RUN chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html/

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Set the entry point to start PHP-FPM
CMD ["php-fpm7.4", "-F"]
