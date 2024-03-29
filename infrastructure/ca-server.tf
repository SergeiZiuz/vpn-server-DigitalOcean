# Create a private Certificate Authority (CA Server)
resource "digitalocean_droplet" "ca-server" {
  image = var.instanse_image
  name = var.name_ca_server
  region = var.instance_region
  size = var.instanse_size
  ssh_keys = [ 
    data.digitalocean_ssh_key.ssh_key_service.id,
    data.digitalocean_ssh_key.ssh_key_person.id
  ]
  vpc_uuid = digitalocean_vpc.vpn-vpc.id
  tags = [ var.instance_tag ]

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
    inline = [
      "chmod +x /tmp/setup-droplet.sh",
      "/tmp/setup-droplet.sh ${var.username} ${var.password}"
    ]
  }

  provisioner "local-exec" {
    command = "sed -i '' 's/ca-ip/${self.ipv4_address}/' ../hosts.txt"
  }
}