require 'rails_helper'

describe ForecastSerializer do
  let!(:forecast) { Forecast.new(weather_data) }

  it 'should have attributes' do
    serializer = ForecastSerializer.new(forecast).serializable_hash
    expect(serializer).to have_key(:data)
    expect(serializer[:data]).to have_key(:id)
    expect(serializer[:data]).to have_key(:type)
    expect(serializer[:data]).to have_key(:attributes)
    expect(serializer[:data][:attributes]).to have_key(:current_weather)
    expect(serializer[:data][:attributes]).to have_key(:daily_weather)
    expect(serializer[:data][:attributes]).to have_key(:hourly_weather)
  end
end
