#!/bin/bash

# Initscript
echo "UPGRADE SYSTEM..."
apt-get update -q -y > /dev/null
apt-get upgrade -q -y > /dev/null

echo "ADD REPOSITORY..."
sh repository.sh > /dev/null

echo "INSTALL VSFTPD..."
sh vsftpd.sh > /dev/null
service vsftpd reload
service vsftpd restart

echo "INSTALL POSTFIX..."
sh postfix.sh > /dev/null
service postfix reload
service postfix restart

echo "INSTALL NGINX..."
sh nginx.sh > /dev/null
service nginx reload
service nginx restart

echo "INSTALL PHP5-FPM..."
sh php5-fpm.sh > /dev/null
service php5-fpm reload
service php5-fpm restart

echo "INSTALL MYSQL..."
sh mysql.sh > /dev/null
service mysql reload
service mysql restart

echo "INSTALL GITLAB..."
sh gitlab.sh > /dev/null

echo "INSTALL OCTOBER..."
sh october.sh > /dev/null

echo "INSTALL TEAMSPEAK..."
sh teamspeak.sh > /dev/null

echo "LINK .PROFILE..."
rm /root/.profile
ln system/.profile /root/.profile
source /root/.profile

echo "DONE!"