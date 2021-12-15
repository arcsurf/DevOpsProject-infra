#!/bin/bash

cd /var/lib/jenkins/.ssh/
rm known_hosts
ssh -o "StrictHostKeyChecking no" ubuntu@app.couso.com.ar
exit
