FROM alpine:3.18

ARG DB_NAME \
    DB_USER \
    DB_PASS

RUN apk update && apk upgrade

COPY ./requirements/wordpress/tools/ ./
RUN sh install-php.sh && rm install-php.sh 
RUN sh install-wp.sh && rm install-wp.sh

CMD ["/usr/sbin/php-fpm82", "-F"]