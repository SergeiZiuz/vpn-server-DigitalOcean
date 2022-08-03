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