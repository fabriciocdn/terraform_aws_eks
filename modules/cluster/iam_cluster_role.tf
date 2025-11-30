resource "aws_iam_role" "eks-cluster-role" {
  name = "eks-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "eks.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
    }]
  })

  tags = merge(
    var.tags,
    {
      Name = "eks-role"
    }

  )
}
