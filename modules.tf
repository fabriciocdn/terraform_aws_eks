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