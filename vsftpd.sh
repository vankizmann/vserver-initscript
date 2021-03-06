#!/bin/bash

# Add user
useradd web
mkdir /home/web
mkdir /home/web/public
chown -R web /home/web

# Install vsftpd
apt-get install -t wheezy-updates debian-cyconet-archive-keyring vsftpd -q -y --force-yes

# Stop service
service vsftpd stop

# Config vsftpd
mv /etc/vsftpd.conf /etc/vsftpd.backup.conf
ln vsftpd/vsftpd.conf /etc/vsftpd.conf
ln vsftpd/vsftpd.user_list /etc/vsftpd.user_list