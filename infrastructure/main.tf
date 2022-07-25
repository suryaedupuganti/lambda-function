module "lambda_deployer" {
    source = "./modules/lambda_deployment"

    deployment_bucket_name = var.deployment_bucket_name
    deployment_package_name = var.deployment_package_name
}