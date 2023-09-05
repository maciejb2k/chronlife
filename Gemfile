source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"
gem "rails", "~> 7.0.6"

# Cool stuff
gem "pg", "~> 1.1"
gem "puma", "~> 5.6"
gem "tzinfo-data", "~> 2.0.6", platforms: %i[mingw mswin x64_mingw jruby]
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

# Background jobs
gem "sidekiq", "~> 7.1.2"

# DSL for json structures
gem "jbuilder", "~> 2.11.5"

# Tailwind CSS support
gem "cssbundling-rails", "~> 1.2.0"

# Load environment variables
gem "dotenv-rails", "~> 2.8.1"

# Authentication and Devise
gem "bcrypt", "~> 3.1.19"
gem "devise", "~> 4.9.2"
gem "devise-two-factor", "~> 5.0.0"
gem "omniauth-rails_csrf_protection", "~> 1.0.1"
gem "omniauth-google-oauth2", "~> 1.1.1"
gem "omniauth-facebook", "~> 9.0.0"
gem "rqrcode", "~> 2.2.0"

# Authorization
gem "pundit", "~> 2.3.1"

# Annotate models with database schema
gem "annotate", "~> 3.2.0"

# Validations
gem "phonelib", "~> 0.8.1"
gem "validates_timeliness", "~> 7.0.0.beta1"

# File uploads
gem "shrine", "~> 3.5.0"

# ERB Formatter
gem "htmlbeautifier", "~> 1.4.2"

# For profiling
gem "rack-mini-profiler", "~> 3.1.0"

# For memory profiling
gem "memory_profiler", "~> 1.0.1"

# For call-stack profiling flamegraphs
gem "stackprof", "~> 0.2.25"

# Pagination
gem "pagy", "~> 6.0.4"

# Charts
gem "groupdate", "~> 6.3.0"
gem "chartkick", "~> 5.0.2"

# Calendar
gem "simple_calendar", "~> 2.4"

# Extended rake stats command
gem "rails_stats", "~> 1.0.2"

# Admin panel
gem "avo", "~> 2.39.0"

# Dynamically apply scopes
gem "has_scope", "~> 0.8.1"

# PDF generation
gem "prawn", "~> 2.4.0"

group :development, :test do
  gem "debug", "~> 1.8.0", platforms: %i[mri mingw x64_mingw]
  gem "faker", "~> 3.2.0"
  gem "factory_bot_rails", "~> 6.2.0"
  gem "rspec-rails", "~> 6.0.3"
  gem "rubocop", "~> 1.54.1", require: false
  gem "rubocop-performance", "~> 1.18.0", require: false
  gem "rubocop-rails", "~> 2.20.2", require: false
  gem "rubocop-rake", "~> 0.6.0", require: false
  gem "rubocop-rspec", "~> 2.22.0", require: false
  gem "simplecov", "~> 0.22.0", require: false
  gem "rails-erd", "~> 1.7.2"
  gem "shoulda-matchers", "~> 5.3.0"
  gem "test-prof", "~> 1.0"
end

group :development do
  gem "web-console", "~> 4.2.0"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
