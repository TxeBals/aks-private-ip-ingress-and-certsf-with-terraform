resource "kubernetes_secret" "certsTLS" {
    metadata {
        name = var.ssl_name
        namespace = var.ssl_namespace
    }
     data = {
        "tls.crt" = file("${var.cert_path}")
        "tls.key" = file("${var.key_path}")
  }

    
    type = "kubernetes.io/tls"
}