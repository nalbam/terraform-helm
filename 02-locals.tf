# locals

locals {
  charts = [
    {
      chart     = "stable/metrics-server"
      version   = "2.9.0"
      namespace = "kube-system"
      name      = "metrics-server"
      values = {
        "nameOverride" = "metrics-server"
        # "args" = [
        #   "--kubelet-insecure-tls",
        #   "--kubelet-preferred-address-types=InternalDNS,InternalIP,ExternalDNS,ExternalIP,Hostname",
        # ]
        "apiService.create" = "true"
      },
    },
  ]
}
