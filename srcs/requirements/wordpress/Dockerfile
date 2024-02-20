FROM alpine:3.18

COPY ./tools/* ./
COPY ./conf/* ./

RUN /bin/sh install-apps.sh && rm install-apps.sh && \
    /bin/sh php-config.sh && rm php-config.sh

WORKDIR /var/www/


