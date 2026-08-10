terraform{
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "-> 2.0"
    }
  }
}

variable "k8s_token" {
  description = "kubernetes service account token"
  type        = string
  sensitive   = true
}

provider "kubernetes" {
  host                   = "https://minikube:8443"
  token                  = var.k8s_token
  insecure               = true
}

resource "kubernetes_namespace" "demo" {
  metadata {
    name = "terraform-demo"
  }
}

resource "kubernetes_config_map" "demo_config" {
  metadata {
    name       = "terraform-demo-config"
    namespace  = kubernetes_namespace.demo.metadata[0].name
  }
  data = {
    "message" = "Hello from Terraform"
  }
}
