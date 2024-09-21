module "ec2" {
    source = "../03-terraform-aws-ec2" 
    #these (ami_id) are variables expected by module, not the arguments of resource definitions
    # we can also cretae our own variables and pass to modules or else pass direct values.
    ami_id = var.ami_something
    instance_type = "t3.small"
    sg_id = ["sg-010112", "sg-00001000"]

}