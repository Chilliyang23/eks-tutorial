
variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "demo-app"
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  default     = "dev"
}

variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1" # Or your preferred AWS region
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.29" # Ensure this is a supported EKS version
}

variable "instance_type" {
  description = "Instance type for EKS worker nodes."
  type        = string
  default     = "t3.medium"
}

variable "desired_size" {
  description = "Desired number of worker nodes."
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of worker nodes."
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Minimum number of worker nodes."
  type        = number
  default     = 2
}

# NEW ADDITIONS FOR ARGOCD & CUSTOM DOMAIN
variable "domain_name" {
  description = "Your custom base domain name (e.g., example.com) managed in Route 53."
  type        = string
  default     = "zach223.click" # IMPORTANT: CHANGE THIS TO YOUR ACTUAL BASE DOMAIN
}

variable "subdomain_name" {
  description = "The subdomain for your ArgoCD UI (e.g., argocd)."
  type        = string
  default     = "argocd"
}

variable "acme_email" {
  description = "Email address for Let's Encrypt ACME challenges (for Cert-Manager)."
  type        = string
  default     = "danielzhi2019@163.com" # IMPORTANT: CHANGE THIS TO YOUR ACTUAL EMAIL
}

# NEW ADDITION: Your GitOps repository URL
variable "gitops_repo_url" {
  description = "URL of your Git repository where Kubernetes manifests (for ArgoCD Applications) are stored."
  type        = string
  default     = "https://github.com/your-org/gitops-repo.git" # IMPORTANT: CHANGE THIS TO YOUR ACTUAL GITOPS REPO
}