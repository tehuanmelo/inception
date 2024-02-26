FROM alpine:3.18

ARG DB_NAME \
    DB_USER \
    DB_PASS

RUN apk update && apk add --no-cache mariadb mariadb-client

EXPOSE 3306

COPY requirements/mariadb/conf/create_database.sh .

RUN sh create_database.sh && rm create_database.sh

USER mysql

CMD ["/usr/bin/mysqld", "--skip-log-error"]