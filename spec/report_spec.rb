require "rubygems"
require "rspec/core/rake_task"

describe "Report" do
  it "Generates a clean report when needed" do
    RSpec::Core::RakeTask.new(:test_for_specs) do |t|
      t.pattern = File.expand_path(File.dirname(__FILE__) + "/example_run.rb")
      t.rspec_opts = "--require 'lib/rspec/reporting/selenium_test_report_formatter' "
      t.rspec_opts << "--require 'lib/rspec/spec_helper' "
      t.rspec_opts << "--format SeleniumTestReportFormatter "
      t.rspec_opts << "-o ./spec_tests_report.html "
      t.verbose = false
    end
    Rake::Task[:test_for_specs].invoke
  end
end
