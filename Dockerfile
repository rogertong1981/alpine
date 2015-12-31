FROM alpine:3.2

ADD ./start.sh /run/

RUN apk update && \
    apk add bash && \
    apk add php php-pdo php-mysql php-fpm php-cgi && \
    apk add nginx && \
    chmod a+x /run/start.sh && \
    rm -rf /var/cache/apk/* && \
    echo 'package load successed.'

COPY ./nginx.conf  /etc/nginx/nginx.conf
COPY ./info.php  /var/www/info.php


EXPOSE 80
CMD ["/bin/bash", "/run/start.sh"]
