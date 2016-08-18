echo "========================================="
echo "=                                       ="
echo "=          container starting           ="
echo "=                                       ="
echo "========================================="
php-cgi -b 127.0.0.1:9000 -c /etc/php/php.ini &
nginx -g "daemon off;" &
/bin/bash
