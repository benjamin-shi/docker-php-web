# syntax=docker/dockerfile:1
FROM php:apache

RUN apt update \
    && apt -y upgrade \
    && docker-php-ext-install iconv && docker-php-ext-enable iconv \
    && docker-php-ext-install mysqli && docker-php-ext-enable mysqli \
    && apt install -y libpng-dev libjpeg-dev libfreetype*-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd && docker-php-ext-enable gd
    
EXPOSE 80/tcp
EXPOSE 443/tcp

#TAG php-web
