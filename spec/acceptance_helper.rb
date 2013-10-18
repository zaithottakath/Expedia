require_relative 'spec_helper'

#headless browers for verifying site functionality
require 'capybara'
require 'capybara/dsl'
require 'capybara/webkit'
require 'capybara_minitest_spec'



Capybara.app = Sinatra::Application.new
Capybara.default_driver = :webkit

class MiniTest::Spec
  include Capybara::DSL
end

#class Capybara::Session
#  def params
#    Hash[*URI.parse(current_url).query.split(/\?|=|&/)]
#  end
#end
