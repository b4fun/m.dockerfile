#!/bin/sh

set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

cd /app
composer install
php artisan optimize || true
chown -R www-data:www-data /app/storage

cd /app/public
exec "$@"
