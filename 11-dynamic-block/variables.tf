variable "ingress_rules" {

    default = [
    {
        from_port = 22
        to_port = 22
     
    },
    {
        from_port = 80
        to_port = 80
  
    },
    {
        from_port = 8080
        to_port = 8080
  
    }
    ]
}