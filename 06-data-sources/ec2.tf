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

    # if we give tag name, then it shows the name of resource in AWS console.
    tags = {
        Name = "allow ssh name"
    }


}

resource "aws_instance" "terraform" {

    # get the ami ID from data source
    ami = data.aws_ami.suresh.id

    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]

    tags = {
        Name = "terraform server"
    }

}

