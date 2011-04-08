require 'rubygems'
require 'rspec/core'
require 'base64'
require 'fileutils'
require File.expand_path(File.dirname(__FILE__) + "/rspec_extensions")
require File.expand_path(File.dirname(__FILE__) + "/reporting/selenium_test_report_formatter")

RSpec.configure do |config|

  config.after(:each) do 
    if actual_failure? 
      SeleniumTestReportFormatter.capture_system_state(@driver, self.example)
    end
    @driver.quit
  end

end

