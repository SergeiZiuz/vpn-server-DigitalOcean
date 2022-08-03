# Get id of project VPN
data "digitalocean_project" "VPN" {
  name = "VPN"
}

resource "digitalocean_project_resources" "VPN" {
  project = data.digitalocean_project.VPN.id
  resources = [
      digitalocean_droplet.vpn-server.urn,
      digitalocean_droplet.ca-server.urn
  ]
}