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
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDS8i/mQt3TyP2MkQxAh8yafjZtSeieZg7aVQQ5iU9rfWWLl/MMjws9qghb6Yg3FmW3MdIGUh8Vkyz59RhLjqrqjbg4o748SoNBBY4TZYHr8t5GbgerCyVaqss3do3FC5nwozlPojOm2l+vZXN2rkilxPBLf6iQUk2/C9ZTKrKi4pN80s0AT0ven34BAmp7O14KPw+5dAedFG4b/bIj/WXPzKaoWlxy3Ir1zvvCjJB8+qXsbc8L1XMDuLd3h7fW8dMpA4RGN8V7hi0z+RxEVe7sHcoyVOZ1PjIYmbNJvHdQ1yoEt2IiXwmkhw/tpb2CVeXsXPonxAJPgZRTb1+RfsjgtK68TvuSh1M4FMuIRDPl3zXGuXW+4kJuTOMChEVhInktlGyIF1240WABuBKof/xHWzJHbhmADFQia4vc6QUcaXTzxrcp8x7+jAMA5J4E//oqwEOR9KdM/mt71c7b2NJoHYS/8B/OvGx8VFhdCgYZXREg1jDbu4uTwZZ0xGj2qOc= jenkins@ip-172-31-23-4" >> /home/ubuntu/.ssh/authorized_keys
