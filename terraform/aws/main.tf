terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.11"
    }
  }
}

provider "aws" {
  region = var.region
}

module "network" {
  source       = "./modules/network"
  environment  = var.environment
  default_tags = var.default_tags
}

resource "local_file" "web-access" {
  content  = <<JSON
{
  "fqdn": "${module.network.elb_url}"
}
  JSON
  filename = "./web-access.json"
}
