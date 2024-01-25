FROM debian:buster

# Install vsftpd
RUN apt-get update && \
    apt-get install -y vsftpd && \
    rm -rf /var/lib/apt/lists/*

# Copy vsftpd configuration file
COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/ftp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/ftp.sh
ENTRYPOINT ["/usr/local/bin/ftp.sh"]

EXPOSE 21

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]