FROM alpine:3.18

RUN apk update && apk add nginx openssl

EXPOSE 443

COPY ./requirements/nginx/conf/ /etc/nginx/http.d/
COPY ./requirements/nginx/tools/ /etc/nginx/ssl/

CMD ["nginx", "-g", "daemon off;"]
