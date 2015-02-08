#!/bin/bash

# Install postfix and openssh-server
echo "postfix postfix/main_mailer_type select Internet Site" | debconf-set-selections
echo "postfix postfix/mailname string localhost" | debconf-set-selections
apt-get install postfix -q -y

# Stop service
service postfix stop

# Config postfix
mv /etc/postfix/main.cf /etc/postfix/main.backup.cf
ln postfix/main.cf /etc/postfix/main.cf
ln postfix/virtual /etc/postfix/virtual

# Reload postfix
postmap /etc/postfix/virtual