# Use an official PHP-FPM image as base
FROM php:8.0-fpm

# Set PHP configuration options
RUN echo "memory_limit=256M" > /usr/local/etc/php/conf.d/memory-limit.ini

# Install system dependencies
RUN apt-get update \
    && apt-get install -y \
        libfreetype6-dev \
        libjpeg-dev \
        libpng-dev \
        libzip-dev \
        libxml2-dev \
        wget \
        unzip \
        libsqlite3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install PDO extension
RUN docker-php-ext-install pdo

# Install PDO MySQL extension
RUN docker-php-ext-install pdo_mysql

# Install PDO SQLite extension
RUN docker-php-ext-install pdo_sqlite

# Install Zip extension
RUN docker-php-ext-install zip

# Install GD extension
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# Install XML-RPC extension from specific channel and version
RUN pecl install channel://pecl.php.net/xmlrpc-1.0.0RC3 \
    && docker-php-ext-enable xmlrpc

# Download and install Nextcloud
RUN wget https://download.nextcloud.com/server/releases/latest.zip -O /tmp/nextcloud.zip \
    && unzip /tmp/nextcloud.zip -d /var/www \
    && chown -R www-data:www-data /var/www/nextcloud \
    && rm /tmp/nextcloud.zip

# Expose port
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]

