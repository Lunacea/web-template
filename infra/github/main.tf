terraform {
  required_version = ">= 1.5.0"
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 6.2.0"
    }
  }
}

provider "github" {
  # 環境変数 GITHUB_TOKEN を使用（repo 管理権限が必要）
  owner = var.owner
}

data "github_repository" "repo" {
  full_name = "${var.owner}/${var.repository}"
}

resource "github_branch_protection_v3" "main" {
  repository     = data.github_repository.repo.name
  branch         = "main"
  enforce_admins = true

  require_conversation_resolution = true

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = 1
    require_code_owner_reviews      = false
  }
}

resource "github_repository_collaborator" "collab" {
  for_each   = var.collaborators
  repository = data.github_repository.repo.name
  username   = each.key
  permission = each.value # pull|triage|push|maintain|admin
}

resource "github_actions_secret" "secrets" {
  for_each        = var.secrets
  repository      = data.github_repository.repo.name
  secret_name     = upper(each.key)
  plaintext_value = each.value
}

resource "github_actions_variable" "variables" {
  for_each      = var.variables
  repository    = data.github_repository.repo.name
  variable_name = upper(each.key)
  value         = each.value
}

resource "github_repository_vulnerability_alerts" "alerts" {
  repository = data.github_repository.repo.name
}

resource "github_actions_repository_permissions" "permissions" {
  repository      = data.github_repository.repo.name
  enabled         = true
  allowed_actions = "all"
}

