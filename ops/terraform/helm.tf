provider "helm" {
  kubernetes {
    config_path = pathexpand(var.kubernetes_cluster_config_path)
  }
}

module "helm-release" {

  source     = "github.com/rui-armada/terraform-modules/helm-release"
  namespace = "steeleye"
  helmchart = "../helm"
  values = "./values.yaml"
  name = "helm"

  depends_on = [module.kubectl-manifest-metallb]
  
}