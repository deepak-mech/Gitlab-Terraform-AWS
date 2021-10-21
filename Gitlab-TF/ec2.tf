resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = aws_subnet.main.id
    availability_zone = var.azs
    vpc_security_group_ids = [aws_security_group.allow_php.id]
    key_name = "${var.namespace}-key"
    tags = {
        Name = var.instance_name
    }

    connection {
            type     = "ssh"
            user     = "ec2-user"
            private_key = file("${var.namespace}-key.pem")
            host     = aws_instance.ec2.public_ip
  }

    provisioner "remote-exec" {
        inline = [
            "sudo yum install httpd -y",
            "sudo yum install php -y",
            "sudo systemctl start httpd",
            "sudo systemctl enable httpd",
        ]
  }
}

output "wp_public_ip" {
    value = aws_instance.ec2.public_ip
}




