FROM php:8-cli
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
WORKDIR /app
COPY . .
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN apt update && \
    apt install git zip -y && \
    composer install --prefer-dist --ignore-platform-reqs --no-cache --no-dev
EXPOSE 8000
ENTRYPOINT ["php", "artisan", "serve", "--host", "0.0.0.0", "--port", "8000"]
