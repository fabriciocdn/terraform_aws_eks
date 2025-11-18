resource "aws_eip" "eks-eip-1a" {
  domain = "vpc"
  tags = merge(
    var.tags,
    {
      Name = "eks-eip-1a"
    }

  )
}

resource "aws_eip" "eks-eip-1b" {
  domain = "vpc"
  tags = merge(
    var.tags,
    {
      Name = "eks-eip-1b"
    }

  )
}