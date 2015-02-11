#!/bin/bash

# Initscript
echo "UPGRADE SYSTEM..."
apt-get update -q -y
apt-get upgrade -q -y

echo "ADD REPOSITORY..."
sh repository.sh

echo "INSTALL VSFTPD..."
sh vsftpd.sh
service vsftpd reload
service vsftpd restart

echo "INSTALL POSTFIX..."
sh postfix.sh
service postfix reload
service postfix restart

echo "INSTALL NGINX..."
sh nginx.sh > /dev/null
service nginx reload
service nginx restart

echo "INSTALL PHP5-FPM..."
sh php5-fpm.sh
service php5-fpm reload
service php5-fpm restart

echo "INSTALL MYSQL..."
sh mysql.sh
service mysql reload
service mysql restart

echo "INSTALL GITLAB..."
sh gitlab.sh

echo "INSTALL OCTOBER..."
sh october.sh

echo "INSTALL TEAMSPEAK..."
sh teamspeak.sh

echo "LINK .PROFILE..."
rm /root/.profile
ln system/.profile /root/.profile

echo "DONE!"