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
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDl+z7cRO2OLK6wMvx6d2brgr8lRz2GBS2u38mrnTeBQHGnK19mYzv/4qbg/j+lMpdw+kYZfyApODJGk5EicCPsBPWkmCt93ZioD768eIDY2g/y2a+/i+UgWF6X3ucYuLadFWKp1oSKcCS7fZf83A7raadlN0rZxmmV9jyK1klRFKKyzGlCsQuyA89a6HckKm097/ufuT49ZZhLtjkQkdFDANz4/IJ+zuyp7FT1kfFELWUKOxLjPAu0ifVjhO4FbU69TwZmgqjkUzrZg4qgvesKP4dLPRs7oABwBsGxwbOWxuQeh8v3LCTH8TqzZVeOJVQUrg1ab4+5suWBhr5WwHLpENJ2lQVPeeXNfb3+cVlXR4KrpgEuz/AqDWBVmbttoSPRYhfHJd7AUq3txm14kWkNxrN2C9PeHiYJspNgkQ5nIv50AG4XJIPssIXkP1IRjYrTZfkUZ69MqK/gAFFd7p41cv3ahdl2wfAlXsxQSelLfy6eRqiTCXufoYZgkFiaKdU= jenkins@ip-172-31-23-4" >> /home/ubuntu/.ssh/authorized_keys
