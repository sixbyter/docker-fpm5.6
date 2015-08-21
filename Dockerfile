FROM php:5.6-fpm

# install composer
RUN curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/local/bin/composer

# install git
RUN apt-get update \
	&& apt-get install -y git
# install laravel
# RUN composer global require "laravel/installer=~1.1"

# new laravel project
#RUN export PATH=$PATH:/root/.composer/vendor/bin \
#	&& cd /var/www/html \
#	&& laravel new laravel5.1

RUN apt-get install -y zlib1g-dev \
    && docker-php-ext-install zip

RUN apt-get install -y libmcrypt-dev \
    && docker-php-ext-install mcrypt

RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/2.2.7.tar.gz \
	&& tar xfz /tmp/redis.tar.gz \
	&& rm -r /tmp/redis.tar.gz \
	&& mv phpredis-2.2.7 /usr/src/php/ext/redis \
	&& docker-php-ext-install redis


RUN docker-php-ext-install mbstring pdo_mysql

RUN rm -rf /var/lib/apt/lists/*