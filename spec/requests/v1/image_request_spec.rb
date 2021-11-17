require 'rails_helper'

describe 'image API', :vcr do
  before :each do
    get '/api/v1/backgrounds?location=portland,me'
  end

  it 'gets a background image' do
    expect(response).to be_successful
    expect(json).to be_a(Hash)
    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:id]).to be nil
    expect(json[:data][:type]).to eq('image')

    attr = json[:data][:attributes]
    expect(attr).to be_a(Hash)
    expect(attr[:image]).to be_a(Hash)
    expect(attr[:image][:location]).to be_a(String)
    expect(attr[:image][:image_url]).to be_a(String)
    expect(attr[:image][:credit]).to be_a(Hash)
    expect(attr[:image][:credit][:source]).to eq('https://unsplash.com/')
    expect(attr[:image][:credit][:user]).to be_a(String)
    expect(attr[:image][:credit][:user_url]).to be_a(String)

    expect(attr).to_not have_key(:created_at)
    expect(attr).to_not have_key(:updated_at)
    expect(attr).to_not have_key(:promoted_at)
    expect(attr).to_not have_key(:width)
    expect(attr).to_not have_key(:height)
    expect(attr).to_not have_key(:color)
    expect(attr).to_not have_key(:blur_hash)
    expect(attr).to_not have_key(:description)
    expect(attr).to_not have_key(:alt_description)
    expect(attr).to_not have_key(:urls)
    expect(attr).to_not have_key(:links)
    expect(attr).to_not have_key(:categories)
    expect(attr).to_not have_key(:likes)
    expect(attr).to_not have_key(:liked_by_user)
    expect(attr).to_not have_key(:current_user_collections)
    expect(attr).to_not have_key(:sponsorship)
    expect(attr).to_not have_key(:topic_submissions)
    expect(attr).to_not have_key(:user)
    expect(attr).to_not have_key(:tags)
  end
end
