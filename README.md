# graphql-test-backend

## 環境
- Language: Ruby 3.0.2
- Framework: Ruby on Rails 6.1.4.1
- Database: PostgreSQL 13
- Front: Node 14.15.1

## 環境構築
```
# 環境変数のコピー
cp .sample.env .env.local

# GemのInstall
bundle install

# DB作成
bin/rails db:create

# マイグレーション
bin/rails db:migrate

# Seedデータ投入
bin/rails db:seed db:seed_fu

# railsの起動
bin/rails s
```

### Dockerで作る場合
```
# Docker Imageの作成
docker-compose build

# Dockerコンテナを起動
docker-compose up -d && docker attach graphql-test-backend_app_1
-> http://localhost:8000/

# DB作成
docker-compose run app bin/rails db:create

# マイグレーション
docker-compose run app bin/rails db:migrate

# Console起動
docker-compose run app bin/rails c

# コンテナに入る
docker-compose exec app bash
```

## テスト

```
# テストの実行
bundle exec rspec
```

## Lintのチェック

```
# Lintのチェック
bundle exec rubocop

# Lintによる自動整形
bundle exec rubocop --auto-correct
```
