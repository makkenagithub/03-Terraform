Terraform -> IaaC

We can not get version control If we cretae infrastructure manually. If we want to track infrastructure history, definitely we need to go infra as a code, to get version control.

CRUD

Resource/Inventory management: IF we see the tf script, then we know what all services we are using. But manually in console we may not know clearly, we may miss few.

Cost optimisation: creating and deleting infra in few minutes using tf script.

Dependency management

Code reuse: we have modules in terraform to reuse

Terrafrom is declarative way of creating infra.

State management: terraform can track what it created, can update easily

HCL - Hashicopr configuration language

Terraform:

variables, data types, conditions, loops, functions

Data sources, locals, outputs, providers, provisioners.

Providers are: aws, azure, gcp, alibaba, etc


Terraform file extension is .tf

provider.tf -> where you cn declare what provider you are using

HCL syntax:

resource "resource-type" "name of resource" {
  key = value
  key = value

}

ingress: incoming traffic

egress: ougoing traffic

Terraform commands:

init command ->initialise terraform and it will connect with provider and downloads it
```
terraform init
```
When terraform init runs, careates .terraform directory and download/install all provider dependencies such as aws related files.

plan command: It shows what resources its going to create/update/delete.
```
terraform plan
```

apply command: It asks for approval and then It creates the resources
```
terraform apply
```
apply -auto-approve: It doesnot ask for approavl. It creates the resources.
```
terraform apply -auto-approve
```

Variables: string, number, list, boolean

```
variable "var_name" {
  default = "Suresh"
  type = string
description = "name of person"
}
```

terraform.tfvars: using this file we can overwrite the default values in variables or else we can set the values. We give variables as below in terraform.tfvars
```
instance_type = t2.micro
```
Preference is given the values in .tfvars file when compared to default values.

Variables can be passed in command line, terraform.tfvars, default, environment variables.

syntax for environment variable is 
```
export TF_VAR_instance_type=t3.large
```
Variable preference is 

1. command line
2. terraform.tfvars
3. environment variables
4. default

If we do not give variables any where, it will ask to enter value while running.

Conditions:

syntax is 
```
condition ? true_val : false_val
```
Eg:

A common use of conditional expressions is to define defaults to replace invalid values:
```
var.a != "" ? var.a : "default-a"
```
If var.a is an empty string then the result is "default-a", but otherwise it is the actual value of var.a.

Outputs:

Every resource exports some values, we can take them and create other resources based on that

loops:
1. count based loops
2. for or for each

Functions:

Terraform has no custom functions. We must use in-built functions

To goto terraform console/prompt
```
terramform console
```

