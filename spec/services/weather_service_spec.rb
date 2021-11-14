require 'rails_helper'

describe WeatherService, :vcr do
  let!(:lat_lng) { { lat: 43.659218, lng: -70.256519 } }

  it 'returns weather forecast data' do
    forecast = WeatherService.forecast(lat_lng)

    expect(forecast).to be_a(Hash)
    expect(forecast[:current]).to be_a(Hash)
    expect(forecast[:current][:dt]).to be_a(Integer)
    expect(forecast[:current][:sunrise]).to be_a(Integer)
    expect(forecast[:current][:sunset]).to be_a(Integer)
    expect(forecast[:current][:temp]).to be_a(Float)
    expect(forecast[:current][:feels_like]).to be_a(Float)
    expect(forecast[:current][:humidity]).to be_an(Integer)
    expect(forecast[:current][:uvi]).to be_an(Integer)
    expect(forecast[:current][:weather].first[:description]).to be_an(String)
    expect(forecast[:current][:weather].first[:description]).to be_a(String)
    expect(forecast[:current][:weather].first[:icon]).to be_a(String)
    expect(forecast[:daily].first[:dt]).to be_an(Integer)
    expect(forecast[:daily].first[:sunrise]).to be_a(Integer)
    expect(forecast[:daily].first[:sunset]).to be_a(Integer)
    expect(forecast[:daily].first[:temp][:max]).to be_a(Float)
    expect(forecast[:daily].first[:temp][:min]).to be_a(Float)
    expect(forecast[:daily].first[:weather].first[:description]).to be_a(String)
    expect(forecast[:daily].first[:weather].first[:icon]).to be_a(String)
    expect(forecast[:hourly].first[:dt]).to be_a(Integer)
    expect(forecast[:hourly].first[:temp]).to be_a(Float)
    expect(forecast[:hourly].first[:weather].first[:description]).to be_a(String)
    expect(forecast[:hourly].first[:weather].first[:icon]).to be_a(String)
  end

  it 'returns lat long from location' do
    lat_long = WeatherService.find_lat_long('Portland, ME')

    expect(lat_long).to be_a(Hash)
    expect(lat_long.length).to eq(3)
    expect(lat_long[:results].first[:locations]).to be_an(Array)
    expect(lat_long[:results].first[:locations].length).to eq(1)
    expect(lat_long[:results].first[:locations].first[:latLng]).to eq(lat_lng)
  end
end
