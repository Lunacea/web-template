# Prerequisite

このプロジェクトを動かすための前提条件と、OS別のセットアップ手順をまとめます。対象OSは Windows / macOS / Linux です。

## 1. 必須ツール

### 基本ツール

- **Git**: バージョン管理
- **Docker**: コンテナ化（Windows/macOS は Docker Desktop、Linux は Docker Engine + docker compose plugin）
- **VS Code**: 推奨エディタ
- **Dev Containers 拡張**: 統一された開発環境

### ランタイム・開発ツール

- **Bun**: 高速な JavaScript/TypeScript ランタイム
- **Node.js**: Bun と併用可能（必要に応じて）

### インフラ・CI/CD

- **Terraform**: インフラ・GitHub 設定の IaC
- **GitHub アカウント**: GitHub Actions、リポジトリ管理

### 推奨 VS Code 拡張

- 拡張は `.vscode/extensions.json` で自動提示されます（初回起動時にインストールを促されます）。
- 主要な推奨拡張: Biome, Prisma, Tailwind CSS, Dev Containers, GitHub Actions,
  Terraform, Docker, Markdownlint, GitLens, Git Graph, Todo Tree など。

## 2. ツール別インストール

### 2.1 Docker

```bash
# [Windows]
# WSL2 有効化（管理者 PowerShell）
# dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
# dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
# wsl --set-default-version 2
# Docker Desktop をインストール: https://www.docker.com/products/docker-desktop/

# [macOS]
# Docker Desktop をインストール: https://www.docker.com/products/docker-desktop/

# [Linux（Ubuntu系）]
# Docker Engine + compose plugin
sudo apt-get update
sudo apt-get install -y docker.io docker-compose-plugin
sudo usermod -aG docker $USER && newgrp docker
docker version
docker compose version
```

### 2.2 Git

```bash
# [Windows]
winget install --id Git.Git -e --source winget

# [macOS]
xcode-select --install
# または
brew install git

# [Linux（Ubuntu系）]
sudo apt-get install -y git
```

### 2.3 VS Code + Dev Containers

```bash
# [Windows]
winget install --id Microsoft.VisualStudioCode -e --source winget
# Dev Containers 拡張を VS Code からインストール

# [macOS]
brew install --cask visual-studio-code
# Dev Containers 拡張を VS Code からインストール

# [Linux]
# https://code.visualstudio.com/ から配布パッケージをインストール
# Dev Containers 拡張を VS Code からインストール
```

### 2.4 Bun

```bash
# [Windows] PowerShell（管理者不要）
powershell -c "irm bun.sh/install.ps1 | iex"
bun --version

# [macOS]
curl -fsSL https://bun.sh/install | bash
exec $SHELL -l && bun --version

# [Linux]
curl -fsSL https://bun.sh/install | bash
exec $SHELL -l && bun --version
```

### 2.5 Terraform

```bash
# [Windows]
winget install --id HashiCorp.Terraform -e --source winget
terraform -v

# [macOS]
brew tap hashicorp/tap && brew install hashicorp/tap/terraform
terraform -v

# [Linux（Ubuntu系）]
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install -y terraform
terraform -v
```

## 3. 初回セットアップ（共通）

### ステップ 1: リポジトリのクローン

```bash
# リポジトリをクローン
git clone <your-repo-url> web-template
cd web-template

# 現在のディレクトリを確認
pwd
ls -la
```

### ステップ 2: Dev Container での開発環境起動（推奨）

```bash
# VS Code で「Reopen in Container」を実行
# または、コマンドパレット（Ctrl+Shift+P / Cmd+Shift+P）で
# "Dev Containers: Reopen in Container" を選択

# コンテナ内で自動的に bun install が実行されます
# 完了まで数分待機してください
```

### ステップ 3: 環境変数の設定

```bash
# .env ファイルを作成（Prisma 用の接続文字列）
echo "DATABASE_URL=postgresql://postgres:postgres@localhost:5432/app" > .env

# .env ファイルの内容を確認
cat .env
```

### ステップ 4: Docker でのデータベース起動

```bash
# Docker を起動（DB 用）
docker compose up -d --build

# 起動状況を確認
docker compose ps

# ログを確認（エラーがあれば表示される）
docker compose logs db
```

### ステップ 5: Prisma の設定

```bash
# Prisma クライアントの生成
bun run db:generate

# データベースマイグレーション（初回のみ）
bun run db:migrate

# Prisma Studio でデータベースを確認（オプション）
bunx prisma studio
```

