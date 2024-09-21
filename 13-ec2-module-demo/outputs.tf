output "public" {
    value = module.ec2.public_ip
}

output "private" {
    value = module.ec2.private_ip
}

output "id" {
    value = module.ec2.instance_id
}