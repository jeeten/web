#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
# sudo yum install python37 -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html

yum install git -y
yum install -y docker
yum install python -y
mkdir -p /home/ec2-user/Projects
python -m venv /home/ec2-user/Projects/.myenv
git clone https://github.com/jeeten/web.git /home/ec2-user/Projects