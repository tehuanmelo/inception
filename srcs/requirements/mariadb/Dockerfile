FROM alpine:3.18

ARG DB_NAME\
     DB_PASS\
     DB_ROOT\
     DB_USER

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY ./requirements/mariadb/conf/* ./etc/my.cnf.d/
COPY ./requirements/mariadb/tools/* ./

RUN sh ./create_database.sh && rm -f create_database.sh && \
     rm -f /var/cache/apk/*

EXPOSE 3306

USER mysql
CMD ["/usr/bin/mysqld", "--skip-log-error"]