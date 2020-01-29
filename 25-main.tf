# helm release

resource "helm_release" "this" {
  count = length(local.charts)

  chart     = local.charts[count.index].chart
  version   = local.charts[count.index].version
  namespace = local.charts[count.index].namespace
  name      = local.charts[count.index].name

  dynamic "set" {
    for_each = local.charts[count.index].values
    content {
      name  = set.key
      value = set.value
    }
  }

  provisioner "local-exec" {
    command = "helm test ${local.charts[count.index].name}"
  }
}
