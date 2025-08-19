#### Notes ####
In Terraform, .tfvars files are used to define variable values, but their naming is flexible—there’s no strict requirement. 
- terraform.tfvars (automatically loaded by Terraform).
- *.auto.tfvars (e.g., prod.auto.tfvars – also auto-loaded).
- Custom names like variables.tfvars, dev.tfvars, secrets.tfvars (requires explicit -var-file flag).
    ````
    terraform apply -var-file="prod.tfvars"
    ````