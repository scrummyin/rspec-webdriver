require "rubygems"
gem "rspec", ">=2.0"
require 'rspec/core'
require 'rspec/core/example'

#
# Monkey-patch RSpec Example Group so that we can track whether an
# example already failed or not in an after(:each) block
#
# Useful to only capture Selenium screenshots when a test fails  
#
# * Changed execution_error to be an instance variable (in lieu of 
#   a local variable).
#
# * Introduced an unique id (example_uid) that is the same for 
#   a real Example (passed in after(:each) when screenshot is 
#   taken) as well as the corresponding ExampleProxy 
#   (passed to the HTML formatter). This unique id gives us
#   a way to correlate file names between generation and 
#   reporting time.
#
module RSpec
  module Core
    class ExampleGroup


      def actual_failure?
        case example.exception
        when nil
          false
        when RSpec::Core::PendingExampleFixedError
             #RSpec::Example::ExamplePendingError, 
             #RSpec::Example::PendingExampleFixedError,
             #RSpec::Example::NoDescriptionError
          false
        else
          true
        end
      end
    end

    class Example

      attr_reader :exception

      def reporting_uid
        # backtrace is not reliable anymore using the implementation proc          
        Digest::MD5.hexdigest(metadata[:execution_result][:started_at].to_s+metadata[:full_description].to_s)
      end

      def pending_for_browsers(*browser_regexps, &block)
        actual_browser = selenium_driver.browser_string
        match_browser_regexps = browser_regexps.inject(false) do |match, regexp| 
          match ||= actual_browser =~ Regexp.new(regexp.source, Regexp::IGNORECASE)
        end
        if match_browser_regexps
          pending "#{actual_browser.gsub(/\*/, '').capitalize} does not support this feature yet"
        else 
          yield
        end
      end

    end

    class ExampleProxy

      def reporting_uid
        options[:actual_example].reporting_uid
      end

    end

  end
end

