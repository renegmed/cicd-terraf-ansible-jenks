module "main-vpc" {
  source      = "./modules/vpc"
  env         = var.env
  region      = var.region 
}
 
module "jenkins" {
  source            = "./modules/jenkins"
  region            = var.region
  env               = var.env
  key_name          = var.key_name
  vpc_id            = module.main-vpc.vpc_id                # value came from output value of modules/vpc 
  public_subnet_id  = module.main-vpc.public_subnets[2]     # value came from output value of modules/vpc 
  security_group    = module.main-vpc.security_group 
  availability_zone = module.main-vpc.availability_zones[0]
  jenkins_role_name = module.main-vpc.role_name
}


module "ansible" {
  source            = "./modules/ansible"
  env               = var.env
  region            = var.region
  ami               = var.ami 
  instance_type     = var.instance_type
  vpc_id            = module.main-vpc.vpc_id         # value came from output value of modules/vpc 
  public_subnet_id  = module.main-vpc.public_subnets[1] # value came from output value of modules/vpc 
  security_group    = module.main-vpc.security_group
  ansible_instance_count = "1"
  ansible_user      = "ansadmin"
  ansible_password  = "password123"  
}


module "docker" {
  source            = "./modules/docker"
  env               = var.env
  region            = var.region
  ami               = var.ami 
  instance_type     = var.instance_type
  vpc_id            = module.main-vpc.vpc_id         # value came from output value of modules/vpc 
  public_subnet_id  = module.main-vpc.public_subnets[2] # value came from output value of modules/vpc 
  security_group    = module.main-vpc.security_group
  docker_instance_count = "1"
  docker_user      = "dockeradmin"
  docker_password  = "password123"  
}