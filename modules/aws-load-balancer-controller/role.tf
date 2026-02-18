resource "aws_iam_role" "AmazonEKSLoadBalancerControllerRole" {
  name = "AmazonEKSLoadBalancerControllerRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Federated = var.oidc_arn
      }
      Action = "sts:AssumeRoleWithWebIdentity"
      Condition = {
        StringEquals = {
          "${var.oidc_url}:aud" : "sts.amazonaws.com",
          "${var.oidc_url}:sub" : "system:serviceaccount:kube-system:aws-load-balancer-controller"
        }
      }
    }]
  })

  tags = merge(
    var.tags,
    {
      Name = "eks-controller-role"
    }
  )
}