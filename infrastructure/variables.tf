variable "do_token" {}  # DigitalOcean Personal Access Token
variable "pvt_key" {}   # Privete key location

variable "ssh_name" {
  type = string
  description = "name of ssh key"
}

variable "vpc_name" {
  type = string
  description = "Name of VPC"
}

# Describe Instanse
variable "vpn_us_name" {
  type = string
  description = "name of vm"
}
variable "vpn_us_image" {
  type = string
  description = "image of vm"
}
variable "vpn_us_size" {
  type = string
  description = "size of vm"
}
variable "vpn_us_region" {
  type = string
  description = "region of vm"
}
variable "vpn_us_tag" {
  type = string
  description = "tag"
}

variable "username" {
  type = string
  description = "Non root username"
}
variable "password" {
  typpe = string
  description = "provide hashed password"
}