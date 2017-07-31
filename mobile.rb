require 'rubygems'
require 'watir-webdriver'

include Selenium

caps = WebDriver::Remote::Capabilities.new
caps['device'] = 'iPhone 7'
caps['realMobile'] = 'true'
caps['os_version'] = '10.0'
caps[:browser_version] = "20"
caps["browserstack.debug"] = "true"

browser = Watir::Browser.new(:remote,
  :url => "http://zaqwsx1:zqybk75kc8SQJmSXFKvg@hub-cloud.browserstack.com/wd/hub",
  :desired_capabilities => caps)

browser.goto "http://www.google.com"


puts browser.title
browser.quit