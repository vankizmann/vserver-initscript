#!/bin/bash

echo "SCRIPT - TYPE IN YOUR PASSWORD:"
read mysql_password
echo "SCRIPT - TYPE IN YOUR AGAIN PASSWORD:"
read mysql_password_again

if [ "${mysql_password}" -ne "${mysql_password_again}" ]
then
    echo "SCRIPT - PASSWORD DO NOT MATCH!"
    exit
fi

echo "SCRIPT - OK!"

# Upgrade system
apt-get update -q -y; apt-get upgrade -q -y > /dev/null

# Add APT passenger repo
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7

# Add APT dotdeb repo
wget http://www.dotdeb.org/dotdeb.gpg; sudo apt-key add dotdeb.gpg > /dev/null
rm dotdeb.gpg

# Append to sources.list
echo "deb http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
echo "deb-src http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list

# Save passenger.list
echo "deb https://oss-binaries.phusionpassenger.com/apt/passenger wheezy main" > /etc/apt/sources.list.d/passenger.list

# Update APT list
apt-get update > /dev/null

# Install opensssh
apt-get install openssh-server -q -y  > /dev/null

# Install postfix and openssh-server
echo "postfix postfix/main_mailer_type select Internet Site" | debconf-set-selections
echo "postfix postfix/mailname string vanki.de" | debconf-set-selections
apt-get install postfix -q -y

# Install ngnix and extras
apt-get install nginx -q -y > /dev/null
apt-get install nginx-extras passenger php5 php5-fpm php-pear php5-common php5-mcrypt php5-mysql php5-cli php5-gd -q -y  > /dev/null

# Install mysql
echo "mysql-server mysql-server/root_password password ${mysqlpass}" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password ${mysqlpass}" | debconf-set-selections
apt-get install mysql-server -q -y > /dev/null

# Download Gitlab Omni Installer
wget https://downloads-packages.s3.amazonaws.com/debian-7.8/gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb > /dev/null

# Install Gitlab
sudo dpkg -i gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb > /dev/null
rm -rf gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb

# Config Gitlab
mv /etc/gitlab/gitlab.rb /etc/gitlab/gitlab.backup.rb
ln gitlab/gitlab.rb /etc/gitlab/gitlab.rb

# Config nginx
rm /etc/nginx/sites-enabled/default
ln nginx/vanki.conf /etc/nginx/sites-enabled/vanki.conf
ln nginx/gitlab.conf /etc/nginx/sites-enabled/gitlab.conf

# Reload nginx
service nginx reload > /dev/null

# Configure Gitlab
sudo gitlab-ctl reconfigure > gitlab.log