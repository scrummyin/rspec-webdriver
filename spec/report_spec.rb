#require "nokogiri"
require "rspec/core/rake_task"

describe "Report" do
  it "Generates a clean report when needed" do
    RSpec::Core::RakeTask.new(:test_for_specs) do |t|
      t.pattern = File.expand_path(File.dirname(__FILE__) + "/example_run.rb")
      t.rspec_opts = "--require 'lib/rspec/reporting/selenium_test_report_formatter' "
      t.rspec_opts << "--require 'lib/rspec/spec_helper' "
      t.rspec_opts << "--format SeleniumTestReportFormatter "
      t.rspec_opts << "-o ./spec_test_report.html "
      t.verbose = false
    end
    Rake::Task[:test_for_specs].invoke rescue nil
    out = File.read(File.expand_path(File.dirname(__FILE__) + "/../spec_test_report.html")).to_s
    out.gsub! /\d+\.\d+ seconds/, 'x seconds'
    out.match /example_([a-z0-9]+)_snapshot/ 
    reporting_uid = $1
    2.times{out.gsub! reporting_uid.to_s, "ZASDF"}
    expected =  File.read(File.expand_path(File.dirname(__FILE__) + "/spec_results_for_comparison.html")).to_s
    STDOUT.puts "The reporteding_uid was #{reporting_uid}"
    out.should == expected
  end
end
