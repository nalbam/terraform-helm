
resource "helm_release" "kube2iam" {
  count = var.kube2iam ? 1 : 0

  repository = "https://kubernetes-charts.storage.googleapis.com"
  chart      = "stable/kube2iam"
  version    = "2.4.0"

  namespace = "kube-system"
  name      = "kube2iam"

  values = [
    file("${path.module}/values/kube2iam.yaml")
  ]

  set {
    name  = "aws.region"
    value = var.region
  }
}
