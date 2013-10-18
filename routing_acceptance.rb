require_relative 'spec/acceptance_helper'

describe Sinatra::Application.new do

  before do
    VCR.insert_cassette 'responses', record: :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  it "shows a site" do
    visit '/'
    page.must_have_content 'City'

    fill_in 'city', :with =>'San Francisco'
    click_button 'Submit'

    page.must_have_content 'San Francisco'
  end


end
