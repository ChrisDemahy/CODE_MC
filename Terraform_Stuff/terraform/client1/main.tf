# Client 1 Infrastructure
terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.16.0"
    }
  }
}
provider "linode" {
  token = "YOUR_LINODE_API_TOKEN"
}

module "app-deployment" {
  source = "../modules/app-deployment"

# Variables Specific to this Deployment
region = "us-east"
authorized_keys = [ "YOUR_PUBLIC_SSH_KEY" ]
root_pass ="YOUR_ROOT_PASSWORD"

# Variables Specific to Servers
webserver_label = "client1-web"
dbserver_label = "client1-db"
db_type = "g6-standard-8"
}