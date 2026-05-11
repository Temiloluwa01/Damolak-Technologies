output "ec2_instance_id" {
  value       = module.ec2.instance_ids[0]
  description = "EC2 instance ID for deployment"
}