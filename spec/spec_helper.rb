# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'spork'

Spork.prefork do
  require "#{Rails.root}/db/seeds.rb"

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  Capybara.javascript_driver = :poltergeist
  Capybara.default_wait_time = 5
  FakeWeb.allow_net_connect = false
  FakeWeb.allow_net_connect = %r[^https?://127.0.0.1]

  RSpec.configure do |config|
    config.mock_with :rspec
    config.use_transactional_fixtures = false
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run focus: true
    config.run_all_when_everything_filtered = true

    config.before(:suite) do
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.strategy = :transaction
    end

    config.before(:each, :js => true) do
      DatabaseCleaner.strategy = :truncation
    end

    config.before(:each) do
      DatabaseCleaner.start
      FakeWeb.clean_registry
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

    config.include FactoryGirl::Syntax::Methods
    config.order = 'random'
  end

end

Spork.each_run do
  FactoryGirl.reload
end
