module "kind-cluster" {

  source     = "github.com/rui-armada/terraform-modules/kind-cluster"
  kind_cluster_name = "steeleye-cluster"

}