# eks

# terraform {
#   backend "s3" {
#     region         = "ap-northeast-2"
#     bucket         = "terraform-mz-seoul"
#     key            = "eks-demo-charts.tfstate"
#     dynamodb_table = "terraform-mz-seoul"
#     encrypt        = true
#   }
#   required_version = ">= 0.12"
# }

provider "aws" {
  region = var.region
}

provider "helm" {
  version = "~> 0.10"
}

module "charts" {
  source = "../../"

  metrics_server = var.metrics_server
  kube2iam       = var.kube2iam

  region = var.region
}
