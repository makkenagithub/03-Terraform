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

Data Sources:

using data sources , we can query the existing information from providers

syntax is:

data "data source name" "example" {

}

Locals:

locals are like variables but it has some extra capabilities. We can store expressions and intermediate values in locals.
Loacls can be overwritten, but variables can't be overwritten.

count.index does not work in locals Its a limitation.

1. variables and locals both can store values. But locals have some extra capability to store expressions. Terraform can run them and get the values
2. locals can use variables inside. variables can not refer locals.
3. we ca not overwrite values in locals. But we can overwrite values in varaibles.

terraform state file:

terraform.tfstate file contains the actual/real infra its created based on the infra declared in the .tf config files.
When we do terraform plan or terraform apply , we can see terraform refreshing state in the command line. It means, it compares the actual/real infra on aws with the declared infra and displyas the differences it observed between the actual infra and declared infra.

terraform.tfstate is refreshed against the real infra

Terraforms goal is to make actual/real infra and declared infra same. 

remote state:

If person1 runs the terraform script, then it cerates infra.

If person2 runs the same script in another laptop, then it again creates infra.

So it creates duplicates for resources or may throw errors for some resources (eg: sevurity groups).

terraform.state file we usually place in remote location. So that if the terraform script runs by multiple people, then it checks the terraform.state file in remote location and does not allow duplicates to create.

we use S3 bucket in aws for maintaining remote state.

remote storage -> s3 bucket

locking -> dynamo DB. When creating dynamoDB, partition key must be LockID

terraform locking: 






