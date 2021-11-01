#!/bin/bash
if [ -d /etc/terraform ]
then 
echo "terraform already exists"
if [ -f /etc/terraform/terraform ]
then 
echo "file exists"
else
cd /etc/terraform && wget https://releases.hashicorp.com/terraform/1.0.9/terraform_1.0.9_linux_amd64.zip
unzip terraform_1.0.9_linux_amd64.zip && chmod 777 terraform
fi
else
mkdir /etc/terraform
cd /etc/terraform && wget wget https://releases.hashicorp.com/terraform/1.0.9/terraform_1.0.9_linux_amd64.zip
unzip terraform_1.0.9_linux_amd64.zip && chmod 700 terraform
./terraform version
fi