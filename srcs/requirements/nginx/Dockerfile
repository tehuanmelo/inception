FROM alpine:3.18

ARG DOMAIN_NAME\
    CERT_

RUN apk update && apk add nginx openssl

EXPOSE 443

COPY ./requirements/nginx/conf/ /etc/nginx/http.d/
COPY ${CERT_} /etc/nginx/ssl/

CMD ["nginx", "-g", "daemon off;"]
