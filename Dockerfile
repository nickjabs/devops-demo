FROM serversideup/php:8.2-fpm-nginx

RUN apt-get update && apt-get install -y \
    locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

WORKDIR /var/www/html

COPY . .
RUN composer install 
RUN chown -R webuser:webgroup .

# RUN unlink /etc/nginx/sites-enabled/ssl-off
COPY .docker/nginx.conf /etc/nginx/sites-available/pimcore.conf
RUN ln -s /etc/nginx/sites-available/pimcore.conf /etc/nginx/sites-enabled

EXPOSE 80
