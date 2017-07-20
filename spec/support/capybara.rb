# frozen_string_literal: true

require 'capybara/rspec'
require 'selenium/webdriver'

Capybara.register_driver :headless_chrome do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    args: %w[headless disable-gpu]
  )
end

Capybara.javascript_driver = :headless_chrome
