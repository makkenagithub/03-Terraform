data "aws_ami" "suresh" {
    most_recet = true
    owners = ["973714476881"]

    filter {
        name = "name"
        values = ["RHEL-9-DevOps*"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }
    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}