terraform {
  required_version = ">= 0.13"
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

module "web01" {
  source         = "./modules/web-nginx"
  container_name = var.container_name
}

module "web02" {
  source         = "./modules/web-httpd"
  container_name = var.container_name_2
}

# resource "docker_image" "nginx" {
#   name         = "nginx:latest"
#   keep_locally = false
# }

# resource "docker_container" "web01" {
#   image = docker_image.nginx.latest
#   name  = var.container_name
#   ports {
#     internal = 80
#     external = 8080
#   }
# }

# resource "docker_image" "httpd" {
#   name         = "httpd:latest"
#   keep_locally = false
# }

# resource "docker_container" "web02" {
#   image = docker_image.httpd.latest
#   name  = var.container_name_2
#   ports {
#     internal = 80
#     external = 8082
#   }
# }
