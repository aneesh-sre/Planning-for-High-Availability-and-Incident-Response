module "project_alb" {
  source            = "./modules/alb"
  ec2               = module.project_ec2.instance 
  ec2_sg            = module.project_ec2.ec2_sg  
  subnet_ids        = module.vpc.public_subnet_ids  
  vpc_id           = module.vpc.vpc_id
}
