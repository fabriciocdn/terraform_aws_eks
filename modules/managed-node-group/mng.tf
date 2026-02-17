resource "aws_eks_node_group" "eks-mng-node-group" {
  cluster_name    = var.cluster_name
  node_group_name = "eks-node-group"
  node_role_arn   = aws_iam_role.eks-mng-role.arn

  subnet_ids = [
    var.eks_subnet_private_1a,
    var.eks_subnet_private_1b
  ]

  instance_types = var.instance_type
  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_mng_role_att_worker,
    aws_iam_role_policy_attachment.eks_mng_role_att_registry,
    aws_iam_role_policy_attachment.eks_mng_role_att_cni
  ]

  tags = merge(
    var.tags,
    {
      Name = "eks-mng-role"
    }

  )
}