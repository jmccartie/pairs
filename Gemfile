source 'https://rubygems.org'
gem 'rails', '~> 3.2.13'

gem "sorcery"
gem 'pg', '~> 0.15.1'
gem 'simple_form', '~> 2.1.0'
gem 'nested_form', '~> 0.3.2'
gem 'geocoder', '~> 1.1.8'
gem 'gmaps4rails'
gem 'cancan'
gem 'activerecord-postgres-hstore'
gem 'seed_dumper'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '~> 2.3.1.2'
  gem 'jquery-datatables-rails'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '~> 3.0.0'

group :development, :test do
  gem 'pry-rails'
  gem "rspec-rails", "~> 2.12.0"
  gem "factory_girl_rails", "~> 4.0.0"
  gem "guard", "~> 1.6.1"
  gem "guard-spork"
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem "capybara", '~> 1.1'
  gem 'launchy'
  gem 'database_cleaner', "~> 0.9.1"
  gem 'terminal-notifier-guard'
  gem "fakeweb"
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'dotenv-rails'
end

group :development do
  gem 'heroku'
  gem 'sextant'
  gem "better_errors"
  gem "binding_of_caller", "~> 0.7.1"
  gem 'quiet_assets'
  gem "foreman"
end

group :test do
  gem "poltergeist", "~> 1.0.2"
end

group :production do
  gem 'unicorn', '~> 4.6.2'
end