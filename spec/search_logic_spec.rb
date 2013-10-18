require_relative 'spec_helper'

describe Search do
  describe "defaults for search" do

    it "must have httparty" do
      Search.must_include HTTParty
    end

    it "must have the base Expedia undocumented API endpoint" do
     Search.base_uri.must_equal 'http://deals.expedia.com/beta/deals/hotels.json'
   end
  end

  describe "GET city" do
    before do
      VCR.insert_cassette 'responses', record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it "records the fixture for SF" do
      Search.get('?city=Seattle')
    end
  end
end
