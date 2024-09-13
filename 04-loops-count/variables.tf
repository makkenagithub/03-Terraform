variable "instance_type" {
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}