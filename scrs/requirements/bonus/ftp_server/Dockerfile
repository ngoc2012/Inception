FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
        vsftpd

COPY conf/vsftpd.conf /tmp/vsftpd.conf

COPY tools/ftp.sh /tmp/ftp.sh
ENTRYPOINT ["sh", "/tmp/ftp.sh"]