#!/bin/bash

# Install ngnix and extras
apt-get install nginx -q -y
apt-get install nginx-extras passenger -q -y

# Stop service
service nginx stop

# Config nginx
rm /etc/nginx/sites-enabled/default
ln nginx/web /etc/nginx/sites-enabled/web
ln nginx/gitlab /etc/nginx/sites-enabled/gitlab