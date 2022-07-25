variable "deployment_bucket_name" {
    type = string
    description = "The deployment bucket name"
    default = "psi_dev"
}

variable "deployment_path_key" {
    type = string
    description = "The deployment path key"
    default = "deployments/lambdas"
}

variable "deployment_package_name" {
    type = string
    description = "The deployment package name"
    default = "deployment"
}