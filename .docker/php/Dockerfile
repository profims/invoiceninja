FROM php:8.4-fpm-alpine3.23

ENV TZ=Europe/Warsaw

RUN set -eux; \
    apk add \
        bash \
        git
RUN git config --system --add safe.directory '*'
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN set -eux; \
    install-php-extensions \
        gd \
        bcmath \
        pdo_mysql \
        zip
RUN set -eux; \
    docker-php-ext-enable \
        gd \
        bcmath \
        pdo_mysql \
        zip

ENV COMPOSER_ALLOW_SUPERUSER=1
COPY --from=composer/composer:2-bin /composer /usr/bin/composer

COPY --link /app /app
COPY --link /bootstrap /app
COPY --link /config /app
COPY --link /database /app
COPY --link /lang /app
COPY --link /routes /app
COPY --link /storage /app
COPY --link /.env /app
COPY --link /artisan /app
COPY --link /composer.json /app
COPY --link /composer.lock /app
COPY --link /preload.php /app
WORKDIR /app

RUN mkdir -p /app/bootstrap/cache /app/storage/logs /app/public/storage
RUN chown -R www-data:www-data /app/bootstrap/cache /app/storage/logs /app/public/storage
RUN chmod -R ug+rwX /app/bootstrap/cache /app/storage/logs /app/public/storage

# Copy PHP configuration
COPY --link .docker/php/php.ini /usr/local/etc/php/php.ini

CMD ["php-fpm"]
