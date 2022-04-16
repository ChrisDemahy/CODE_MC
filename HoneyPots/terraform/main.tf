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

# resource "linode_sshkey" "my_honeypot_linode_ssh_key" {
#     label = "my_ssh_key"
#     ssh_key = chomp(file("~/.ssh/id_rsa.pub"))
# }

resource "random_string" "my_honeypot_linode_root_password" {
    length  = 32
    special = true
}

resource "linode_instance" "my_honeypot_linode-1" {
    image = var.image
    label = var.label
    region = var.region
    type = var.type
    tags = var.tags
    # authorized_keys = [ linode_sshkey.my_honeypot_linode_ssh_key.ssh_key ]
    root_pass = random_string.my_honeypot_linode_root_password.result
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

resource "linode_instance" "my_honeypot_linode-2" {
    image = var.image
    label = var.label2
    region = var.region
    type = var.type
    tags = var.tags
    # authorized_keys = [ linode_sshkey.my_honeypot_linode_ssh_key.ssh_key ]
    authorized_keys = [ ]
    root_pass = random_string.my_honeypot_linode_root_password.result
    stackscript_id = var.stackscript_id
    stackscript_data = {
       "dockerfile" = var.stackscript_data2["dockerfile"]
       "runcmd" = var.stackscript_data2["runcmd"]
       "username" = var.stackscript_data2["username"]
       "password" = var.stackscript_data2["password"]
       "pubkey" = var.stackscript_data2["pubkey"]
       "disable_root" = var.stackscript_data2["disable_root"]
       "token_password" = var.stackscript_data2["token_password"]
       "subdomain" = var.stackscript_data2["subdomain"]
       "domain" = var.stackscript_data2["domain"]
       "soa_email_address" = var.stackscript_data2["soa_email_address"]
    }
}

resource "linode_instance" "my_honeypot_linode-3" {
    image = var.image
    label = var.label3
    region = var.region
    type = var.type
    tags = var.tags
    # authorized_keys = [ linode_sshkey.my_honeypot_linode_ssh_key.ssh_key ]
    root_pass = random_string.my_honeypot_linode_root_password.result
    stackscript_id = var.stackscript_id
    stackscript_data = {
       "dockerfile" = var.stackscript_data3["dockerfile"]
       "runcmd" = var.stackscript_data3["runcmd"]
       "username" = var.stackscript_data3["username"]
       "password" = var.stackscript_data3["password"]
       "pubkey" = var.stackscript_data3["pubkey"]
       "disable_root" = var.stackscript_data3["disable_root"]
       "token_password" = var.stackscript_data3["token_password"]
       "subdomain" = var.stackscript_data3["subdomain"]
       "domain" = var.stackscript_data3["domain"]
       "soa_email_address" = var.stackscript_data3["soa_email_address"]
    }
}
