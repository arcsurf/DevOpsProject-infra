#!/bin/bash
sleep 1m 40s 
cd /var/lib/jenkins/.ssh/
rm known_hosts
ssh -o "StrictHostKeyChecking no" ubuntu@app.couso.com.ar
exit
