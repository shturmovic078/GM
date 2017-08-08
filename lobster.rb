require 'rubygems'
require 'watir'

include Selenium

caps = WebDriver::Remote::Capabilities.new
caps['browser'] = 'IE'
caps['browser_version'] = '10.0'
caps['os'] = 'Windows'
caps['os_version'] = '7'
caps['resolution'] = '1024x768'
caps["browserstack.debug"] = "true"

browser = Watir::Browser.new(:remote,
  :url => "http://zaqwsx1:zqybk75kc8SQJmSXFKvg@hub-cloud.browserstack.com/wd/hub",
  :desired_capabilities => caps)

browser.goto "http://www.redlobster.com"
sleep 5
puts browser.alert

def ok
  dialog.button(:value => "Allow Once").click
  wait_until_not_exists
  sleep 5
end

puts browser.title

sleep 5
browser.refresh
browser.quit