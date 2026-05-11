variable "config" {
  type = object({
    subnet = list(object({
      name              = string
      cidr_block        = string
      availability_zone = string
      public            = bool

      tags = map(string)
    }))
  })
}

variable "vpc_id" {
  type = string
}

variable "route_table_id" {
  type = string
}