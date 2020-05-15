# variable

variable "args" {
  default = [
    "--kubelet-insecure-tls",
    "--kubelet-preferred-address-types=InternalDNS,InternalIP,ExternalDNS,ExternalIP,Hostname",
  ]
}

resource "helm_release" "this" {
  chart = "stable/metrics-server"

  namespace = "kube-system"
  name      = "metrics-server"

  set {
    name  = "nameOverride"
    value = "metrics-server"
  }

  set_string {
    name  = "args"
    value = "{${join(",", var.args)}}"
  }
}
