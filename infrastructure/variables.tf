# Description cross infrastructure
variable "do_token" {}            # DigitalOcean Personal Access Token
variable "pvt_key" {}             # Privete key location
variable "ssh_key_service" {
  type = string
  description = "name of ssh key at DigitalOcean"
}
variable "ssh_key_person" {
  type = string
  description = "name of ssh key at DigitalOcean"
}
variable "instance_region" {
  type = string
  description = "Region of solutions"
}
variable "instanse_image" {
  type = string
  description = "image of vm"
}
variable "instanse_size" {
  type = string
  description = "Default size of instance"
}
variable "instance_tag" {
  type = string
  description = "tag"
}
variable "username" {
  type = string
  description = "Non root username"
}
variable "password" {
  type = string
  description = "provide hashed password"
}

# Describe vpn Instanse
variable "name_vpn_server" {
  type = string
  description = "name of vm"
}

# Descrybe ca server
variable "name_ca_server" {
  type = string
  description = "Name of ca-server"
}