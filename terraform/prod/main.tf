module "s3" {
  source = "../modules/s3"
  env = var.env
 
}

module "dynamodb" {
  source = "../modules/dynamodb"
  env = var.env
  hash_key = var.hash_key
}


module "ec2" {
    source = "../modules/ec2"
    env = var.env
    instance_count = var.instance_count
    instance_type = var.instance_type
    ami = var.ami
    volume_size = var.volume_size
    hash_key = var.hash_key
}

output "prod_infra_ec2_public_ips" {
  value = module.ec2.ec2_public_ips
}