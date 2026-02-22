variable "name" {
  description = "Security Group Name"
  type        = string
  default = "sg-name"
}

variable "description" {
  description = "Security Group Description"
  type        = string
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  description = "VPC where SG need to be created"
  type        = string
}

variable "ingress_rules" {
  description = "list of Ingress values"
  type = list(object({
    description = string #rules for ingress port
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = list(string)
  }))
  default = []
}
variable "egress_rules" {
  description = "list of Egress Values"
  type = list(object({
    description = string #rules for egress port
    from_port   = list(number)
    to_port     = list(number)
    protocol    = string
    cidr_block  = list(string)
  }))
  default = []
}
variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
