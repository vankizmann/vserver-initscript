#!/bin/bash

# Install php5 and php5-fpm
apt-get install php5 php5-fpm php-pear php5-common php5-mcrypt php5-mysql php5-curl php5-cli php5-gd -q -y

# Stop service
service php5-fpm stop

# Config php5-fpm
mv /etc/php5/fpm/pool.d/www.conf /etc/php5/fpm/pool.d/www.backup.conf
ln php5-fpm/www.conf /etc/php5/fpm/pool.d/www.conf