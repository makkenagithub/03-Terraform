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

