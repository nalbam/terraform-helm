# module

module "prometheus-operator" {
  source = "../../"

  chart_name = "stable/prometheus-operator"
  namespace  = "monitor"
  name       = "prometheus-operator"

  values = {
    "prometheus.prometheusSpec.scrapeInterval"                                        = "30s"
    "prometheus.prometheusSpec.storageSpec.volumeClaimTemplate.spec.storageClassName" = "efs"
  }
}

module "prometheus-adapter" {
  source = "../../"

  chart_name = "stable/prometheus-adapter"
  namespace  = "monitor"
  name       = "prometheus-adapter"

  values = {
    "prometheus.url"  = "http://prometheus-operator-prometheus.monitor.svc"
    "prometheus.port" = "9090"
  }
}

module "grafana" {
  source = "../../"

  chart_name = "stable/grafana"
  namespace  = "monitor"
  name       = "grafana"

  values = {
    "ingress.enabled"   = true
    "ingress.hosts"     = "{grafana.closed.mzdev.be}"
    "ingress.tls.hosts" = "{grafana.closed.mzdev.be}"
  }
}
