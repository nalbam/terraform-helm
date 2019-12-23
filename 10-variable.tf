# variable

variable "cluster_name" {
  description = "The ECS Cluster Name."
}

variable "argo_version" {
  default = "0.6.4"
}

variable "argo_namespace" {
  default = "argo"
}

variable "argo_name" {
  default = "argo"
}

variable "argo_ingress_host" {
  default = ""
}

variable "argo_bucket" {
  default = ""
}
