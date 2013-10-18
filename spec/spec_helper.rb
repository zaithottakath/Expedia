require_relative 'helper'

#for recording API requests
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/expedia_cassettes'
  c.hook_into :webmock
  c.ignore_localhost = true
end
