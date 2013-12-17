require 'rubygems'
require 'bundler/setup'

require 'social_url_stats'
require 'minitest/autorun'
require 'minitest/pride'
require 'vcr'
require 'mocha/setup'
require 'webmock'

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :webmock
end