resource "aws_iam_role_policy_attachment" "eks_mng_role_att_worker" {
  role       = aws_iam_role.eks-mng-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"

}
resource "aws_iam_role_policy_attachment" "eks_mng_role_att_registry" {
  role       = aws_iam_role.eks-mng-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly"

}
resource "aws_iam_role_policy_attachment" "eks_mng_role_att_cni" {
  role       = aws_iam_role.eks-mng-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

}

resource "aws_iam_role_policy_attachment" "eks_mng_role_att_ebs_csi" {
  role       = aws_iam_role.eks-mng-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}