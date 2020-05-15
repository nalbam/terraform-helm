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

  values = [
    file("./values/metrics-server.yaml")
  ]

  set_string {
    name  = "args"
    value = "{${join(",", var.args)}}"
  }
}
