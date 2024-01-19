# Use the official Alpine Linux image
FROM alpine:latest

# Install Nginx and OpenSSL
RUN apk --no-cache add nginx openssl

# Set the working directory to the default Nginx web root
WORKDIR /usr/share/nginx/html

# Create SSL directory
RUN mkdir -p /etc/nginx/ssl

# Generate a self-signed SSL certificate
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/minh-ngu.crt \
    -keyout /etc/nginx/ssl/minh-ngu.key \
    -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=minh-ngu/CN=minh-ngu/"

# Copy your custom Nginx configuration file to the container
COPY ./conf/nginx.conf /etc/nginx/

# Expose ports 80 and 443 for HTTP and HTTPS, respectively
EXPOSE 80
EXPOSE 443

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]