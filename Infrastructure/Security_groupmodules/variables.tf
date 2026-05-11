variable "config" {
  type = object({
    security_group = list(object({
      name        = string
      description = string

      ingress_rules = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
      }))

      egress_rules = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
      }))

      tags = map(string)
    }))
  })
}

variable "vpc_id" {
  type = string
}