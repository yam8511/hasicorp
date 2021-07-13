output "container" {
  description = "Name of the Docker container"
  value       = docker_container.web.name
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.httpd.id
}
