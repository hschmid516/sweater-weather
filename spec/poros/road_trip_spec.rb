require 'rails_helper'

describe RoadTrip do
  it 'has attributes' do
    weather = TripForecast.new(weather_data1, eta_data1)
    forecast = RoadTrip.new('Denver,CO', 'Pueblo,CO', travel_time_data, weather)

    expect(forecast).to be_a(RoadTrip)
    expect(forecast.id).to be(nil)
    expect(forecast.start_city).to eq('Denver, CO')
    expect(forecast.end_city).to eq('Pueblo, CO')
    expect(forecast.travel_time).to eq('01:49')
    expect(forecast.weather_at_eta).to eq({ temperature: 72.84, conditions: 'scattered clouds' })
  end
end
