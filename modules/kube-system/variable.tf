# variable

variable "kube2iam" {
  default = true
}

variable "metrics_server" {
  default = true
}

variable "region" {
  description = "The region to deploy the cluster in, e.g: us-east-1"
}
