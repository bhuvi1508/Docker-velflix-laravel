# Use an official PHP image as base
FROM php:8.1-fpm

# Set the working directory
WORKDIR /var/www/html

# Install dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    unzip \
    libzip-dev \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs \
    && apt-get install npm -y

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install MySQL client
RUN apt-get update && apt install mariadb-server -y

# Copy the composer files separately to leverage Docker caching
COPY composer.json composer.lock /var/www/html/

# Install PHP dependencies
RUN composer install --no-scripts --no-autoloader

# Copy the application code
COPY . .

# Install Node.js dependencies and build assets

RUN npm install && npm run build

# Copy the application code
#COPY . /var/www/html

# Generate Laravel key
RUN php artisan key:generate

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Start MariaDB service and execute SQL commands
RUN service mariadb start \
    && mysql -u root -e "CREATE DATABASE IF NOT EXISTS velflix;" \
    && mysql -u root -e "CREATE USER 'velflix'@'%' IDENTIFIED BY '123@123';" \
    && mysql -u root -e "GRANT ALL PRIVILEGES ON velflix.* TO 'velflix'@'%';" \
    && mysql -u root -e "FLUSH PRIVILEGES"


#   && service mysql stop

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]
# Start PHP-FPM
CMD ["php-fpm"]
CMD ["php", "artisan", "serve", "--host", "0.0.0.0", "--port", "9000"]
