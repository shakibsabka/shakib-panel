#!/bin/bash

echo "🚀 Installing Shakib Panel..."

apt update && apt upgrade -y
apt install -y php php-cli php-fpm php-mysql php-mbstring php-xml php-curl php-bcmath unzip git nginx mysql-server curl composer

chown -R www-data:www-data .
chmod -R 755 storage bootstrap/cache

composer install --no-dev --optimize-autoloader

if [ ! -f .env ]; then
    cp .env.example .env
    php artisan key:generate
    echo "⚠️ Please edit the .env file with your DB credentials."
    echo "Then run: php artisan migrate --seed --force"
else
    echo "✅ .env already exists."
fi

echo "✅ Installation complete."
