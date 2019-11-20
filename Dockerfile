FROM composer

FROM php:5.6.9-apache
# Copy composer binary 
COPY --from=0 /usr/bin/composer /usr/bin/composer