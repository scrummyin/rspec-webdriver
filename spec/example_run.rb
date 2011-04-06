require "rubygems"
require "selenium-webdriver"
require "test/unit/assertions"
require "lib/rspec/rspec_extensions"

describe "Report" do
  attr_reader :driver

  after(:each) do
    if actual_failure?
      SeleniumTestReportFormatter.capture_system_state(@driver, self.example)
    end
    @driver.quit
  end

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
