provider "helm" {
 kubernetes {
   config_context = "minikube"
 }
}
resource "helm_release" "postgresql" {
 name  = "postgresql"
 chart = "${abspath(path.root)}/helm/postgresql"
}
resource "helm_release" "python" {
 name  = "python"
 chart = "${abspath(path.root)}/helm/python"
}