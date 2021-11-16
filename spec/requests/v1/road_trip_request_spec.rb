require 'rails_helper'

describe 'road trip API', :vcr do
  # before :each do
  #   post '/api/v1/road_trip'
  # end

  it 'posts a road trip' do
    trip_params = {
      origin: "Denver,CO",
      destination: "Pueblo,CO",
      api_key: "K7HY4Q5swYoN8NnLCMUCuq2T"
    }
    post '/api/v1/road_trips', params: trip_params, as: :json

    expect(response).to be_successful
    expect(json).to be_a(Hash)
    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:id]).to be nil
    expect(json[:data][:type]).to eq('road_trip')

    attr = json[:data][:attributes]
    expect(attr).to be_a(Hash)
    expect(attr[:start_city]).to be_a(String)
    expect(attr[:end_city]).to be_a(String)
    expect(attr[:travel_time]).to be_a(String)
    expect(attr[:weather_at_eta]).to be_a(Hash)
    expect(attr[:weather_at_eta][:temperature]).to be_a(Float)
    expect(attr[:weather_at_eta][:conditions]).to be_a(String)

    expect(attr).to_not have_key(:route)
    expect(attr).to_not have_key(:info)
    expect(attr).to_not have_key(:created_at)
    expect(attr).to_not have_key(:updated_at)
  end

  it 'cant call endpoint with params in URL' do
    post "/api/v1/road_trips?origin=Denver,CO&destination=Pueblo,CO&api_keyK7HY4Q5swYoN8NnLCMUCuq2T"

    expect(response).to have_http_status(:bad_request)
    expect(json).to eq({ message: 'Email and password must be sent as JSON payload in body' })
  end
end
