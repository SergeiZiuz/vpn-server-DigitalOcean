# Use DigitalOcean provider
terraform {
  required_version = "~> 1.2.5"
  required_providers {
    digitalocean = {
        source = "digitalocean/digitalocean"
        version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

# Get ssh public key
data "digitalocean_ssh_key" "ssh_key_service" {
  name = var.ssh_key_service
}
data "digitalocean_ssh_key" "ssh_key_person" {
  name = var.ssh_key_person
}
