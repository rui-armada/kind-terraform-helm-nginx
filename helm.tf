module "helm-release" {

  source     = "github.com/rui-armada/terraform-modules/helm-release"
  namespace = "steeleye"
  helmchart = "./helm"
  values = "./values.yaml"
  name = "helm"

  //depends_on = [module.metallb]
  
}
/*
module "metallb" {

  source     = "github.com/rui-armada/terraform-modules/helm-release"
  namespace = "metallb"
  helmchart = "./metallb"
  values = "./valueslb.yaml"
  name = "metallb"

  //depends_on = [module.kind-cluster]
  
}*/