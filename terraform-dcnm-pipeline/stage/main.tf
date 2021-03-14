terraform {
  required_providers {
    dcnm = {
      source  = "CiscoDevNet/dcnm"
      version = "0.0.5"
    }
  }
  backend "s3" {
    bucket         = "terraform-state-shdu-demo"
    key            = "stage/terraform.tfstate"
    region         = "us-west-2" # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-locks"
  }
}

provider "dcnm" {
  username = var.dcnm_username
  password = var.dcnm_password
  url      = var.dcnm_url
}

module "networks" {
  depends_on = [module.vrfs]
  source     = "../modules/networks"
  fabric     = var.fabric
  interfaces = var.interfaces
  networks   = var.networks
  leaf       = var.leaf
}

module "vrfs" {
  source = "../modules/vrfs"
  fabric = var.fabric
  vrfs   = var.vrfs
  leaf   = var.leaf
}
