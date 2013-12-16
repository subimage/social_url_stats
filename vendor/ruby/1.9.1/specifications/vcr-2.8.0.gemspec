# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "vcr"
  s.version = "2.8.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.5") if s.respond_to? :required_rubygems_version=
  s.authors = ["Myron Marston"]
  s.date = "2013-11-24"
  s.description = "VCR provides a simple API to record and replay your test suite's HTTP interactions.  It works with a variety of HTTP client libraries, HTTP stubbing libraries and testing frameworks."
  s.email = "myron.marston@gmail.com"
  s.homepage = "https://github.com/vcr/vcr"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = "2.0.3"
  s.summary = "Record your test suite's HTTP interactions and replay them during future test runs for fast, deterministic, accurate tests."
end
