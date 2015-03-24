require 'capybara'
require 'capybara/poltergeist'
require 'capybara/rspec'

RSpec.configure do |config|
  config.include Capybara::DSL#, type: :feature
end

Capybara.app = 'target_app_name'
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: true, timeout: 60)
end

# URL of target application
Capybara.app_host = 'http://hoge.local'
Capybara.run_server = false
