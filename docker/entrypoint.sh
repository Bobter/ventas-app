#!/bin/sh

if [ ! -d "vendor" ]; then
    echo "Instalando dependencias con Composer..."
    composer install
fi

chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache
chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

php artisan migrate --force

php-fpm
