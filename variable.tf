# REQUIRED 

variable "project" {
  description = "The project ID to create the resources in."
  type        = string
}

variable "region" {
  description =  <<-EOT
    {
   "type": "json",
   "purpose": "autocomplete",
   "data":[ "asia-east1",
        "asia-east2",
        "asia-northeast1",
        "asia-northeast2",
        "asia-northeast3",
        "asia-south1",
        "asia-south2",
        "asia-southeast1",
        "asia-southeast2",
        "australia-southeast1",
        "australia-southeast2",
        "europe-central2",
        "europe-north1",
        "europe-west1",
        "europe-west2",
        "europe-west3",
        "europe-west4",
        "europe-west6",
        "northamerica-northeast1",
        "northamerica-northeast2",
        "southamerica-east1",
        "southamerica-west1",
        "us-central1",
        "us-east1",
        "us-east4",
        "us-west1",
        "us-west2",
        "us-west3",
        "us-west4"
    ],
   "description": "All resources will be launched in this region."
}
  EOT
  type        = string
}

variable "name" {
  description = "Name for the load balancer forwarding rule and prefix for supporting resources."
  type        = string
}

variable "load_balancing_scheme" {
  description = <<-EOT
  {
   "type": "json",
   "purpose": "autocomplete",
   "data": [
  "EXTERNAL",
  "INTERNAL",
  "INTERNAL_MANAGED"
   ],
   "description":"This signifies what the ForwardingRule will be used for"
   }
EOT
  type        = string
}

variable "source_ranges" {
  description = "If source ranges are specified, the firewall will apply only to traffic that has source IP address in these ranges"
  type        = string
}

variable "network" {
  description = "Self link of the VPC network in which to deploy the resources."
  type        = string
}

variable "instances" {
  description = "List of self links to instances in the pool. Note that the instances need not exist at the time of target pool creation."
  type        = list(string)
}

#OPTIONAL 

variable "protocol" {
  description = <<-EOT
  {
   "type": "json",
   "purpose": "autocomplete",
   "data": [
  "TCP",
  "UDP"
   ],
   "description":"The protocol for the backend and frontend forwarding rule"
   }
EOT
  type        = string
  default     = "TCP"
}

variable "ip_address" {
  description = "IP address of the load balancer. If empty, an IP address will be automatically assigned."
  type        = string
  default     = null
}

variable "port_range" {
  description = "Only packets addressed to ports in the specified range will be forwarded to target. If empty, all packets will be forwarded."
  type        = string
  default     = null
}

variable "enable_health_check" {
  description = <<-EOT
  {
   "type": "json",
   "purpose": "autocomplete",
   "data": [
  "true",
  "false"
   ],
   "default":false,
   "description": "Flag to indicate if health check is enabled. If set to true, a firewall rule allowing health check probes is also created."
}
EOT 
  type        = bool
  default     = false
}

variable "health_check_port" {
  description = "The TCP port number for the HTTP health check request."
  type        = number
  default     = 80
}

variable "health_check_healthy_threshold" {
  description = "A so-far unhealthy instance will be marked healthy after this many consecutive successes. The default value is 2."
  type        = number
  default     = 2
}

variable "health_check_unhealthy_threshold" {
  description = "A so-far healthy instance will be marked unhealthy after this many consecutive failures. The default value is 2."
  type        = number
  default     = 2
}

variable "health_check_interval" {
  description = "How often (in seconds) to send a health check. Default is 5."
  type        = number
  default     = 5
}

variable "health_check_timeout" {
  description = "How long (in seconds) to wait before claiming failure. The default value is 5 seconds. It is invalid for 'health_check_timeout' to have greater value than 'health_check_interval'"
  type        = number
  default     = 5
}

variable "health_check_path" {
  description = "The request path of the HTTP health check request. The default value is '/'."
  type        = string
  default     = "/"
}

variable "firewall_target_tags" {
  description = "List of target tags for the health check firewall rule."
  type        = list(string)
  default     = []
}

variable "session_affinity" {
  description = <<-EOT
  {
   "type": "json",
   "purpose": "autocomplete",
   "data": [
  "NONE",
  "CLIENT_IP"
   ],
   "description":"The session affinity for the backends."
}
EOT 
  type        = string
  default     = "NONE"
}
variable "custom_labels" {
  description = "A map of custom labels to apply to the resources. The key is the label name and the value is the label value."
  type        = map(string)
  default     = {}
}
variable "tags" {
  type        = string
  description = "this is for assigning tags."
}
