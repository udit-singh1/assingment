#! /bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1>HELLO FROM AAKASH</h1>" | sudo tee /var/www/html/index.html
