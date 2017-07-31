require 'selenium-webdriver'
require 'eyes_selenium'
require 'rubygems'


class HelloWorld

  capabilities = {
          platformName:     'Android',
          platformVersion:  'PLATFORM_VERSION',
          browserName:       'BROWSER_NAME',
          deviceName:       'DEVICE_NAME',
  }

  # Open browser.
  wd = Selenium::WebDriver.for :remote,
                               :url => 'http://127.0.0.1:4723/wd/hub',
                               :desired_capabilities => capabilities

  # Initialize the eyes SDK and set your private API key.
  eyes = Applitools::Selenium::Eyes.new
  eyes.api_key = 'YOUR_API_KEY'

  # Navigate the browser to the "hello world!" web-site.
  wd.navigate.to('https://applitools.com/helloworld')

  begin

    # Start the test.
    eyes.test(app_name: 'hello world!', test_name: 'My first Appium web Ruby test!', driver: wd) do |driver|

      # Visual checkpoint #1.
      eyes.check_window('Hello!')

      # Click the "Click me!" button.
      driver.find_element(:tag_name => 'button').click

      # Visual checkpoint #2.
      eyes.check_window('Click!')

      # End the test.
      eyes.close

    end

  ensure

    # Close the browser.
    wd.quit

    # If the test was aborted before eyes.close was called, ends the test as aborted.
    eyes.abort_if_not_closed

  end

end