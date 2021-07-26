module "VPC" {
    source = "./modules/VPC"
    # vpc_id = module.VPC.vpc_id
}

module "EC2" {
    source = "./modules/EC2"
    m_public_id = module.VPC.m_public_id
    ssh_secgrp_id = module.VPC.ssh_secgrp_id

}

module "RDS" {
    source = "./modules/RDS"
    private_id = module.VPC.m_private_id
    db_grp_id = module.VPC.database_secgrp_id
}