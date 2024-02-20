FROM alpine:3.18

ARG DB_NAME\
     DB_USER\
     DB_PASS

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY ./requirements/mariadb/conf/* /etc/my.cnf.d/
COPY ./requirements/mariadb/conf/* /etc/my.cnf.d/
COPY ./requirements/mariadb/tools/* /tmp/

RUN sh /tmp/install_database.sh && \
     sh /tmp/create_database.sh 

EXPOSE 3306

USER mysql
CMD ["/usr/bin/mysqld", "--skip-log-error"]