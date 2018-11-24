FROM php:7-fpm-alpine

RUN apk add --no-cache --virtual .build-deps \
    curl-dev \
    imagemagick-dev \
    libtool \
    libxml2-dev \
    sqlite-dev

RUN apk add --no-cache \
    curl \
    imagemagick \
    libc-dev \
    libpng-dev \
    mysql-client

RUN pecl install \
    imagick \
    xdebug
RUN pear install PHP_CodeSniffer

RUN docker-php-ext-enable \
    imagick \
    xdebug
RUN docker-php-ext-install \
    curl \
    iconv \
    mbstring \
    pdo \
    pdo_mysql \
    pdo_sqlite \
    pcntl \
    tokenizer \
    xml \
    gd \
    zip \
    bcmath

RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH="./vendor/bin:$PATH"

# Cleanup dev dependencies
RUN apk del -f .build-deps

WORKDIR /app/public
