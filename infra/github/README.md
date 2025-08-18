# GitHub リポジトリ設定 (Terraform)

このモジュールは GitHub リポジトリ設定を自動化します。

## できること

- main ブランチ保護
- コラボレーターの招待（権限指定）
- GitHub Actions の Secrets/Variables 設定
- 脆弱性アラートの有効化
- Actions 実行許可（全アクション）

## 使い方

```hcl
module "repo" {
  source      = "./infra/github"
  owner       = "your-org-or-user"
  repository  = "your-repo"
  collaborators = {
    your-collaborator = "push"
  }
  secrets = {
    DATABASE_URL = "postgresql://..."
  }
  variables = {
    NODE_ENV = "production"
  }
}
```

環境変数 `GITHUB_TOKEN` に管理権限トークンを設定して実行してください。
