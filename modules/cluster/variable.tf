variable "tags" {
  type        = map(string)
  description = "Tags to be added to aws resources"
}

variable "public_subnet_1a" {
  type        = string
  description = "subnet to create EKS cluster AZ 1a"
}
variable "public_subnet_1b" {
  type        = string
  description = "subnet to create EKS cluster AZ 1b"
}