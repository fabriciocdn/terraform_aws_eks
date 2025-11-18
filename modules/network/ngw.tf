resource "aws_nat_gateway" "eks-ngw-1a" {
  allocation_id = aws_eip.eks-eip-1a.id
  subnet_id     = aws_subnet.eks_subnet_public_1a.id

  tags = {
    Name = "eks-ngw-1a"
  }
}

resource "aws_nat_gateway" "eks-ngw-1b" {
  allocation_id = aws_eip.eks-eip-1b.id
  subnet_id     = aws_subnet.eks_subnet_public_1b.id

  tags = {
    Name = "eks-ngw-1b"
  }
}