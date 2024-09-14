# we can access outputs as output.instances_info or else aws_instance.terraform , botth are same here.
output "instances_info" {
    value = aws_instance.terraform
}
