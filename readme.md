#### Notes ####
In Terraform, .tfvars files are used to define variable values, but their naming is flexible—there’s no strict requirement. 
- terraform.tfvars (automatically loaded by Terraform).
- *.auto.tfvars (e.g., prod.auto.tfvars – also auto-loaded).
- Custom names like variables.tfvars, dev.tfvars, secrets.tfvars (requires explicit -var-file flag).
    ````
    terraform apply -var-file="prod.tfvars"
    ````



### Check List ###
1. setup jenkins server for automatically build / test / deploy application
    - configure instance role for jenkins server instead of manually storing aws credentials in jenkins
    - install and configure sonarqube plugin on jenkins server
    - prepare the pipeline groovy
2. setup eks cluster for hosting application
... tbd