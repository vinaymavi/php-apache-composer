FROM composer

FROM php:5.6.9-apache
# Copy composer binary 
COPY --from=0 /usr/bin/composer /usr/bin/composer

# Install requried packages 
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA8E81B4331F7F50
RUN apt-get update -y &&  apt-get install -y zip unzip vim libpng-dev libxml2-dev php5-apcu php5-mysql git zip python-dev
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install awscli
RUN docker-php-ext-install mbstring gd xml
RUN cp /usr/lib/php5/20131226/apcu.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226/
RUN cp /usr/lib/php5/20131226/pdo.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226/
RUN cp /usr/lib/php5/20131226/mysql.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226/
RUN cp /usr/lib/php5/20131226/pdo_mysql.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226/
RUN cp /usr/lib/php5/20131226/mysqli.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226/

# Copy php.ini file
WORKDIR /usr/local/etc/php
COPY php.ini .