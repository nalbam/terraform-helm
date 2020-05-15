
resource "helm_release" "metrics_server" {
  count = var.metrics_server ? 1 : 0

  repository = "https://kubernetes-charts.storage.googleapis.com"
  chart      = "stable/metrics-server"
  version    = "2.11.1"

  namespace = "kube-system"
  name      = "metrics-server"

  values = [
    file("${path.module}/values/metrics-server.yaml")
  ]
}
