
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara-webkit'
require 'capybara/poltergeist'
require 'faker'
require 'pry'

$: << './test_site'
$: << './lib'

require 'site_prism'
require 'test_site'
require 'sections/people'
require 'sections/no_element_within_section'
require 'sections/container_with_element'
require 'sections/child'
require 'sections/parent'
require 'sections/search_result'
require 'pages/home'
require 'pages/signin'
require 'pages/register'
require 'pages/landing'
require 'pages/dashboard'
require 'pages/register'
require 'pages/new_registration'

Capybara.configure do |config|
  #config.default_driver = :chrome
  config.default_driver = :firefox
  config.javascript_driver = :poltergeist
  Capybara.app_host = "https://member-portal.qa.meaningfulplatform.co.uk/"

  config.run_server = false
  config.default_selector = :css
  config.default_max_wait_time = 5

  #capybara 2.1 config options
  config.match = :prefer_exact
  config.ignore_hidden_elements = false

end

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new( app, :browser => :firefox, :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.firefox(:marionette => false))
end

Capybara.register_driver :chrome do |app|
  # optional
  client = Selenium::WebDriver::Remote::Http::Default.new
  # optional
  client.timeout = 120
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :http_client => client)
end

