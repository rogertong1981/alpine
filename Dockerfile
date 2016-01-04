FROM alpine:latest

ADD ./start.sh /run/

RUN apk update && \
    apk add bash && \
    apk add php php-pdo php-mysql php-fpm php-cgi php-pdo_mysql php-json php-xml php-zlib php-mbstring php-mcrypt && \
    apk add nginx && \
    chmod a+x /run/start.sh && \
    mkdir -p /var/php/session && \
    chmod 777 /var/php/session && \
    rm -rf /var/cache/apk/* && \
    echo 'package load successed.'

COPY ./nginx.conf  /etc/nginx/nginx.conf
COPY ./php.ini /etc/php/php.ini
COPY ./info.php  /var/www/info.php


EXPOSE 80
ENTRYPOINT ["/bin/bash", "/run/start.sh"]
