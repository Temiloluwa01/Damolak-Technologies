module "ec2" {
  source    = "../EC2modules"
  config    = local.env.Elastic_compute_cloud
  subnet_id = module.subnet.subnet_ids[0]
  security_group_ids = [
    module.sg.sg_ids["dev-sg"]
  ]
}

module "vpc" {
  source = "../VPCmodules/"
  config = local.env.Virtual_private_cloud
}

module "subnet" {
  source         = "../Subnetmodules/"
  config         = local.env.Subnets
  vpc_id         = module.vpc.vpc_id
  route_table_id = module.vpc.route_table_id
}

module "sg" {
  source = "../Security_groupmodules/"
  config = local.env.Security_groups
  vpc_id = module.vpc.vpc_id
}