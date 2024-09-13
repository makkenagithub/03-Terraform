variable "instance_names" {
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}

variable "common_tags" {
    Project = "expense"
    Terraform = true
    Environment  "dev"
    
}