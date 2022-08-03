resource "digitalocean_vpc" "vpn_vpc" {
  name = "vpn_vpc"
  region = "nyc3"
  description = "VPC for VPN service"
}