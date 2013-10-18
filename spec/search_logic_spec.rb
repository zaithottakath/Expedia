require_relative 'spec_helper'
require 'rack/utils'

describe Search do
  describe "defaults for search" do

    it "must have httparty" do
      Search.must_include HTTParty
    end

    it "must have the base Expedia undocumented API endpoint" do
     Search.base_uri.must_equal 'http://deals.expedia.com/beta/deals/hotels.json'
    end

    it "must timeout after 20 seconds" do
      Search.default_options[:timeout].must_equal 20
    end
  end

  describe "should have multi_search" do
    it "must have multi_search" do
      Search.must_respond_to :multi_search
    end
  end

  describe "GET requests" do
    query = 'city=Seattle&streetAddress=1100+17th+ave&maxPricePerNight=200&minStarRating=3&checkInDate=10%2F24%2F2013&checkOutDate=10%2F26%2F2013'
    params = Rack::Utils.parse_nested_query(query)
    before do
      VCR.insert_cassette 'responses', record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it "records the fixture for SF" do
      Search.get('?city=Seattle')
    end

    it "records the fixture for Multi search in Seattle while parsing params" do
      Search.multi_search(params)
    end

    it "returns an Array" do
      Search.multi_search(params).must_be_kind_of Array
      Search.multi_search(params).must_be_instance_of Array
    end

    it "convers hotel hashes into OpenStruct" do
      Search.multi_search(params).each do |hotel|
        hotel.must_be_kind_of OpenStruct
      end
    end

    it "Search results responds to names" do
        Search.multi_search(params).each do |hotel|
        hotel.must_respond_to :name
      end
    end

  end
end

describe "Helpers" do
  it "float_to_dollar must convert floats to dollar strings" do
    float_to_dollar(11.11).must_equal '$11.11'
  end

  it "float to dollar must add trailer zeros if necessary" do
    float_to_dollar(10.0).must_equal '$10.00'
  end
end
