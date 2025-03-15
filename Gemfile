source 'https://rubygems.org'

ruby '3.3.4'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.2.2', '>= 7.2.2.1'

# Autoload dotenv in Rails.
gem 'dotenv-rails', '~> 3.1', '>= 3.1.7', require: 'dotenv/load'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# A Ruby client that tries to match Redis' API one-to-one, while still providing an idiomatic interface.
gem 'redis', '~> 5.4'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Simple, efficient background processing for Ruby.
gem 'sidekiq', '~> 8.0'

# Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.
gem 'faker', '~> 3.5', '>= 3.5.1'

# Use Pry as your rails console
gem 'pry-rails', '~> 0.3.11'

# Great Ruby debugging companion: pretty print Ruby objects to visualize their structure. Supports custom object formatting via plugins
gem 'awesome_print', '~> 1.9', '>= 1.9.2'

# Kaminari is a Scope & Engine based, clean, powerful, agnostic, customizable and sophisticated paginator for Rails 4+
gem 'kaminari', '~> 1.2', '>= 1.2.2'

# Validation library
gem 'dry-validation', '~> 1.11', '>= 1.11.1'

# Provides the generator settings required for Rails to use Slim
gem 'slim-rails', '~> 3.7'

# A generalized Rack framework for multiple-provider authentication.
gem 'omniauth', '~> 2.1', '>= 2.1.3'

# A Google OAuth2 strategy for OmniAuth 1.x. This allows you to login to Google with your ruby app.
gem 'omniauth-google-oauth2', '~> 1.2', '>= 1.2.1'

# This gem provides a mitigation against CVE-2015-9284
gem 'omniauth-rails_csrf_protection', '~> 1.0', '>= 1.0.2'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem 'brakeman', require: false

  # RuboCop is a Ruby code style checking and code formatting tool. It aims to enforce the community-driven Ruby Style Guide.
  gem 'rubocop', '~> 1.72', '>= 1.72.2', require: false

  # Byebug is a Ruby debugger. It's implemented using the TracePoint C API for execution control and the Debug Inspector C API for call stack navigation.
  gem 'byebug', '~> 11.1', '>= 11.1.3'

  # factory_bot_rails provides integration between factory_bot and rails 5.0 or newer
  gem 'factory_bot_rails', '~> 6.4', '>= 6.4.4'

  # Generate beautiful API documentation, including a UI to explore and test operations, directly from your rspec integration tests. OpenAPI 2 and 3  supported.
  gem 'rswag', '~> 2.13'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # BDD for Ruby
  gem 'rspec', '~> 3.13'

  # rspec-rails is a testing framework for Rails 5+.
  gem 'rspec-rails', '~> 7.1', '>= 7.1.1'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'

  # Strategies for cleaning databases using ActiveRecord. Can be used to ensure a clean state for testing.
  gem 'database_cleaner-active_record', '~> 2.2'
end
