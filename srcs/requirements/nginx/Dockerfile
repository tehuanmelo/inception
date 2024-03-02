FROM alpine:3.18

RUN	apk update && apk upgrade && apk add --no-cache nginx openssl

COPY ./requirements/nginx/conf/ /etc/nginx/http.d/
COPY ./requirements/nginx/tools/run_daemon.sh /
RUN chmod 777 /run_daemon.sh

EXPOSE 443

CMD ["sh", "run_daemon.sh"]