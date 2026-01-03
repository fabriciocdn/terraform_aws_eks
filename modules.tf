module "eks-network" {
  source     = "./modules/network"
  cidr_block = var.cidr_block
  tags       = local.tags

}

module "eks_cluster" {
  source           = "./modules/cluster"
  tags             = local.tags
  public_subnet_1a = module.eks-network.eks_subnet_public_1a
  public_subnet_1b = module.eks-network.eks_subnet_public_1b
}

module "eks_managed_node_group" {
  source                = "./modules/managed-node-group"
  cluster_name          = module.eks_cluster.cluster_name
  eks_subnet_private_1a = module.eks-network.eks_subnet_private_1a
  eks_subnet_private_1b = module.eks-network.eks_subnet_private_1b
  tags                  = local.tags

}

module "aws-load-balancer-controller" {
  source       = "./modules/aws-load-balancer-controller"
  tags         = local.tags
  oidc         = split("/", module.eks_cluster.oidc)[4]
  cluster_name = module.eks_cluster.cluster_name
  vpc_id       = module.eks-network.vpc_id
  depends_on   = [module.eks_managed_node_group]

}