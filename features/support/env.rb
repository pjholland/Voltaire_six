
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'selenium-webdriver'

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
require 'capybara-webkit'

Capybara.configure do |config|
  config.default_driver = :webkit
  config.javascript_driver = :selenium
  config.run_server = false
  config.default_selector = :css
  config.default_wait_time = 5

  #capybara 2.1 config options
  config.match = :prefer_exact
  config.ignore_hidden_elements = false
end

Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile["browser.cache.disk.enable"] = false
  profile["browser.cache.memory.enable"] = false
  Capybara::Selenium::Driver.new(app, :browser => :firefox, profile: profile)
end