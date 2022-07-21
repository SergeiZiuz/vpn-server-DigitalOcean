# Get VPC ID
data "digitalocean_vpc" "nyc3-vpc" {
  name = "nyc3-vpc"
}

# Get ssh public key
data "digitalocean_ssh_key" "ssh_key_name" {
  name = var.ssh_name
}

# Create a Droplet (VPN-server)
resource "digitalocean_droplet" "vpn-server-us" {
  image = var.vpn_us_image
  name = var.vpn_us_name
  region = var.vpn_us_region
  size = var.vpn_us_size
  ssh_keys = [
    data.digitalocean_ssh_key.ssh_key_name.id
  ]
  vpc_uuid = data.digitalocean_vpc.nyc3-vpc.id
  tags = [ var.vpn_us_teg ]
  
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    agent = true
    private_key = file(var.pvt_key)
    timeout = "2m"
  }

  # Copy setup script to server
  provisioner "file" {
    source = "setup-droplet.sh"
    destination = "/tmp/setup-droplet.sh"
  }

  provisioner "remote-exec" {
    # script = "setup-droplet.sh"
    inline = [
      "chmod +x /tmp/setup-droplet.sh",
      "/tmp/setup-droplet.sh ${var.username}",
    ]
  }
}

# Get id of project VPN
data "digitalocean_project" "VPN" {
  name = "VPN"
}

resource "digitalocean_project_resources" "VPN" {
  project = data.digitalocean_project.VPN.id
  resources = [
      digitalocean_droplet.vpn-server-us.urn
  ]
}
