resource "aws_security_group" "allow_ssh" {
    descrption = "allow port 22 for ssh access"
    name = "allow ssh"

    # egress is to control outgoing traffic. Usually we allow everything in egress
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    # ingress blcok is to control incoming traffic 
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }

    # if we give tag name, then it shows the name of resource in AWS console.
    tags = {
        Name = "allow ssh name"
    }


}

resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]

    tags = {
        Name = "terraform server"
    }

    # provisioner to execute locally. Here self is aws_instance.terraform
    provisioner "local-exec" {
        command = "echo  ${self.private_ip} > private_ip.txt"
    }

    # cnnection block is to connect to remote server
    connection {
        type     = "ssh"
        user     = "ec2-user"
        password = "DevOps321"
        host     = self.public_ip
    }

    # remote execution. Multiple commands can be executed here.
    # provisioners wll execute only at the time of resource exection.
    provisioner "remote-exec" {
        inline = [
        "sudo dnf install ansible -y",
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx",
        ]
    }

    # below inline commands execute at the time of destroy
    provisioner "remote-exec" {
        when = destroy
        inline = [
        "sudo systemctl stop nginx",
        ]
    }
}
