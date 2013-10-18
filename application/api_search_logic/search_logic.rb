require 'ostruct'

class Search
  include HTTParty

  base_uri 'http://deals.expedia.com/beta/deals/hotels.json'
  default_timeout 20

  def self.multi_search(params)
    query = '?'
    params.each do |key, value|
      if key == 'checkInDate' || key == 'checkOutDate'
        value = URI.unescape(value)
        value = value.split('/')
        value = value.rotate(-1).join('-')
      end
      value = URI.escape(value)
      query += "#{key}=#{value}&" if value.length >0
    end
    query = query[0..-2]

    # map hash elements to an Ostruct in order to call things like
    # hotel.name, then sort them by star rating
    begin
      hotels = get(query).map! {|hash|  OpenStruct.new(hash)}
    rescue
      return hotels = nil
    end

    hotels.sort!{|x,y| x.starRating <=> y.starRating}.reverse!
  end

end
