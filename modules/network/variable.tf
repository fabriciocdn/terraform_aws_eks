variable "cidr_block" {
  type        = string
  description = "Networking block for subnet in vpc"
}
variable "tags" {
  type        = map(string)
  description = "Tags to be added to aws resources"
}