# helm

resource "helm_release" "this" {
  chart   = var.chart_name
  version = var.chart_version

  namespace = var.namespace
  name      = var.name

  values = [
    file("./values/${var.namespace}/${var.name}.yaml")
  ]

  dynamic "set" {
    for_each = var.values
    content {
      name  = set.key
      value = set.value
    }
  }
}
