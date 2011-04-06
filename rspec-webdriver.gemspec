# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "rspec-webdriver"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Brian Faherty"]
  s.email       = "anothergenericuser+ruby@gmail.com"
  s.summary     = "rspec-webdriver-0.0.1"
  s.description = "RSpec reporting for selenium-webdriver"

  s.rubygems_version   = "1.3.7"

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec,features}/*`.split("\n")
  #s.extra_rdoc_files = [ "README.md" ]
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"
end

