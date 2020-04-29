# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'pry'
require 'report_builder'
require 'site_prism'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'http://localhost:3000'
  Capybara.page.driver.browser.manage.window.maximize
end
