cp .env.example .env
php artisan key:generate
# Edit .env for DB settings
php artisan migrate --seed --force
