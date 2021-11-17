require 'rails_helper'

describe WeatherService, :vcr do
  let!(:lat_lng) { { lat: 43.659218, lng: -70.256519 } }

  it 'returns weather forecast data' do
    forecast = WeatherService.forecast(lat_lng, 'imperial')

    expect(forecast).to be_a(Hash)
    expect(forecast[:current]).to be_a(Hash)
    expect(forecast[:current][:dt]).to be_a(Integer)
    expect(forecast[:current][:sunrise]).to be_a(Integer)
    expect(forecast[:current][:sunset]).to be_a(Integer)
    expect(forecast[:current][:temp]).to be_a(Float)
    expect(forecast[:current][:feels_like]).to be_a(Float)
    expect(forecast[:current][:humidity]).to be_an(Integer)
    expect(forecast[:current][:uvi]).to be_an(Integer).or be_a(Float)
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
end
