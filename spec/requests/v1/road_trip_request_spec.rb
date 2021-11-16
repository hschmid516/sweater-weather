require 'rails_helper'

describe 'road trip API', :vcr do
  let!(:user) { create(:user) }

  it 'posts a road trip' do
    trip_params = {
      origin: "Denver,CO",
      destination: "Pueblo,CO",
      api_key: user.api_key
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
    post "/api/v1/road_trips?origin=Denver,CO&destination=Pueblo,CO&api_key=#{user.api_key}"

    expect(response).to have_http_status(:bad_request)
    expect(json).to eq({ message: 'Email and password must be sent as JSON payload in body' })
  end

  it 'returns impossible if bad route' do
    trip_params = {
      origin: "Denver,CO",
      destination: "London,UK",
      api_key: user.api_key
    }
    post '/api/v1/road_trips', params: trip_params, as: :json

    expect(response).to be_successful
    expect(json).to be_a(Hash)
    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:id]).to be nil
    expect(json[:data][:type]).to eq('road_trip')
    expect(json[:data][:attributes][:travel_time]).to eq('impossible route')
    expect(json[:data][:attributes][:weather_at_eta]).to eq(nil)
  end

  it 'returns 401 error if api key is missing' do
    trip_params = {
      origin: "Denver,CO",
      destination: "Pueblo,CO",
    }

    post '/api/v1/road_trips', params: trip_params, as: :json

    expect(response).to have_http_status(:unauthorized)
    expect(json).to eq({ message: 'Credentials are missing or incorrect' })
  end

  it 'returns 401 error if api key is incorrect' do
    trip_params = {
      origin: "Denver,CO",
      destination: "Pueblo,CO",
      api_key: "qwertyuiop"
    }

    post '/api/v1/road_trips', params: trip_params, as: :json

    expect(response).to have_http_status(:unauthorized)
    expect(json).to eq({ message: 'Credentials are missing or incorrect' })
  end
end
