resource "aws_security_group" "allow_ssh" {
    descrption = "allow port 22 for ssh access"
    name = var.sg_name

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
        from_port = var.from_port
        to_port = var.to_port
        protocol = var.protocol
        cidr_blocks      = var.ingress_cidr
        ipv6_cidr_blocks = ["::/0"]
    }

    # if we give tag name, then it shows the name of resource in AWS console.
    tags = var.tags


}

resource "aws_instance" "terraform" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]

    tags = var.tags

}

