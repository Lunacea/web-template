# Web Template (Bun + TypeScript + React/Vue/Svelte-ready + Prisma)

<!-- Badges: Replace <owner>/<repo> after you push to GitHub -->

[![CI](https://github.com/Lunacea/web-template/actions/workflows/ci.yml/badge.svg)](https://github.com/Lunacea/web-template/actions/workflows/ci.yml)
[![CD](https://github.com/Lunacea/web-template/actions/workflows/cd.yml/badge.svg)](https://github.com/Lunacea/web-template/actions/workflows/cd.yml)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-fc8d62)](https://www.conventionalcommits.org/ja/v1.0.0/)
[![semantic-release](https://img.shields.io/badge/semantic--release-enabled-43b02a)](https://semantic-release.gitbook.io/semantic-release/)
[![Renovate](https://img.shields.io/badge/Renovate-enabled-1a1f6c?logo=renovatebot&logoColor=white)](https://docs.renovatebot.com/)
[![Dependabot](https://img.shields.io/badge/Dependabot-enabled-025E8C?logo=dependabot&logoColor=white)](https://dependabot.com/)
[![Dev Containers](https://img.shields.io/badge/Dev%20Containers-ready-0078D4?logo=visualstudiocode&logoColor=white)](https://containers.dev/)
[![License](https://img.shields.io/badge/License-UNLICENSED-lightgrey)](LICENSE)

## 🚀 概要

モダンなWebアプリ開発のための、**完全自動化を志向したTypeScriptプロジェクトテンプレート**です。

**目標**: 開発者が `git clone` 後、ビジネスロジックの実装だけに集中できる環境を提供

### ✨ 主要な特徴

- 🔥 **Bun + TypeScript**: 高速な開発環境
- 🎯 **フレームワーク柔軟性**: React/Vue/Svelte を任意選択
- 🐳 **Dev Containers**: 統一された開発環境
- 🤖 **完全自動化**: CI/CD、リリース、依存更新
- 🏗️ **IaC**: Terraform によるインフラ・GitHub設定自動化
- 🎨 **品質保証**: Biome、Husky、commitlint
- 📚 **包括的ドキュメント**: 初心者から上級者まで対応

## 🛠️ 技術スタック

### 基盤技術（固定）

![Bun](https://img.shields.io/badge/Bun-1.2+-000000?logo=bun&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-5.x-3178C6?logo=typescript&logoColor=white)
![Prisma](https://img.shields.io/badge/Prisma-ORM-2D3748?logo=prisma&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-ready-2496ED?logo=docker&logoColor=white)

### 開発環境・ツール

![VS Code](https://img.shields.io/badge/VS%20Code-007ACC?logo=visualstudiocode&logoColor=white)
![Dev Containers](https://img.shields.io/badge/Dev%20Containers-0078D4?logo=visualstudiocode&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?logo=github&logoColor=white)

### 品質・自動化

![Biome](https://img.shields.io/badge/code%20style-Biome-60a5fa?logo=biome)
![Husky](https://img.shields.io/badge/Husky-000000?logo=git&logoColor=white)
![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-fc8d62)
![semantic-release](https://img.shields.io/badge/semantic--release-enabled-43b02a)

### インフラ・CI/CD

![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?logo=terraform&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-2088FF?logo=githubactions&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?logo=postgresql&logoColor=white)

## 📋 前提条件

詳細なセットアップ手順は [PREREQUISITE.md](PREREQUISITE.md) を参照してください。

### 必須ツール

- **Git**: バージョン管理
- **Docker**: コンテナ化（Windows/macOS: Docker Desktop、Linux: Docker Engine）
- **VS Code**: 推奨エディタ
- **Dev Containers 拡張**: 統一された開発環境

### ランタイム・開発ツール

- **Bun**: 高速な JavaScript/TypeScript ランタイム
- **Terraform**: インフラ・GitHub 設定の IaC

## 🚀 クイックスタート

### 1. リポジトリのクローン

```bash
git clone <your-repo-url> web-template
cd web-template
```

### 2. Dev Container での開発環境起動（推奨）

```bash
# VS Code で「Reopen in Container」を実行
# または、コマンドパレット（Ctrl+Shift+P / Cmd+Shift+P）で
# "Dev Containers: Reopen in Container" を選択

# コンテナ内で自動的に bun install が実行されます
# 完了まで数分待機してください
```

### 3. 環境変数の設定

```bash
# .env ファイルを作成（Prisma 用の接続文字列）
echo "DATABASE_URL=postgresql://postgres:postgres@localhost:5432/app" > .env
```

### 4. Docker でのデータベース起動

```bash
# Docker を起動（DB 用）
docker compose up -d --build

# 起動状況を確認
docker compose ps
```

### 5. Prisma の設定

```bash
# Prisma クライアントの生成
bun run db:generate

# データベースマイグレーション（初回のみ）
bun run db:migrate
```

### 6. 動作確認

```bash
# テストの実行
bun run test

# 型チェック
bun run typecheck

# リンターの実行
bun run lint

# 開発サーバーの起動
bun run dev
```

## 📚 主要コマンド

### 開発・ビルド

```bash
bun run dev          # 開発サーバー起動
bun run build        # ビルド実行
bun run start        # 本番サーバー起動
```

### 品質チェック

```bash
bun run lint         # リンター実行
bun run lint:fix     # 自動修正
bun run typecheck    # 型チェック
bun run test         # テスト実行
bun run test:watch   # テスト監視モード
```

### データベース

```bash
bun run db:generate  # Prisma クライアント生成
bun run db:migrate   # マイグレーション実行
```

### Git 操作

```bash
bun run commit       # 対話的コミット（Conventional Commits）
bun run commit:quick # クイックコミット
bun run branch:new   # ブランチ作成（命名規約準拠）
```

### その他

```bash
bun run release      # リリース実行
bun run md:lint      # Markdown リンター
bun run md:lint:fix  # Markdown 自動修正
```

## 🔄 開発フロー

### 1. ブランチ作成（命名規約準拠）

```bash
# 機能追加
git checkout -b feat/PROJ-123--hello-world

# バグ修正
git checkout -b fix/login-error

# ドキュメント更新
git checkout -b docs/readme-update
```

### 2. 開発・テスト

```bash
# 実装後、品質チェック
bun run lint:fix
bun run typecheck
bun run test
```

### 3. コミット・プッシュ

```bash
# Conventional Commits 準拠
git add -A
git commit -m "feat: add hello world function"
git push -u origin HEAD
```

### 4. PR 作成・レビュー

- GitHub で PR を作成
- CI が自動実行（Biome、Markdown Lint、Type Check、Test、Build、Trivy、Commitlint）
- レビュー承認後にマージ

### 5. 自動デプロイ

- `main` ブランチへのマージで CD が起動
- Docker Build & Push（GHCR）
- Terraform Apply
- Prisma migrate deploy
- semantic-release による自動リリース

## 🏗️ アーキテクチャ

詳細な設計は [DESIGN.md](DESIGN.md) を参照してください。

### 全体構成

```text
web-template/
├── .devcontainer/          # Dev Container 設定
├── .github/                # GitHub Actions, Dependabot
├── .husky/                 # Git フック（Husky）
├── docker/                 # Docker 設定
├── infra/                  # Terraform 設定
├── prisma/                 # データベーススキーマ
├── scripts/                # 開発効率化スクリプト
└── src/
    ├── backend/           # バックエンド（Bun サーバー等）
    └── frontend/          # フロントエンド（後で選択する UI フレームワーク）
```

### 技術選択の指針

#### 既定技術（固定）

- **ランタイム**: Bun、TypeScript
- **開発環境**: Dev Containers、VS Code
- **品質**: Biome、Husky、commitlint
- **インフラ**: Docker、Terraform、GitHub Actions

#### 柔軟技術（選択可能）

- **フロントエンド**: React/Vue/Svelte
- **データベース**: PostgreSQL（デフォルト）、その他対応可能
- **スタイリング**: Tailwind CSS（デフォルト）、その他対応可能

#### 未決定技術（プロジェクト開始時に決定）

- UI ライブラリ、状態管理、ルーティング
- API フレームワーク、認証方式
- クラウドプロバイダー、監視・ログ

## 🐳 Docker / Compose

### 開発環境での使用

```bash
# データベース起動
docker compose up -d --build

# 状況確認
docker compose ps
docker compose logs db

# 停止
docker compose down
```

### 設計方針

- **Dev Container**: 統一された開発環境（Bun/TypeScript/ツール群）
- **Docker Compose**: データベースとアプリケーションの起動
- **本番ビルド**: GitHub Actions で BuildKit を使用

### ビルド最適化

- 依存インストールを分離（deps ステージ）
- BuildKit のローカルキャッシュ（`.docker-cache`）
- Bun 1.2+ の `bun.lock` 対応

## 🔧 CI/CD

### CI（Pull Request）

- **Biome**: コードフォーマット・リンター
- **Markdown Lint**: ドキュメント品質
- **Type Check**: TypeScript 型チェック
- **Unit Test**: `bun test` 実行
- **Build Check**: ビルド成功確認
- **Trivy Scan**: セキュリティ脆弱性スキャン
- **Commitlint**: Conventional Commits 準拠確認

### CD（main ブランチ）

- **Docker Build & Push**: GHCR へのイメージプッシュ
- **Terraform Apply**: インフラ設定の適用
- **Prisma migrate deploy**: データベースマイグレーション
- **semantic-release**: 自動バージョニング・リリース

### 運用上の注意（GHCR 小文字化）

- GHCR へプッシュする Docker イメージ名は、GitHub の `owner/repo` をベースに自動生成します。
  - Docker の制約により、リポジトリ名は小文字のみ許可されます。
  - 本テンプレートでは `github.repository` を Bash で小文字化してからタグを生成します。
  - Dockerfile 側の変更は不要です。

### Secrets / Permissions

- **GITHUB_TOKEN**: GitHub Actions が自動で提供（`packages: write` 権限で GHCR ログインに利用）。
  - 通常は追加設定不要です。
- **DATABASE_URL（任意）**: 設定されている場合のみ `Prisma migrate deploy` を実行します。
  - 未設定でも CD は失敗しません。
- **Terraform 用トークン（任意）**: `infra/github` の実行に管理権限が必要な場合、PAT を Secrets に追加してください（例: `TF_GITHUB_TOKEN`）。
  - 必要に応じてワークフローの `GITHUB_TOKEN` 参照を切り替えてください。

## 🧭 運用方法（ブランチ/PR/リリース）

1. Issue を起票（任意）
   - `bun run issue:new` で対話的に作成（要 GitHub CLI `gh`）。
   - 代替: GitHub UI から作成。
2. ブランチを作成
   - 規約例: `feat/PROJ-123--add-xxx`, `fix/bug-slug`
   - `bun run branch:new` で対話的に作成。
   - 一括補助: `bun run gh:flow`（Issue → ブランチ → PR）。
3. 実装してコミット
   - `bun run lint:fix`, `bun run typecheck`, `bun run test` を通す。
4. PR を作成
   - `bun run pr:new` で対話的に作成（要 `gh`）。
   - 代替: `gh pr create` 直接、または GitHub 上で作成。
5. マージ（main）
   - CD が走り、GHCR へ push → Terraform → Prisma（任意）→ semantic-release が順に実行。

### GitHub リポジトリ設定の自動化

`infra/github` で以下を自動化できます：

```bash
export GITHUB_TOKEN=ghp_xxx # repo 管理が可能な PAT
terraform -chdir=infra/github init
terraform -chdir=infra/github apply -auto-approve \
  -var="owner=<org-or-user>" \
  -var="repository=<repo-name>" \
  -var='collaborators={"user1"="push"}' \
  -var='secrets={"DATABASE_URL"="postgresql://..."}' \
  -var='variables={"NODE_ENV"="production"}'
```

## 🎨 フロントエンドフレームワーク導入

このテンプレートはフロントエンドフレームワークを後から選択できます。

### React 導入

```bash
bun add react react-dom
bun add -d @types/react @types/react-dom
```

### Vue 導入

```bash
bun add vue
```

### Svelte 導入

```bash
bun add svelte
```

詳細な手順は [PREREQUISITE.md](PREREQUISITE.md) の「段階的な導入ガイド」を参照してください。

## 📖 ドキュメント

- **[PREREQUISITE.md](PREREQUISITE.md)**: セットアップ手順・トラブルシューティング
- **[DESIGN.md](DESIGN.md)**: アーキテクチャ・設計方針・技術スタック定義
- **[.ai-prompts/prompts.md](.ai-prompts/prompts.md)**: AI 開発支援プロンプト集
- **[tools/](tools/)**: 開発効率化ツール

## 🆘 トラブルシューティング

よくある問題と解決方法は [PREREQUISITE.md](PREREQUISITE.md) の「トラブルシューティング」セクションを参照してください。

### 段階的な導入ガイド

#### フェーズ 1: 基本開発環境（必須）

- [ ] 必須ツールのインストール
- [ ] リポジトリのクローン
- [ ] Dev Container での開発環境起動
- [ ] 基本的な動作確認

#### フェーズ 2: データベース・API（推奨）

- [ ] PostgreSQL の起動
- [ ] Prisma の設定
- [ ] 基本的な CRUD 操作
- [ ] API エンドポイントの実装

#### フェーズ 3: CI/CD・インフラ（発展）

- [ ] GitHub Actions の設定
- [ ] Terraform でのインフラ管理
- [ ] 自動デプロイの設定
- [ ] 監視・ログの導入

#### フェーズ 4: 高度な機能（オプション）

- [ ] セキュリティ強化
- [ ] パフォーマンス最適化
- [ ] 国際化・アクセシビリティ
- [ ] コンプライアンス対応

## 🤝 コントリビューション

1. このリポジトリをフォーク
2. 機能ブランチを作成（`feat/amazing-feature`）
3. 変更をコミット（Conventional Commits 準拠）
4. ブランチにプッシュ
5. Pull Request を作成

## 📄 ライセンス

[UNLICENSED](LICENSE) - このプロジェクトはライセンスされていません。

## 🔗 関連リンク

- [Bun](https://bun.sh/) - JavaScript ランタイム
- [TypeScript](https://www.typescriptlang.org/) - 静的型付け言語
- [Prisma](https://www.prisma.io/) - データベース ORM
- [Dev Containers](https://containers.dev/) - 開発環境の統一
- [Terraform](https://www.terraform.io/) - インフラストラクチャ・アズ・コード
- [Conventional Commits](https://www.conventionalcommits.org/) - コミットメッセージ規約
