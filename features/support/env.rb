# frozen_string_literal: true

require 'dotenv/load'
require 'capybara/cucumber'
require 'require_all'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'site_prism'
require 'pry'

require_all 'page_objects/sections'
require_all 'page_objects/pages'
require_all 'models'

def options
  Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000 --headless])
end

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

# Before do
#   # setting Capybara driver to maximize window for Firefox
#   Capybara.page.driver.browser.manage.window.maximize
# end

After do |scenario|
  if scenario.failed?
    screen_path = "artifatcs/screenshots/#{scenario.name}_#{Time.now.strftime('%Y-%m-%d_%H:%M:%S')}.png"
    page.save_screenshot(screen_path)
  end
  Capybara.reset_session!
end
