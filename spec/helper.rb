require_relative "../application.rb"

require 'bundler'

Sinatra::Application.environment = :test

Bundler.setup
Bundler.require :default, Sinatra::Application.environment


require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require 'rack/test'

class MiniTest::Spec
  include Rack::Test::Methods
end
