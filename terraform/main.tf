terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.16.0"
    }
  }
}
provider "linode" {
    token = var.token
}

# resource "linode_sshkey" "minecraft_server_ssh_key" {
#     label = "my_ssh_key"
#     ssh_key = chomp(file("~/.ssh/id_rsa.pub"))
# }

resource "random_string" "minecraft_server_root_password" {
    length  = 32
    special = true
}


resource "linode_instance" "my_honeypot_linode-1" {
    image = var.image
    label = var.label
    region = var.region
    type = var.type
    tags = var.tags
    # authorized_keys = [ linode_sshkey.minecraft_server_ssh_key.ssh_key ]
    root_pass = random_string.minecraft_server_root_password.result
    stackscript_id = var.stackscript_id
    stackscript_data = {
       "dockerfile" = var.stackscript_data["dockerfile"]
       "runcmd" = var.stackscript_data["runcmd"]
       "username" = var.stackscript_data["username"]
       "password" = var.stackscript_data["password"]
       "pubkey" = var.stackscript_data["pubkey"]
       "disable_root" = var.stackscript_data["disable_root"]
       "token_password" = var.stackscript_data["token_password"]
       "subdomain" = var.stackscript_data["subdomain"]
       "domain" = var.stackscript_data["domain"]
       "soa_email_address" = var.stackscript_data["soa_email_address"]
    }
}

