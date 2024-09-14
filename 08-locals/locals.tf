locals {
    instance_type = var.environment == "prod" ? "t3.micro" : "t2.micro"
}