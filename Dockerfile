FROM php:5.6-fpm

# install composer
RUN curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/local/bin/composer

# install git
RUN apt-get update \
	&& apt-get install -y git

# zip
RUN apt-get install -y zlib1g-dev \
    && docker-php-ext-install zip

# mcrypt
RUN apt-get install -y libmcrypt-dev \
    && docker-php-ext-install mcrypt

# redis
RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/2.2.7.tar.gz \
	&& tar xfz /tmp/redis.tar.gz \
	&& rm -r /tmp/redis.tar.gz \
	&& mv phpredis-2.2.7 /usr/src/php/ext/redis \
	&& docker-php-ext-install redis

# gd
RUN apt-get update \
    && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
    && docker-php-ext-install gd

# mbstring pdo_mysql
RUN docker-php-ext-install mbstring pdo_mysql

RUN rm -rf /var/lib/apt/lists/*