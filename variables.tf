# variables.tf
variable "github_token" {
  description = "Token d'accès personnel GitHub pour Amplify"
  type        = string
  sensitive   = true # Terraform masquera cette valeur dans les logs
}
