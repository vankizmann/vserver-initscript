#!/bin/bash

# Used domain
domain="vanki.de"

apt-get update -q -y
apt-get upgrade -q -y

# Install sudo
apt-get sudo -q -y

# Add APT passenger repo
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7

# Add APT dotdeb repo
wget http://www.dotdeb.org/dotdeb.gpg
sudo apt-key add dotdeb.gpg
rm dotdeb.gpg

# Add HTTPS Support
apt-get install apt-transport-https ca-certificates -q -y

# Append to sources.list
echo "deb http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
echo "deb-src http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list

# Save passenger.list
echo "deb https://oss-binaries.phusionpassenger.com/apt/passenger wheezy main" > /etc/apt/sources.list.d/passenger.list

# Update APT list
apt-get update

# Predefine postfix config
echo "postfix postfix/main_mailer_type select Internet Site" | debconf-set-selections
echo "postfix postfix/mailname string ${domain}" | debconf-set-selections

# Install postfix and openssh-server
apt-get install postfix openssh-server -q -y

# Install php-fpm
apt-get install php5 php5-fpm php-pear php5-common php5-mcrypt php5-mysql php5-cli php5-gd -q -y

# Install ngnix and extras
apt-get install nginx -q -y
apt-get install nginx-extras passenger -q -y

# Download Gitlab Omni Installer
wget https://downloads-packages.s3.amazonaws.com/debian-7.8/gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb

# Install Gitlab
sudo dpkg -i gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb
rm -rf gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb

# Config Gitlab
mv /etc/gitlab/gitlab.rb /etc/gitlab/gitlab.backup.rb
echo "external_url 'http://gitlab.${domain}'" >> /etc/gitlab/gitlab.rb
echo "nginx['enable'] = false" >> /etc/gitlab/gitlab.rb
echo "ci_nginx['enable'] = false" >> /etc/gitlab/gitlab.rb
echo "web_server['external_users'] = ['www-data']" >> /etc/gitlab/gitlab.rb

# Config nginx
rm /etc/nginx/sites-enabled/default
ln nginx/vanki.conf /etc/nginx/sites-enabled/vanki.conf
ln nginx/gitlab.conf /etc/nginx/sites-enabled/gitlab.conf

service nginx restart
service nginx reload

sudo gitlab-ctl reconfigure