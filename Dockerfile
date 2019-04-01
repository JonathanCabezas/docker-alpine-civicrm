FROM samirkherraz/alpine-s6

ENV VERSION=8.1.10

RUN set -x \
    && apk update \
    && apk add --no-cache mysql-client git composer php7 php7-fpm php7-dom php7-gd php7-json php7-mysqli php7-opcache php7-pdo php7-pdo_mysql php7-session php7-simplexml php7-tokenizer php7-xml php7-xmlwriter php7-ctype php7-curl \
    && apk add --no-cache --virtual nginx \
    && rm /etc/nginx/conf.d/default.conf \
    && mkdir /run/nginx \
    && chown nginx:nginx /run/nginx

ADD conf/ /

RUN set -x \
    && chmod +x /etc/cont-init.d/* \
    && chmod +x /etc/s6/services/*/*
