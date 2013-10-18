require 'httparty'
require 'uri'
require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'sinatra/twitter-bootstrap'
require 'chronic'
require 'kronic'

if development?
  require 'pry'
  require "sinatra/reloader"
end

Dir[File.dirname(__FILE__) + "/application/**/*.rb"].each do |file|
  require file
end


register Sinatra::Twitter::Bootstrap::Assets
