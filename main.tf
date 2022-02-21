resource "google_compute_forwarding_rule" "default" {
  project               = var.project
  name                  = var.name
  target                = google_compute_target_pool.default.self_link
  load_balancing_scheme = var.load_balancing_scheme
  port_range            = var.port_range
  ip_address            = var.ip_address
  ip_protocol           = var.protocol
  labels                = var.custom_labels
  tags                  = var.tags
}

resource "google_compute_target_pool" "default" {
  project          = var.project
  name             = var.name
  region           = var.region
  session_affinity = var.session_affinity
  instances         = var.instances
  health_checks     = [google_compute_http_health_check.default.name]
  tags              = var.tags
}

resource "google_compute_http_health_check" "default" {

  project             = var.project
  name                = var.name
  request_path        = var.health_check_path
  port                = var.health_check_port
  check_interval_sec  = var.health_check_interval
  healthy_threshold   = var.health_check_healthy_threshold
  unhealthy_threshold = var.health_check_unhealthy_threshold
  timeout_sec         = var.health_check_timeout
  tags                = var.tags 
}

resource "google_compute_firewall" "health_check" {

  project  = var.project
  name     = var.name
  network  = var.network

  allow {
    protocol = "tcp"
    ports    = [var.health_check_port]
  }
  tags = var.tags 
  # IP ranges are required for health checks
  source_ranges = var.source_ranges

  # Target tags define the instances to which the rule applies
  target_tags = var.firewall_target_tags
}
