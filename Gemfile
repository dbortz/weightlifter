source "https://rubygems.org"

ruby "3.2.2" # Specify your Ruby version

gem "rails", "~> 7.1.2"
gem "pg", "~> 1.5"
gem "puma", "~> 6.4"
gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Frontend
gem "sprockets-rails"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tailwindcss-rails", "~> 2.0"
gem "view_component", "~> 3.6"

# Authentication & Authorization
gem "devise", "~> 4.9"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem "dotenv-rails"
  gem "rspec-rails", "~> 6.0"
  gem "factory_bot_rails", "~> 6.2"
end

group :development do
  gem "web-console"
  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end 