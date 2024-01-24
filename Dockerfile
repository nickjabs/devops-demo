# Stage 1: Composer
FROM serversideup/php:8.2-fpm-nginx as composer

# Set the working directory for the composer stage
WORKDIR /var/www/html

# Copy the composer.json and composer.lock files
COPY composer.json .
COPY composer.lock .

# Install dependencies using composer
RUN composer install \
    --ignore-platform-reqs \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist

# Stage 2: App
FROM serversideup/php:8.2-fpm-nginx as app

# Define build arguments for Pimcore installation
ARG PIMCORE_INSTALL_ADMIN_USERNAME=admin
ARG PIMCORE_INSTALL_ADMIN_PASSWORD=admin
ARG PIMCORE_INSTALL_MYSQL_HOST_SOCKET=db
ARG PIMCORE_INSTALL_MYSQL_USERNAME=pimcore
ARG PIMCORE_INSTALL_MYSQL_PASSWORD=pimcore
ARG PIMCORE_INSTALL_MYSQL_DATABASE=pimcore
ARG PIMCORE_INSTALL_MYSQL_PORT=3306

# Install necessary packages for the app stage
RUN apt-get update && apt-get install -y \
    locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Configure locale settings
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

# Set environment variables for locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Set the working directory for the app stage
WORKDIR /var/www/html

# Copy vendor directory from the composer stage
COPY --from=composer /var/www/html/vendor ./vendor

# Copy the rest of the application files
COPY . .

# Expose port 80 for web traffic
EXPOSE 80
