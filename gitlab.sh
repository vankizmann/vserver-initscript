#!/bin/bash

# Install opensssh
apt-get install openssh-server -q -y

# Download Gitlab Omni Installer
wget https://downloads-packages.s3.amazonaws.com/debian-7.8/gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb
mv gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb gitlab/gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb

# Install Gitlab
sudo dpkg -i gitlab/gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb

# Config Gitlab
mv /etc/gitlab/gitlab.rb /etc/gitlab/gitlab.backup.rb
ln gitlab/gitlab.rb /etc/gitlab/gitlab.rb

# Set user rights
sudo usermod -aG gitlab-www www-data