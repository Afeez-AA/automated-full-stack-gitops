output "frontend_domain" {
  value       = var.frontend_domain
  description = "The domain for the frontend"
}

output "db_domain" {
  value       = var.db_domain
  description = "The domain for the database"
}

output "traefik_domain" {
  value       = var.traefik_domain
  description = "The domain for the Traefik service"
}

output "grafana_domain" {
  value       = var.grafana_domain
  description = "The domain for the Grafana service"
}

output "prometheus_domain" {
  value       = var.prometheus_domain
  description = "The domain for the Prometheus service"
}
