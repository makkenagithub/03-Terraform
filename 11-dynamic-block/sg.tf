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

    # dynamic block. Here terraform will give us a variable with the name of dynamic block
    dynamic "ingress" {
        
        for_each = var.ingress_rules

        # content to be repeated.
        content {
            from_port = ingress.value.from_port
            to_port = ingress.value["to_port"]
            
        }
         protocol = "tcp"
         cidr_blocks      = ["0.0.0.0/0"]
         ipv6_cidr_blocks = ["::/0"]
    }

    # if we give tag name, then it shows the name of resource in AWS console.
    tags = {
        Name = "allow ssh name"
    }


}