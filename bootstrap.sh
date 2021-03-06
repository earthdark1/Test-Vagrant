#!/bin/bash

# Enable ssh password authentication
echo "Enable ssh password authentication"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/.*PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
systemctl reload sshd

# Set Root password
echo "Set root password"
echo -e "admin\nadmin" | passwd root >/dev/null 2>&1

# Set local user account
echo "Set up local user account"
useradd -m -s /bin/bash venkatn
echo -e "admin\nadmin" | passwd venkatn >/dev/null 2>&1
echo "venkatn ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Update bashrc file
echo "export TERM=xterm" >> /etc/bashrc

#install nginx
sudo apt-get update
sudo apt-get -y install nginx
#sudo service nginx start the server
#GIDHUB
sudo apt-get -y install git
cd /var/www/html
sudo git clone https://github.com/earthdark1/Test-Vagrant
sudo cp Test-Vagrant/index.html /var/www/html/index.nginx-debian.html

sudo service nginx start the server
#sudo service nginx stop the server
#sudo service nginx restart the server


