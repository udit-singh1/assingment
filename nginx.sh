#!/bin/bash

set -x

nginx -v

if [ $? -eq 127 ]; then
    sudo yum update
    sudo yum install nginx -y
    sudo systemctl restart nginx
    else 
    echo "niginx already present in system"
fi
content=$1

touch index.html
echo "${content}" > index.html
sudo cat index.html > /usr/share/nginx/html/index.html

curl localhost
