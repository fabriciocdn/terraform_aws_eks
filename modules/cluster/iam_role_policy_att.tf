resource "aws_iam_role_policy_attachment" "eks_cluster_role_att" {
  role       = aws_iam_role.eks-cluster-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"


}
