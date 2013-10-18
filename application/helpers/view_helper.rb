def date(date)
  Kronic.format(Chronic.parse(date))
end

def gmap(hotel)
  "http://maps.google.com/maps/api/staticmap?size=100x100&sensor=false&zoom=16&markers=#{hotel.latitude}%2C#{hotel.longitude}"

end

def deal_link(hotel)
  deal = 'Click here to Book'
  deal = hotel.promotionDescription if hotel.promotionDescription.length > 0
  deal
end

def float_to_dollar(price)
  a = price.to_s.split('.')
  a[1]=a[1]+'0' if a[1].length <2
  '$'+a.join('.')
end

