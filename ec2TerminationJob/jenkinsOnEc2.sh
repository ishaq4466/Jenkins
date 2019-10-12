#!/bin/bash

echo "********* Installing Jenkins on ec2 *************************"
sudo yum install -y java-1.8.0-openjdk-devel
sudo yum install -y wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum install -y jenkins
echo "\n********* Jenkins installed successfully on ec2 *************************"
sleep 2

service jenkins stop
echo "********* Configuring jenkins with admin user *************************"

wget https://github.com/ishaq4466/Jenkins/raw/cc891995da33f7abbb98598c7bba2d68460a8f25/jenkins.zip

unzip jenkins.zip
rm jenkins.zip

sudo rm -rf /var/lib/jenkins
sudo cp -r jenkins /var/lib/jenkins

sudo chown -R jenkins:jenkins /var/lib/jenkins/

sudo service jenkins start

sleep 2
echo "*******************************************************"
echo -e "\n>>>user name: admin \n>>>password: admin123\n"
echo "*******************************************************"
