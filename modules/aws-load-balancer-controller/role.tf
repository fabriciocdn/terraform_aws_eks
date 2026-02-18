resource "aws_iam_role" "AmazonEKSLoadBalancerControllerRole" {
  name = "AmazonEKSLoadBalancerControllerRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::${data.aws_caller_identity.current_account.account_id}:oidc-provider/oidc.eks.${data.aws_region.current_region.region}.amazonaws.com/id/${var.oidc}"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "oidc.eks.${data.aws_region.current_region.region}.amazonaws.com/id/${var.oidc}:aud" : "sts.amazonaws.com",
            "oidc.eks.${data.aws_region.current_region.region}.amazonaws.com/id/${var.oidc}:sub" : "system:serviceaccount:kube-system:aws-load-balancer-controller"
          }
        }
      }
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = "eks-controller-role"
    }
  )
}