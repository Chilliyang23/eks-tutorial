resource "aws_iam_role" "EKSClusterRole" {
  name = "EKSClusterRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role" "NodeGroupRole" {
  name = "EKSNodeGroupRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

locals {
    eks_cluster_policies = [
        "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    ]
    
    eks_node_policies = [
        "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
        "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
        "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    ]
}

resource "aws_iam_role_policy_attachment" "cluster-policy" {
  for_each   = toset(local.eks_cluster_policies)
  role       = aws_iam_role.iam-role.name
  policy_arn = each.value
}

resource "aws_iam_role_policy_attachment" "node-policy" {
  for_each = toset(local.eks_node_policies)
  role = aws_iam_role.NodeGroupRole.name
  policy_arn = each.value
}