#variable "config" {
#  type = object({
#    ec2 = list(object({
#      name               = string
#      ami                = string
#      instance_type      = string
#      subnet_id          = string
#      key_name           = string
#     security_group_ids = list(string)

#      tags = map(string)
#    }))
#  })
#}


variable "config" {
  type = object({
    ec2 = list(object({
      name          = string
      ami           = string
      instance_type = string
      key_name      = optional(string)

      tags = map(string)
    }))
  })
}

variable "subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}