#!/bin/bash

# Add user
useradd web
mkdir /home/web
mkdir /home/web/public

# Install vsftpd
apt-get install vsftpd -q -y

# Stop service
service vsftpd stop

# Config vsftpd
mv /etc/vsftpd.conf /etc/vsftpd.backup.conf
ln vsftpd/vsftpd.conf /etc/vsftpd.conf
ln vsftpd/vsftpd.user_list /etc/vsftpd.user_list