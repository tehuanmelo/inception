FROM alpine:3.18

RUN	apk update && apk upgrade && apk add --no-cache nginx openssl

COPY ./requirements/nginx/conf/ /etc/nginx/http.d/

COPY ./requirements/nginx/tools/create_ssl.sh /
RUN chmod 777 /create_ssl.sh

EXPOSE 443

CMD ["sh", "create_ssl.sh"]