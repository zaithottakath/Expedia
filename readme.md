#Expedia Code Challenge

##To get it up and running

1. Install Ruby 1.9.3 https://www.ruby-lang.org/en/downloads/
2. Execute: ```sudo gem install bundler```
3. Clone this git repository
4. In the root directory of this project execute ```bundle install``` capybara-webkit may need some dependencies. Instructions for getting capybara-webkit working: https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit
5. Execute: ```rackup -p 4567``` and visit ```localhost:4567``` to interact with application.
6. Execute ```rake spec``` or ```rake acceptance``` for tests.


##Thoughts about application.
I am most familiar with making Rails applications but I ran into problems with making a Rails app with no database. I decided to venture out into a database-less app made with Sinatra.

The application is simple. It calls the Expedia API and parses the JSON into an array of hashes with HTTParty. I then convert the hashes into OpenStructs to make calling keys within the hashes a bit easier to type.

The search result page is simple. I'm not very familiar with JavaScript so I used Twitter Bootstrap to add some styling and transitions. All the search results are ordered by star ranking. Assuming the user put in what the maximum amount they are willing to spend, the best hotel within their price range will be their first result. I used accordion style results to keep the user from being overloaded with information when they have 30+ results. I restricted initial information to only hotel, picture of hotel, star rating, price, and discounts (if any).

A couple issues with my application that I noticed. My acceptance tests could be better but I ran into issues with capybara not finding the haml files. I was forced to move the acceptance test from the spec folder to the root directory to get the test to pass. Additionally, the date picker on the root page does not restrict the "to" (date field) to only future dates.

