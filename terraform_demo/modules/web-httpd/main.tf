terraform {
  required_version = ">= 0.13"
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "httpd" {
  name         = "httpd:latest"
  keep_locally = false
}

resource "docker_container" "web" {
  image = docker_image.httpd.latest
  name  = var.container_name
  ports {
    internal = 80
    external = 8082
  }
}
