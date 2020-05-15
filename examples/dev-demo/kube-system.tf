# variable

module "cluster-autoscaler" {
  source = "../../"

  chart_name = "stable/cluster-autoscaler"
  # chart_version = "7.3.0"

  namespace = "kube-system"
  name      = "cluster-autoscaler"

  values = {
    "aws.region"                            = "ap-northeast-2"
    "autoDiscovery.clusterName"             = ""
    "podAnnotations.iam.amazonaws.com/role" = ""
  }
}

module "efs-provisioner" {
  source = "../../"

  chart_name = "stable/efs-provisioner"
  # chart_version = "7.3.0"

  namespace = "kube-system"
  name      = "efs-provisioner"

  values = {
    "efsProvisioner.efsFileSystemId"        = ""
    "podAnnotations.iam.amazonaws.com/role" = ""
  }
}

module "k8s-spot-termination-handler" {
  source = "../../"

  chart_name = "stable/k8s-spot-termination-handler"
  # chart_version = "7.3.0"

  namespace = "kube-system"
  name      = "k8s-spot-termination-handler"

  values = {
    "cluster.name"                          = ""
    "slack.url"                             = ""
    "podAnnotations.iam.amazonaws.com/role" = ""
  }
}

# module "kube-state-metrics" {
#   source = "../../"

#   chart_name = "stable/kube-state-metrics"
#   # chart_version = "7.3.0"

#   namespace = "kube-system"
#   name      = "kube-state-metrics"

#   values = {
#   }
# }

module "kube2iam" {
  source = "../../"

  chart_name = "stable/kube2iam"
  # chart_version = "7.3.0"

  namespace = "kube-system"
  name      = "kube2iam"

  values = {
    "aws.region" = "ap-northeast-2"
  }
}

module "metrics-server" {
  source = "../../"

  chart_name = "stable/metrics-server"
  # chart_version = "7.3.0"

  namespace = "kube-system"
  name      = "metrics-server"

  values = {
  }
}
