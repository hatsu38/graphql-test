source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "rails", "6.1.4.1"
gem "pg"
gem "puma"
gem "sass-rails"
gem "webpacker"
gem "turbolinks"
gem "jbuilder"
gem "bootsnap", require: false
gem "graphql" # RubyでGraphqlを扱う

group :development, :test do
  # Graphqlの管理画面用
  gem "graphiql-rails"

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
  gem "simplecov", require: false # Testカバレッジを計測
  gem "annotate" # Table情報をModelに自動で追記
  gem "web-console"
  gem "rack-mini-profiler"
  gem "listen"
  gem "spring"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
