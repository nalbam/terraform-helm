# variable

# data "terraform_remote_state" "eks" {
#   backend = "s3"
#   config = {
#     region = "ap-northeast-2"
#     bucket = "terraform-mz-seoul"
#     key    = "vpc-demo.tfstate"
#   }
# }

variable "region" {
  default = "ap-northeast-2"
}

variable "metrics_server" {
  default = true
}

variable "kube2iam" {
  default = true
}
