FROM debian:buster

RUN apt-get update && apt-get install -y php7.3-fpm php7.3-common php7.3-mysql curl mariadb-client && mkdir -p /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chmod +x wp-cli.phar \
    && cp wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

COPY tool/script.sh /tmp/script.sh

RUN	chmod +x /tmp/script.sh

WORKDIR /var/www/html/

ENTRYPOINT ["/tmp/script.sh"]

CMD ["php-fpm7.3", "-F", "-R"]
