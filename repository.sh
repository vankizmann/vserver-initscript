#!/bin/bash

# Add APT passenger repo
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7

# Add APT dotdeb repo
apt-key adv --keyserver keys.gnupg.net --recv-key 89DF5277

# Append to sources.list
echo "deb http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
echo "deb-src http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list

# Save passenger.list
echo "deb https://oss-binaries.phusionpassenger.com/apt/passenger wheezy main" > /etc/apt/sources.list.d/passenger.list

# Update APT list
apt-get update