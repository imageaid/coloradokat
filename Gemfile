source "https://rubygems.org"

ruby "3.3.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3", ">= 7.1.3.2"

gem "aws-sdk-s3"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "friendly_id"
gem "image_processing", "~> 1.2"
gem "importmap-rails"
gem "pagy"
gem "pg", "~> 1.1"
gem "propshaft"
gem "puma", ">= 5.0"
gem "redis", ">= 4.0.1"
gem "solid_cache"
gem "solid_queue"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem "hotwire-livereload"
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "annotate"
  gem "rails_services"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
