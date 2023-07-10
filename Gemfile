source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"
gem "rails", "~> 7.0.6"

# Cool stuff
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "tzinfo-data", "~> 2.0.6", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", "~> 1.16.0", require: false

# Enable importmaps support
gem "importmap-rails", "~> 1.2.1"

# Assets pipeline
gem "sprockets-rails", "~> 3.4.2"

# Hotwire
gem "turbo-rails", "~> 1.4.0"
gem "stimulus-rails", "~> 1.2.1"

# Components
gem "view_component", "~> 3.3.0"
gem "view_component-contrib", "~> 0.1.4"

# Redis support
gem "redis", "~> 5.0.6"

# DSL for json structures
gem "jbuilder", "~> 2.11.5"

# Sass support
gem "sassc-rails", "~> 2.1.2"

# Load environment variables
gem "dotenv-rails", "~> 2.8.1"

# Authentication and Devise
gem "bcrypt", "~> 3.1.19"
gem "devise", "~> 4.9.2"
gem "devise-two-factor", "~> 5.0.0"
gem "omniauth-rails_csrf_protection", "~> 1.0.1"
gem "omniauth-google-oauth2", "~> 1.1.1"
gem 'omniauth-facebook', "~> 9.0.0"
gem 'rqrcode', "~> 2.2.0"

# Annotate models with database schema
gem "annotate", "~> 3.2.0"

# Validations
gem 'active_storage_validations', '~> 1.0.3'
gem 'phonelib', '~> 0.8.1'
gem 'validates_timeliness', '~> 7.0.0.beta1'

# ERB Formatter
gem "htmlbeautifier"

# For profiling
gem 'rack-mini-profiler'

# For memory profiling
gem 'memory_profiler'

# For call-stack profiling flamegraphs
gem 'stackprof'

group :development, :test do
  gem "debug", "~> 1.8.0", platforms: %i[ mri mingw x64_mingw ]
  gem "faker", "~> 3.2.0"
  gem "factory_bot_rails", "~> 6.2.0"
  gem "rspec-rails", "~> 6.0.3"
  gem "rubocop", "~> 1.54.1", require: false
  gem "rubocop-performance", "~> 1.18.0", require: false
  gem "rubocop-rails", "~> 2.20.2", require: false
  gem "rubocop-rake", "~> 0.6.0", require: false
  gem "rubocop-rspec", "~> 2.22.0", require: false
  gem "simplecov", "~> 0.22.0", require: false
  gem 'rails-erd', "~> 1.7.2"
end

group :development do
  gem "web-console", "~> 4.2.0"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
