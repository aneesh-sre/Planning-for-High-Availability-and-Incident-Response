module "project_alb" {
  source            = "./modules/alb"
  instance_ids      = module.project_ec2.instance_ids  
  alb_security_group = module.project_ec2.ec2_sg  
  subnet_ids        = module.vpc.public_subnet_ids  
  vpc_id           = module.vpc.vpc_id
}
