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
  "Oops. Looks like we couldn't handle your request. Press back and try again"
end

get '/invalid_search' do
  'Oops. Your search needs tweaking. Press back and try again.'
end
