resource "aws_route_table" "eks_private_route_table_1a" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks-ngw-1a.id
  }

  tags = merge(
    var.tags,
    {
      Name = "eks-private-route-table_1a"
    }

  )
}

resource "aws_route_table" "eks_private_route_table_1b" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks-ngw-1a.id
  }

  tags = merge(
    var.tags,
    {
      Name = "eks-private-route-table_1b"
    }

  )
}

resource "aws_route_table_association" "association_eks_subnet_private_1a" {
  subnet_id      = aws_subnet.eks_subnet_private_1a.id
  route_table_id = aws_route_table.eks_private_route_table_1a.id
}

resource "aws_route_table_association" "association_eks_subnet_private_1b" {
  subnet_id      = aws_subnet.eks_subnet_private_1b.id
  route_table_id = aws_route_table.eks_private_route_table_1b.id
}