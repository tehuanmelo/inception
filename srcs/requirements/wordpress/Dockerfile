FROM alpine:3.18

ARG DB_NAME\
     DB_USER\
     DB_PASS


COPY ./requirements/wordpress/tools/* ./

RUN /bin/sh install-php.sh && rm install-php.sh && \
    /bin/sh install-wp.sh && rm install-wp.sh && \
    rm -f /var/cache/apk/*

CMD ["/usr/sbin/php-fpm82", "-F"]



