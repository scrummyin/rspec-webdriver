require "rubygems"
require "selenium-webdriver"

describe "Report" do

  it "Generates a clean report when needed" do
    driver = Selenium::WebDriver.for :firefox
    driver.navigate.to "http://google.com"
    element = driver.find_element(:name, 'q')
    element.send_keys "Hello WebDriver!"
    element.submit
    puts driver.title
    driver.quit
  end
end
