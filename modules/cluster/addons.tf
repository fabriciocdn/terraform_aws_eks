resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.eks-cluster.name
  addon_name   = "vpc-cni"

  addon_version = "v1.19.0-eksbuild.1"

  configuration_values = jsonencode({
    env = {
      ENABLE_PREFIX_DELEGATION = "true"
      WARM_PREFIX_TARGET       = "1"
    }
  })

  depends_on = [aws_eks_cluster.eks-cluster]
}

resource "aws_eks_addon" "ebs_csi" {
  cluster_name = aws_eks_cluster.eks-cluster.name
  addon_name   = "aws-ebs-csi-driver"

  addon_version = "v1.39.0-eksbuild.1"

  depends_on = [aws_eks_cluster.eks-cluster]
}

resource "kubernetes_storage_class_v1" "gp3" {
  metadata {
    name = "gp3"
    annotations = {
      "storageclass.kubernetes.io/is-default-class" = "true"
    }
  }

  storage_provisioner    = "ebs.csi.aws.com"
  allow_volume_expansion = true
  volume_binding_mode    = "WaitForFirstConsumer"

  parameters = {
    type = "gp3"
  }

  depends_on = [aws_eks_addon.ebs_csi]
}