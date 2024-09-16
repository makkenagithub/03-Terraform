output "instances_info" {
    # we get output in the form of map when we use for_each.
    # And we get in the form of list when we use count based loop
    value = aws_instance.terraform

}