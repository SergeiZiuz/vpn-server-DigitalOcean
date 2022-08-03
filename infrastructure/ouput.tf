output "vpn_server_ip" {
  value = digitalocean_droplet.vpn-server.ipv4_address
}
output "ca_server_ip" {
  value = digitalocean_droplet.ca-server.ipv4_address
}