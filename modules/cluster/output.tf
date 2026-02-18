output "cluster_name" {
  value = aws_eks_cluster.eks-cluster.id
}

output "oidc" {
  value = aws_eks_cluster.eks-cluster.identity[0].oidc[0].issuer
}

output "endpoint" {
  value = aws_eks_cluster.eks-cluster.endpoint
}
output "certificate_authority" {
  value = aws_eks_cluster.eks-cluster.certificate_authority[0].data
}
output "oidc_arn" {
  value = aws_iam_openid_connect_provider.example.arn
}
output "oidc_url" {
  value = replace(aws_eks_cluster.eks-cluster.identity[0].oidc[0].issuer, "https://", "")
}