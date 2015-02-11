#!/bin/bash

# Add APT passenger repo
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7

# Add APT dotdeb repo
apt-key adv --keyserver keys.gnupg.net --recv-key 89DF5277

# Remove source list and link new
rm /etc/apt/sources.list
ln system/sources.list /etc/apt/sources.list

# Update APT list
apt-get update