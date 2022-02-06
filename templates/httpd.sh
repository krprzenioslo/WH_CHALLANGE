#!/bin/bash

sudo yum update -y
sudo yum install -y httpd.x86_64
sed -i 's/Listen 80/Listen ${port}/g' /etc/httpd/conf/httpd.conf
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
