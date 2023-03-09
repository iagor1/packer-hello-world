packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu" {
  image  = "ubuntu:xenial"
  commit = true
}

build {
  name    = "packer-teste"
  sources = ["source.docker.ubuntu"]

  provisioner "shell" {
    script = "setup.sh"
  }
  post-processor "docker-tag" {
  repository = "my-packer-image"
  tags       = ["ubuntu-xenial"]
  only       = ["docker.ubuntu"]
  }
}