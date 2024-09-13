output "public_ip" {
    value = aws_instance.terraform.public_ip
    description = "public ip of instance created"
    sensitive = false # we can set to true to not display sentive information
}