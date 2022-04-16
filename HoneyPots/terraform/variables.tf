variable "token" {
  description = "Linode API Personal Access Token"
}

variable "image" {
  description = "Image to use for Linode instance"
  default = "linode/ubuntu16.04lts"
}

variable "label" {
  description = "The Linode's label is for display purposes only."
  default = "default-linode-1"
}

variable "label2" {
  description = "The Linode's label is for display purposes only."
  default = "default-linode-2"
}

variable "label3" {
  description = "The Linode's label is for display purposes only."
  default = "default-linode-3"
}

variable "tags" {
    description = "The Linode's tags are for organizational purposes only."
    default = [ "terraform" ]
}

variable "region" {
  description = "The region where your Linode will be located."
  default = "us-east"
}

variable "type" {
  description = "Your Linode's plan type."
  default = "g6-nanode-1"
}

variable "stackscript_id" {
  description = "Stackscript ID"
  default = "607433"
}

variable "stackscript_data" {
  description = "Map of required StackScript UDF data."
  type = map(string)
}

variable "stackscript_data2" {
  description = "Map of required StackScript UDF data."
  type = map(string)
}

variable "stackscript_data3" {
  description = "Map of required StackScript UDF data."
  type = map(string)
}
