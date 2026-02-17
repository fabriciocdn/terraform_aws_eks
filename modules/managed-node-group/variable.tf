variable "tags" {
  type        = map(string)
  description = "Tags to be added to aws resources"
}
variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}
variable "eks_subnet_private_1a" {
  type        = string
  description = "EKS cluster subnet private 1a"
}
variable "eks_subnet_private_1b" {
  type        = string
  description = "EKS cluster subnet private 1b"
}
variable "instance_types" {
  type        = list(string)
  description = "Managed node group instance type"
}