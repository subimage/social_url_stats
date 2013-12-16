# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "watchr"
  s.version = "0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["mynyml"]
  s.date = "2010-08-23"
  s.description = "Modern continious testing (flexible alternative to autotest)."
  s.email = "mynyml@gmail.com"
  s.executables = ["watchr"]
  s.files = ["bin/watchr"]
  s.homepage = "http://mynyml.com/ruby/flexible-continuous-testing"
  s.require_paths = ["lib"]
  s.rubyforge_project = "watchr"
  s.rubygems_version = "2.0.3"
  s.summary = "Modern continious testing (flexible alternative to autotest)"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<every>, [">= 0"])
    else
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<every>, [">= 0"])
    end
  else
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<every>, [">= 0"])
  end
end
