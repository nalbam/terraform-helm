# helm

module "kube-system" {
  source = "./modules/kube-system/"

  metrics_server = var.metrics_server
  kube2iam       = var.kube2iam

  region = var.region
}
