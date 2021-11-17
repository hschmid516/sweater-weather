require 'rails_helper'

describe RoadTripSerializer do
  let!(:weather) { TripForecast.new(weather_data1, eta_data1) }
  let!(:trip) { RoadTrip.new('Denver,CO', 'Pueblo,CO', travel_time_data, weather) }

  it 'should have attributes' do
    serializer = RoadTripSerializer.new(trip).serializable_hash
    expect(serializer).to have_key(:data)
    expect(serializer[:data]).to have_key(:id)
    expect(serializer[:data]).to have_key(:type)
    expect(serializer[:data]).to have_key(:attributes)
    expect(serializer[:data][:attributes]).to have_key(:end_city)
    expect(serializer[:data][:attributes]).to have_key(:start_city)
    expect(serializer[:data][:attributes]).to have_key(:travel_time)
    expect(serializer[:data][:attributes]).to have_key(:weather_at_eta)
    expect(serializer[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(serializer[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
  end
end
