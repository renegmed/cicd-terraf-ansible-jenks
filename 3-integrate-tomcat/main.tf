module "main-vpc" {
  source      = "./modules/vpc"
  env         = "dev"
  region      = var.region 
}
 
# module "jenkins" {
#   source            = "./modules/jenkins"
#   region            = var.region
#   env               = "dev"
#   key_name          = var.key_name
#   vpc_id            = module.main-vpc.vpc_id                # value came from output value of modules/vpc 
#   public_subnet_id  = module.main-vpc.public_subnets[2]     # value came from output value of modules/vpc 
#   security_group    = module.main-vpc.security_group 
#   availability_zone = module.main-vpc.availability_zones[0]
#   jenkins_role_name = module.main-vpc.role_name
# }


module "tomcat" {
  source            = "./modules/tomcat"
  region            = var.region
  env               = "dev"
  key_name          = var.key_name
  vpc_id            = module.main-vpc.vpc_id                # value came from output value of modules/vpc 
  public_subnet_id  = module.main-vpc.public_subnets[2]     # value came from output value of modules/vpc 
  security_group    = module.main-vpc.security_group 
  availability_zone = module.main-vpc.availability_zones[1]
  tomcat_role_name  = module.main-vpc.role_name  
}