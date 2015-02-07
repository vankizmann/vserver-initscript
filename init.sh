#!/bin/bash

# Read password
echo "Type your password:"
read mysqlpass

# Upgrade system
apt-get update -q -y
apt-get upgrade -q -y

# Add APT passenger repo
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7

# Add APT dotdeb repo
wget http://www.dotdeb.org/dotdeb.gpg
sudo apt-key add dotdeb.gpg
rm dotdeb.gpg

# Append to sources.list
echo "deb http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
echo "deb-src http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list

# Save passenger.list
echo "deb https://oss-binaries.phusionpassenger.com/apt/passenger wheezy main" > /etc/apt/sources.list.d/passenger.list

# Update APT list
apt-get update

# Install opensssh
apt-get install openssh-server -q -y

# Install postfix and openssh-server
echo "postfix postfix/main_mailer_type select Internet Site" | debconf-set-selections
echo "postfix postfix/mailname string vanki.de" | debconf-set-selections
apt-get install postfix -q -y

# Install ngnix and extras
apt-get install nginx -q -y
apt-get install nginx-extras passenger php5 php5-fpm php-pear php5-common php5-mcrypt php5-mysql php5-cli php5-gd -q -y

# Install mysql
echo "mysql-server mysql-server/root_password password ${mysqlpass}" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password ${mysqlpass}" | debconf-set-selections
apt-get install mysql-server -q -y

# Download Gitlab Omni Installer
wget https://downloads-packages.s3.amazonaws.com/debian-7.8/gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb

# Install Gitlab
sudo dpkg -i gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb
rm -rf gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb

# Config Gitlab
mv /etc/gitlab/gitlab.rb /etc/gitlab/gitlab.backup.rb
cp gitlab/gitlab.rb /etc/gitlab/gitlab.rb

# Config postfix
echo "virtual_alias_domains = vanki.de" >> /etc/postfix/main.cf
echo "virtual_alias_maps = hash:/etc/postfix/virtual" >> /etc/postfix/main.cf
echo "@vanki.de kizmann@live.com" >> /etc/postfix/virtual

# Reload nginx
postmap /etc/postfix/virtual
service postfix reload

# Config nginx
rm /etc/nginx/sites-enabled/default
ln nginx/vanki.conf /etc/nginx/sites-enabled/vanki.conf
ln nginx/gitlab.conf /etc/nginx/sites-enabled/gitlab.conf

# Reload nginx
service nginx reload

# Set user rights
sudo usermod -aG gitlab-www www-data
chmod g+x /var/opt/gitlab/gitlab-rails/sockets/gitlab.socket

# Configure Gitlab
sudo gitlab-ctl reconfigure