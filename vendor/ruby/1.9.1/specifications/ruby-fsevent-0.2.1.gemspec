# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ruby-fsevent"
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sandro Turriate"]
  s.date = "2010-01-20"
  s.description = "\n    A native extension exposing the OS X FSEvent API. Register directories you want to watch and a callback will fire whenever a change occurs in the registered directories.\n    "
  s.email = "sandro.turriate@gmail.com"
  s.extensions = ["ext/extconf.rb", "ext/extconf.rb"]
  s.extra_rdoc_files = ["LICENSE", "README.md"]
  s.files = ["LICENSE", "README.md", "ext/extconf.rb"]
  s.homepage = "http://github.com/sandro/ruby-fsevent"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib", "ext"]
  s.rubygems_version = "2.0.3"
  s.summary = "A native extension exposing the OS X FSEvent API."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["= 1.2.9"])
    else
      s.add_dependency(%q<rspec>, ["= 1.2.9"])
    end
  else
    s.add_dependency(%q<rspec>, ["= 1.2.9"])
  end
end
