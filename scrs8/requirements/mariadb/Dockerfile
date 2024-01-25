FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server gettext-base expect && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

#COPY ./conf/mysqld.conf /etc/mysql/conf.d/
COPY ./conf/mysqld.conf /etc/mysql/my.cnf

EXPOSE 3306

COPY ./tools/init.sql /usr/local/bin/
COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh
ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0", "--init-file=/usr/local/bin/init.sql"]