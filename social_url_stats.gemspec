# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'social_url_stats/version'

Gem::Specification.new do |spec|
  spec.name          = "social_url_stats"
  spec.version       = SocialUrlStats::VERSION
  spec.authors       = ["Seth Banks"]
  spec.email         = ["stb@subimage.com"]
  spec.description   = "Give this ruby gem a URL, it will give you back how many times it's been shared / liked across various social networks."
  spec.summary       = "Gathers URL share count #'s from social networks"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
