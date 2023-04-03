provider "kubectl" {
  load_config_file       = true
  config_path = var.kubernetes_cluster_config_path

}

terraform {
  required_version = ">= 0.13"
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.10.0"
    }
  }
}

data "http" "manifestfile" {
  url = "https://raw.githubusercontent.com/metallb/metallb/v0.13.7/config/manifests/metallb-native.yaml"
}


module "kubectl-manifest-metallb-native" {

  source     = "github.com/rui-armada/terraform-modules/kubectl-manifest"
  file       = data.http.manifestfile.body

  depends_on = [module.kind-cluster]

}

module "kubectl-manifest-metallb" {

  source     = "github.com/rui-armada/terraform-modules/kubectl-manifest"
  file       = <<EOT
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: example
  namespace: metallb-system
spec:
  addresses:
  - 172.20.255.200-172.20.255.250
---
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: empty
  namespace: metallb-system
EOT

  depends_on = [module.kubectl-manifest-metallb-native]

}