# Use Alpine Linux as the base image
FROM alpine:latest

# Install necessary packages
RUN apk --no-cache update && \
    apk --no-cache add \
        php7 \
        php7-fpm \
        php7-mysqli \
        php7-json \
        php7-xml \
        php7-curl \
        php7-gd \
        php7-mbstring \
        php7-session \
        php7-simplexml \
        php7-openssl \
        php7-dom \
        php7-zip \
        php7-tokenizer \
        php7-xmlwriter \
        php7-fileinfo \
        php7-xmlreader \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_sqlite \
        php7-phar \
        php7-ctype \
        php7-iconv \
        php7-opcache \
        curl \
        tar \
        unzip

# Create a directory for WordPress
RUN mkdir -p /var/www/html

# Download and extract WordPress
RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz -C /var/www/html --strip-components=1 && \
    rm latest.tar.gz

# Set the ownership of the WordPress directory
RUN chown -R nobody:nogroup /var/www/html

# Define the volume for persistent data
VOLUME /var/www/html/wp-content

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Set the entry point to start PHP-FPM
ENTRYPOINT ["php-fpm7", "-F"]