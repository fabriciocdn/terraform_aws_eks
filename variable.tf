variable "cidr_block" {
  type        = string
  description = "Networking block for subnet in vpc"
}

variable "region" {
  type        = string
  description = "AWS region where you will create your resources"

}

variable "tags" {
  type        = map(any)
  description = "Tags for your resources project"

}

variable "instance_types" {
  type        = list(string)
  description = "Tipo de instância para os nós"
}