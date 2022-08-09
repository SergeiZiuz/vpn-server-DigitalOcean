resource "digitalocean_vpc" "vpn-vpc" {
  name   = "vpn-vpc"
  region = "nyc3"
  description = "VPC for VPN service"
}