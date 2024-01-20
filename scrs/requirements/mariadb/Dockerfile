FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh

EXPOSE 3306

CMD ["mysqld", "--bind-address=0.0.0.0"]

