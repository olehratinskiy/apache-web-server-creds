#!/bin/bash

sudo yum check-update
sudo yum update -y

sudo yum -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd

sudo yum install firewalld -y
sudo systemctl start firewalld
sudo systemctl status firewalld | grep Active

sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https

sudo firewall-cmd --reload

cd /var/www/html/
echo '<!DOCTYPE html>' > index.html
echo '<html>' >> index.html
echo '<body>' >> index.html
echo '<h1>Oleh Ratinskiy</h1>' >> index.html
echo '</body>' >> index.html
echo '</html>' >> index.html