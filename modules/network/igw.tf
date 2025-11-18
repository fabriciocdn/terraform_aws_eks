resource "aws_internet_gateway" "eks-igw" {
  vpc_id = aws_vpc.eks-vpc.id

  tags = merge(
    var.tags,
    {
      Name = "eks-igw"
    }

  )
}