locals {
    key = var.key
}

# resource "linode_sshkey" "main_key" {
#     label = var.key_label
#     ssh_key = chomp(file(local.key))
# }

resource "linode_instance" "linode_id" {
    image = var.image
    label = var.label
    region = var.region
    type = var.type
    # authorized_keys = [ linode_sshkey.main_key.ssh_key ]
    root_pass = var.root_pass
    stackscript_id = var.stackscript_id
    stackscript_data = {
       "hostname" = var.stackscript_data["hostname"]
       "username" = var.stackscript_data["username"]
       "password" = var.stackscript_data["password"]
    }
}