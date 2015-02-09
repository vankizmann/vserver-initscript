#!/bin/bash

# Initscript
echo "UPGRADE SYSTEM..."
apt-get update -q -y > /dev/null
apt-get upgrade -q -y > /dev/null

echo "ADD REPOSITORY..."
sh repository.sh > /dev/null

echo "INSTALL VSFTPD..."
sh vsftpd.sh > /dev/null

echo "INSTALL POSTFIX..."
sh postfix.sh > /dev/null

echo "INSTALL NGINX..."
sh nginx.sh > /dev/null

echo "INSTALL PHP5-FPM..."
sh php5-fpm.sh > /dev/null

echo "INSTALL MYSQL..."
sh mysql.sh > /dev/null

echo "INSTALL GITLAB..."
sh gitlab.sh > /dev/null

echo "INSTALL OCTOBER..."
sh october.sh > /dev/null

echo "DONE!"