resource "aws_instance" "my-instance" {
	ami = "ami-08c40ec9ead489470"
	instance_type = "t2.micro"
	key_name = "ansible"
  associate_public_ip_address = true
	user_data = << EOF
		#! /bin/bash
    sudo apt-get update
		sudo apt-get install -y nginx
		sudo systemctl start nginx
		sudo systemctl enable nginx
		echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
	EOF
	tags = {
		Name = "Trial"	
		Batch = "web"
	}
}
