require 'rails_helper'

describe TripForecast do
  it 'has attributes' do
    forecast = TripForecast.new(weather_data1, eta_data1)
    expect(forecast).to be_a(TripForecast)
    expect(forecast.forecast).to eq(
      {
        conditions: 'scattered clouds',
        temperature: 72.84
      }
    )
  end
end
