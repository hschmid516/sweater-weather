require 'rails_helper'

describe WeatherFacade, :vcr do
  it 'gets forcast for city' do
    forecast = WeatherFacade.forecast(Forecast, 'Portland, ME')

    expect(forecast).to be_a(Forecast)
    expect(forecast.id).to be(nil)
    expect(forecast.current_weather).to be_a(Hash)
    expect(forecast.current_weather.size).to eq(10)
    expect(forecast.daily_weather).to be_an(Array)
    expect(forecast.daily_weather.size).to eq(5)
    expect(forecast.daily_weather.first.size).to eq(7)
    expect(forecast.hourly_weather).to be_an(Array)
    expect(forecast.hourly_weather.size).to eq(8)
    expect(forecast.hourly_weather.first.size).to eq(4)
  end
end
