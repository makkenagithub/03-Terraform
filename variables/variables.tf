variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "AMI id of devops-practice  RHEL9 VM"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "instance type"
}

variable "tags" {
    type = map
    default = {
        Name = "terraform server"
        Project= "expense"
        Component = "backend"
        Environment = "DEV"
        Terraform = "true"  # just to note the resource is created with terraform or not
    }
}

variable "sg_name" {
    type = string
    default = "allow_ssh"

}

variable "from_port" {
    type = number
    default = 22
}

variable "to_port" {
    type = number
    default = 22
}

variable "protocol" {
    type = string
    default = "tcp"
}

variable "ingress_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
}