
FROM alpine:3.2

RUN apk update && \
    apk add bash && \
    apk add php php-pdo php-mysql && \
    apk add nginx && \
    rm -rf /var/cache/apk/* && \
    echo 'package load successed.'

CMD ["/bin/bash"]
