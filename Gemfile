source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "rails", "6.1.4.1"
gem "pg"
gem "puma"
gem "sass-rails"
gem "webpacker"
gem "turbolinks"
gem "bootsnap", require: false

# JsonのRender
gem "jb"

# 認証
gem "devise"
gem "devise_token_auth"

gem "rack-cors" # CORS設定

group :development, :test do
  # 初期データ投入
  gem "seed-fu"

  # 環境変数の管理
  gem "dotenv-rails"

  # Debugger
  gem "pry-rails" # デバッグ用
  gem "pry-byebug" # デバッグ用

  # Linter
  gem "rubocop", require: false # Linter
  gem "rubocop-performance", require: false # Linter
  gem "rubocop-rails", require: false # Linter
  gem "rubocop-rspec", require: false # Linter

  # Test
  gem "rspec-rails" # Railsのテストフレームワーク
  gem "factory_bot_rails" # テスト用のデータ作成
  gem "faker" # ダミーデータを生成

  # Security Check
  gem "brakeman"

  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "letter_opener_web" # メールをローカルで確認する
  gem "simplecov", require: false # Testカバレッジを計測
  gem "annotate" # Table情報をModelに自動で追記
  gem "web-console"
  gem "rack-mini-profiler"
  gem "listen"
  gem "spring"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
