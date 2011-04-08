require "selenium-webdriver"
require "test/unit/assertions"
include Test::Unit::Assertions

describe "Report" do
  attr_reader :driver

  it "Generates a clean report when needed" do
    @driver = Selenium::WebDriver.for :firefox
    @driver.navigate.to "http://google.com"
    element = @driver.find_element(:name, 'q')
    element.send_keys "Hello Web@driver!"
    element.submit
    puts @driver.title
  end

  it "Generates a clean report when needed" do
    @driver = Selenium::WebDriver.for :firefox
    @driver.navigate.to "http://google.com"
    element = @driver.find_element(:name, 'q')
    assert false
    element.send_keys "Hello Web@driver!"
    element.submit
    puts @driver.title
  end
end
