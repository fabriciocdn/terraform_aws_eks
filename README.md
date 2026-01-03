# terraform_aws_eks
Cluster EKS with terraform - IaC

# In this project, i created a EKS cluster using terraform, developing reusable modules.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.20.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws-load-balancer-controller"></a> [aws-load-balancer-controller](#module\_aws-load-balancer-controller) | ./modules/aws-load-balancer-controller | n/a |
| <a name="module_eks-network"></a> [eks-network](#module\_eks-network) | ./modules/network | n/a |
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | ./modules/cluster | n/a |
| <a name="module_eks_managed_node_group"></a> [eks\_managed\_node\_group](#module\_eks\_managed\_node\_group) | ./modules/managed-node-group | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | Networking block for subnet in vpc | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region where you will create your resources | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for your resources project | `map` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->