### ステップ 6: 動作確認

```bash
# テストの実行
bun run test

# 型チェック
bun run typecheck

# リンターの実行
bun run lint

# 開発サーバーの起動（バックエンド）
bun run start
```

## 4. トラブルシューティング

### よくある問題と解決方法

#### Docker 関連

```bash
# Docker が起動していない場合
# Windows/macOS: Docker Desktop を起動
# Linux: Docker サービスを開始
sudo systemctl start docker

# ポートが既に使用されている場合
docker compose down
docker compose up -d --build
```

#### Dev Container 関連

```bash
# Dev Container のビルドに失敗した場合
# VS Code で「Dev Containers: Rebuild Container」を実行

# キャッシュをクリアする場合
# VS Code で「Dev Containers: Rebuild Container (No Cache)」を実行
```

#### Bun 関連

```bash
# bun コマンドが見つからない場合
# パスを確認
echo $PATH
which bun

# シェルを再起動
exec $SHELL -l
```

#### データベース接続エラー

```bash
# PostgreSQL の起動確認
docker compose ps db

# 接続テスト
docker compose exec db psql -U postgres -d app -c "SELECT 1;"
```

## 5. GitHub Actions / Terraform の前提

### GitHub シークレットの設定（共通）

```bash
# GitHub リポジトリの Settings > Secrets and variables > Actions で以下を設定
# DATABASE_URL: 本番/ステージング環境のデータベース接続文字列（任意）
# GITHUB_TOKEN: Actions 既定トークン。GHCR push/リリースに使用（通常は追加設定不要）
# TF_GITHUB_TOKEN: Terraform (infra/github) で管理権限が必要な場合に使用（任意）
```

### Terraform の設定（環境別）

```bash
# 現状は placeholder（infra/environments/{stg,prd}）
# 利用クラウドのプロバイダ設定と認証情報を追加してください

# ローカルでの Terraform 実行例
cd infra/environments/stg

# 初期化
terraform init

# 実行計画の確認
terraform plan

# 適用
terraform apply -auto-approve
```

### GitHub リポジトリ設定（Terraform・例）

```bash
# リポジトリ自体の設定は infra/github で自動化できます

# 環境変数の設定
export GITHUB_TOKEN=ghp_xxx # repo 管理が可能な PAT

# Terraform の実行
terraform -chdir=infra/github init
terraform -chdir=infra/github apply -auto-approve \
  -var="owner=<org-or-user>" \
  -var="repository=<repo-name>" \
  -var='collaborators={"user1"="push"}' \
  -var='secrets={"DATABASE_URL"="postgresql://..."}' \
  -var='variables={"NODE_ENV"="production"}'
```

## 6. 段階的な導入ガイド

### フェーズ 1: 基本開発環境（必須）

- [ ] 必須ツールのインストール
- [ ] リポジトリのクローン
- [ ] Dev Container での開発環境起動
- [ ] 基本的な動作確認

### フェーズ 2: データベース・API（推奨）

- [ ] PostgreSQL の起動
- [ ] Prisma の設定
- [ ] 基本的な CRUD 操作
- [ ] API エンドポイントの実装

### フェーズ 3: CI/CD・インフラ（発展）

- [ ] GitHub Actions の設定
- [ ] Terraform でのインフラ管理
- [ ] 自動デプロイの設定
- [ ] 監視・ログの導入

### フェーズ 4: 高度な機能（オプション）

- [ ] セキュリティ強化
- [ ] パフォーマンス最適化
- [ ] 国際化・アクセシビリティ
- [ ] コンプライアンス対応

## 7. 次のステップ

セットアップが完了したら、以下を確認してください：

1. **README.md**: プロジェクトの概要と使用方法
2. **DESIGN.md**: アーキテクチャと設計方針
3. **.ai-prompts/prompts.md**: AI 開発支援のためのプロンプト集
4. **scripts/**: 開発効率化のためのスクリプト

## 8. サポート・リソース

- **公式ドキュメント**: 各ツールの公式ドキュメントを参照
- **GitHub Issues**: 問題が発生した場合は Issue を作成
- **コミュニティ**: 各ツールのコミュニティフォーラムを活用

以上で、開発に必要な前提条件のセットアップは完了です。何か問題が発生した場合は、トラブルシューティングセクションを参照してください。
