# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mynyml-redgreen"
  s.version = "0.7.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Martin Aumont"]
  s.date = "2009-11-29"
  s.description = "Standalone redgreen eye candy for test results, ala autotest."
  s.email = "mynyml@gmail.com"
  s.homepage = "http://mynyml.com"
  s.require_paths = ["lib"]
  s.rubyforge_project = "mynyml-redgreen"
  s.rubygems_version = "2.0.3"
  s.summary = "Standalone redgreen eye candy for test results, ala autotest"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<term-ansicolor>, [">= 1.0.4"])
      s.add_development_dependency(%q<nanotest>, [">= 0.9.2"])
      s.add_development_dependency(%q<minitest>, [">= 1.3.1"])
      s.add_development_dependency(%q<shoulda>, [">= 2.10.1"])
      s.add_development_dependency(%q<contest>, [">= 0.1.1"])
      s.add_development_dependency(%q<jeremymcanally-context>, [">= 0.5.5"])
    else
      s.add_dependency(%q<term-ansicolor>, [">= 1.0.4"])
      s.add_dependency(%q<nanotest>, [">= 0.9.2"])
      s.add_dependency(%q<minitest>, [">= 1.3.1"])
      s.add_dependency(%q<shoulda>, [">= 2.10.1"])
      s.add_dependency(%q<contest>, [">= 0.1.1"])
      s.add_dependency(%q<jeremymcanally-context>, [">= 0.5.5"])
    end
  else
    s.add_dependency(%q<term-ansicolor>, [">= 1.0.4"])
    s.add_dependency(%q<nanotest>, [">= 0.9.2"])
    s.add_dependency(%q<minitest>, [">= 1.3.1"])
    s.add_dependency(%q<shoulda>, [">= 2.10.1"])
    s.add_dependency(%q<contest>, [">= 0.1.1"])
    s.add_dependency(%q<jeremymcanally-context>, [">= 0.5.5"])
  end
end
