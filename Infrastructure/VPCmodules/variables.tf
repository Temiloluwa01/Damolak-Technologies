variable "config" {
  type = object({
    vpc = list(object({
      name                 = string
      cidr_block           = string
      enable_dns_support   = bool
      enable_dns_hostnames = bool

      tags = map(string)
    }))
  })
}