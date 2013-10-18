get '/' do
  haml :index
end

get '/search' do
    @hotels = Search.multi_search(params)

    redirect to('/timeout') if !@hotels
    redirect to('/invalid_search') if @hotels.empty?
  haml :search
end

get '/timeout' do
  haml :timeout
end

get '/invalid_search' do
  haml :invalid_search
end

not_found do
  haml :'404'
end

error do
  haml :'500'
end
