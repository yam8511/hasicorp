output "container_web01" {
  description = "Name of the Docker container web01"
  value       = module.web01.container
}

output "image_id_web01" {
  description = "ID of the Docker image used by web01"
  value       = module.web01.image_id
}

output "container_web02" {
  description = "Name of the Docker container web02"
  value       = module.web02.container
}

output "image_id_web02" {
  description = "ID of the Docker image used by web02"
  value       = module.web02.image_id
}
