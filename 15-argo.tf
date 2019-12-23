resource "helm_release" "argo" {
  chart     = "argo/argo"
  version   = var.argo_version
  namespace = var.argo_namespace
  name      = var.argo_name

  values = [<<EOF
nameOverride: argo

controller:
  podAnnotations:
    iam.amazonaws.com/role: ${var.argo_iam_role}

ui:
  ingress:
    enabled: true
    annotations:
      kubernetes.io/ingress.class: nginx
      nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
      cert-manager.io/cluster-issuer: "letsencrypt-prod"
    hosts:
      - '${var.argo_ingress_host}'
    tls:
      - secretName: argo-ui-tls
        hosts:
          - '${var.argo_ingress_host}'

useDefaultArtifactRepo: true
useStaticCredentials: false

artifactRepository:
  s3:
    bucket: '${var.argo_bucket}'
    endpoint: s3.amazonaws.com

EOF
  ]

  provisioner "local-exec" {
    command = "helm test ${var.name}"
  }
}
