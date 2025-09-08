# wildrydes-site.tf

# 2. Crée l'application Amplify
resource "aws_amplify_app" "my_frontend_app" {
  name       = "wildrydes-site"
  repository = "https://github.com/phenix23/wildrydes-site"

  # Token d'accès GitHub (stocké de manière sécurisée dans une variable)
  access_token = var.github_token

  # Configuration de la construction (build settings)
  build_spec = <<-EOT
  version: 1
  frontend:
    phases:
      build:
        commands: []
    artifacts:
      baseDirectory: /
      files:
        - '**/*'
  EOT

  # Configuration générale du build automatique
  enable_branch_auto_build = true

  # Variables d'environnement pour la construction
  environment_variables = {
    ENV = "prod"
  }
}

# 3. Crée une branche "main" (branche de production)
resource "aws_amplify_branch" "main" {
  app_id      = aws_amplify_app.my_frontend_app.id
  branch_name = "main"

  # Déclare que c'est la branche de production
  stage = "PRODUCTION"

  # Active le déploiement automatique sur cette branche
  enable_auto_build = true
}

# 4. (Optionnel) Crée un webhook pour plus de fiabilité
resource "aws_amplify_webhook" "main_webhook" {
  app_id      = aws_amplify_app.my_frontend_app.id
  branch_name = aws_amplify_branch.main.branch_name
  description = "Webhook pour le déploiement auto de la branche main"
}

# 5. Output l'URL de préview de l'app
output "amplify_app_default_domain" {
  value = aws_amplify_app.my_frontend_app.default_domain
}

