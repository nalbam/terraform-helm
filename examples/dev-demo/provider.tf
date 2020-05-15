# provider

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

# provider "kubernetes" {
#   host                   = "${data.aws_eks_cluster.example.endpoint}"
#   cluster_ca_certificate = "${base64decode(data.aws_eks_cluster.example.certificate_authority.0.data)}"
#   token                  = "${data.aws_eks_cluster_auth.example.token}"
#   load_config_file       = false
# }

provider "helm" {
  version = "~> 0.10"
}
