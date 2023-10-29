FROM	debian:buster

RUN	apt-get update
RUN	apt-get install -y nginx openssl # Install nginx and openssl
#RUN	apt-get install -y iputils-ping inetutils-traceroute iproute2 curl telnet dnsutils

RUN mkdir /etc/nginx/ssl

#req: This command is used for certificate requests and certificate creation.
#-x509: This option tells OpenSSL to create a self-signed certificate.
# Self-signed certificates are commonly used for testing and development purposes, but they are not recommended for production use because they do not provide the same level of trust and security as certificates signed by a trusted certificate authority (CA)

#-newkey rsa:4096: This option generates a new RSA private key with a key length of 4096 bits.
#-keyout key.pem: This specifies the output file where the private key will be saved.
#-out cert.pem: This specifies the output file where the self-signed certificate will be saved.
#-days 365: This sets the validity period of the certificate to 365 days. You can adjust this value as needed.
#-sha256 refers to the SHA-256 (Secure Hash Algorithm 256-bit) hash function. SHA-256 is a member of the SHA-2 family of cryptographic hash functions and produces a fixed-size 256-bit (32-byte) hash value from the input data. It is widely used for data integrity verification, digital signatures, and other cryptographic purposes.
#-nodes option is used when generating a private key. It stands for "No DES," and it instructs OpenSSL not to encrypt the private key with a passphrase. When you use the -nodes option, the private key is stored in an unencrypted format, which means there is no password protection for the private key file.
#-subj option is used to specify the subject name or the distinguished name (DN) fields when creating a certificate signing request (CSR) or a self-signed certificate using the openssl req command. The subject name contains information about the entity for which the certificate is being generated, such as the common name (CN), organization (O), locality (L), state (ST), and country (C).
#OU (Organizational Unit): The OU field is used to specify a subgroup or department within an organization. For example, within a larger company, there might be various organizational units, each responsible for different functions or roles. The OU field can be used to identify which unit or department within the organization the certificate is associated with.
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/inception.crt \
       -keyout /etc/nginx/ssl/inception.key \
       -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=promo2022/CN=minh-ngu/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

# -p option is used to create parent directories if they don't already exist.
RUN mkdir -p /run/nginx

#the only port allowed
EXPOSE	443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
