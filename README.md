#Rspec-Webdriver

Just some reporting if you are using rspec and webdriver

##Credit where credit is due

This is project is not much more than a port of the reporting from ph7's selenium-client.  I added updates for rspec 2.0 and selenium-webdriver.

##How to play

Name your webdriver @driver in your specs.  Do not close it at the end of your spec (the spec_helper will do that for you).  

    rspec --require 'rspec/reporting/selenium_test_report_formatter' --require 'rspec/spec_helper' --format 'SeleniumTestReportFormatter' -o './test_results.html' <your_spec.rb>

