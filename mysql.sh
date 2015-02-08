#!/bin/bash

# Install mysql
echo "mysql-server mysql-server/root_password password password" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password password" | debconf-set-selections
apt-get install mysql-server -q -y

# Stop service
service mysql stop

# Config mysql
mv /etc/mysql/my.cnf /etc/mysql/my.backup.cnf
ln mysql/my.cnf /etc/mysql/my.cnf