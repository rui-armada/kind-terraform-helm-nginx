provider "kubernetes" {
  config_path = pathexpand(var.kubernetes_cluster_config_path)
}

module "kind-cluster" {

  source     = "github.com/rui-armada/terraform-modules/kind-cluster"
  kind_cluster_name = "steeleye-cluster"

}