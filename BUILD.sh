php8.3 `which composer` install --no-dev -o;
php8.3 artisan migrate --force
php8.3 artisan cache:clear;
php8.3 artisan config:cache;
npm install;
npm run production;
