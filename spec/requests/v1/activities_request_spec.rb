require 'rails_helper'

describe 'activities', :vcr do
  it 'gets weather and activities for a destination' do
    get '/api/v1/activities?destination=chicago,il'

    expect(response).to be_successful
    expect(json).to be_a(Hash)
    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:id]).to be(nil)
    expect(json[:data][:type]).to eq('activities')

    attr = json[:data][:attributes]

    expect(attr[:destination]).to eq('chicago,il')
    expect(attr[:forecast]).to be_a(Hash)
    expect(attr[:forecast][:summary]).to be_a(String)
    expect(attr[:forecast][:temperature]).to be_a(String)
    expect(attr[:activities]).to be_an(Array)
    expect(attr[:activities].length).to eq(2)

    attr[:activities].each do |activity|
      expect(activity[:title]).to be_a(String)
      expect(activity[:type]).to be_a(String)
      expect(activity[:participants]).to be_an(Integer)
      expect(activity[:price]).to be_an(Float)
    end

    expect(attr).to_not have_key(:created_at)
    expect(attr).to_not have_key(:updated_at)
  end
end
