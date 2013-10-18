require './application'

set :environment, :development
set :run, false
set :raise_errors, true
project_path = Sinatra::Application.root

run Sinatra::Application
