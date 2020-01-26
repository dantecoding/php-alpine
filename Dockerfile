FROM php:7.4-fpm-alpine

RUN apk upgrade --update
RUN apk add nano
RUN apk add bash
RUN apk add coreutils
RUN apk add freetype-dev
RUN apk add libjpeg-turbo-dev
RUN apk add libmcrypt-dev
RUN apk add libpng-dev
RUN apk add curl
RUN apk add libmemcached-dev
RUN apk add git
RUN apk add mysql-client
RUN apk add postgresql-dev
RUN apk add zlib-dev
RUN apk add icu-dev
RUN apk add supervisor
RUN apk add openssl-dev
RUN apk add imap-dev
RUN apk add unzip
RUN apk add krb5-dev
RUN apk add libzip-dev
RUN apk add libxml2-dev
RUN apk add composer
RUN apk add oniguruma-dev

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) json mbstring zip pdo pdo_mysql mysqli pdo_pgsql iconv gd exif xml opcache tokenizer ctype bcmath intl exif imap

ARG TZ=UTC
ENV TZ ${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN composer global require "hirak/prestissimo:^0.3"