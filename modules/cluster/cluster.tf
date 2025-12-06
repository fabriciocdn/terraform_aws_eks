resource "aws_eks_cluster" "eks-cluster" {
  name = "eks-cluster"

  access_config {
    authentication_mode                         = "API"
    bootstrap_cluster_creator_admin_permissions = true
  }

  role_arn = aws_iam_role.eks-cluster-role.arn
  version  = "1.31"

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true
    subnet_ids = [
      var.public_subnet_1a,
      var.public_subnet_1b
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_role_att,
  ]

  tags = merge(
    var.tags,
    {
      Name = "eks-cluster"
    }

  )
}
