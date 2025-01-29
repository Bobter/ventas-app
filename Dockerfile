FROM php:8.3-fpm-alpine

WORKDIR /var/www/html

RUN apk update && apk add \
    build-base \
    mysql-client \
    libzip-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-install pdo_mysql zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

COPY sales-api/ .

EXPOSE 9000

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
