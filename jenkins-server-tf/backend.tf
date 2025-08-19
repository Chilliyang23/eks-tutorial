# terraform {
#   backend "s3" {
#     bucket         = "my-ews-baket1"
#     region         = "us-east-1"
#     key            = "End-to-End-Kubernetes-DevSecOps-Tetris-Project/Jenkins-Server-TF/terraform.tfstate"
#     dynamodb_table = "Lock-Files"
#     encrypt        = true
#   }
# }