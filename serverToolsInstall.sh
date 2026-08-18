#!/bin/bash
# echo "test" >> /home/test.txt
sudo apt-get update -y

#Docker install
sudo apt-get install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

#Add user to group docker
usermod -aG docker ubuntu
usermod -aG docker jenkins

#Telegraf install
wget -qO- https://repos.influxdata.com/influxdb.key | sudo tee /etc/apt/trusted.gpg.d/influxdb.asc >/dev/null
source /etc/os-release
echo "deb https://repos.influxdata.com/${ID} ${VERSION_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
apt-get update && apt-get install -y telegraf

#net-tools install
apt-get install -y net-tools

#telegraf configuration and run
rm /etc/telegraf/telegraf.conf
wget https://raw.githubusercontent.com/arcsurf/telegraf/main/telegraf.conf
cp telegraf.conf /etc/telegraf/telegraf.conf
rm telegraf.conf
telegraf &

#keys for remote access from ci/cd server devops.couso.com.ar
echo "ssh-rsa KEY= jenkins@ip-172-31-23-4" >> /home/ubuntu/.ssh/authorized_keys
