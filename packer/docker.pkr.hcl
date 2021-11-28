variable "docker_image"{
  type = string
  default = "ubuntu:xenial"
}

# Configure Packer to use the Docker builder
packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}

# Configure the builder
# commit: commit the container as a brand new image
source "docker" "ubuntu" {
  image  = var.docker_image
  commit = true
}

# Define what to do with the Docker container
# after it launches
build {
  name = "learn-packer"
  sources = [
    "source.docker.ubuntu"
  ]

  # Provisioners allows you to completely automate
  # modifications to your image
  provisioner "shell" {    
    inline = [
      "echo $PATH > path.txt",
      "echo ${var.docker_image} > docker_image.txt"
    ]
  }

  post-processors {
    post-processor "docker-tag" {
        repository =  "infra-as-code/packer"
        tags = ["0.1"]
        force = true
      }
  }
}
