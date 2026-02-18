variable "tags" {
  type        = map(string)
  description = "Tags to be added to aws resources"
}

variable "oidc" {
  type = string
}

variable "cluster_name" {
  type = string
}
variable "vpc_id" {
  type = string
}

variable "oidc_arn" {
  type        = string
  description = "ARN do provedor OIDC do cluster"
}

variable "oidc_url" {
  type        = string
  description = "URL do provedor OIDC (sem https://)"
}
