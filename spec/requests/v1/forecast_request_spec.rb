require 'rails_helper'

describe 'forecast API', :vcr do
  it 'gets forecasts' do
    get '/api/v1/forecast?location=portland,me'

    expect(response).to be_successful
    expect(json).to be_a(Hash)
    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:id]).to be nil
    expect(json[:data][:type]).to eq('forecast')

    attr = json[:data][:attributes]
    expect(attr).to be_a(Hash)
    expect(attr[:current_weather]).to be_a(Hash)
    expect(attr[:current_weather][:datetime]).to be_a(String)
    expect(attr[:current_weather][:datetime].length).to eq(29)
    expect(attr[:current_weather][:sunrise]).to be_a(String)
    expect(attr[:current_weather][:sunrise].length).to eq(29)
    expect(attr[:current_weather][:sunset]).to be_a(String)
    expect(attr[:current_weather][:sunset].length).to eq(29)
    expect(attr[:current_weather][:temperature]).to be_a(Float)
    expect(attr[:current_weather][:feels_like]).to be_a(Float)
    expect(attr[:current_weather][:humidity]).to be_an(Integer)
    expect(attr[:current_weather][:uvi]).to be_an(Integer).or be_a(Float)
    expect(attr[:current_weather][:visibility]).to be_an(Integer)
    expect(attr[:current_weather][:conditions]).to be_a(String)
    expect(attr[:current_weather][:icon]).to be_a(String)
    expect(attr[:current_weather]).to_not have_key(:pressure)
    expect(attr[:current_weather]).to_not have_key(:dew_point)
    expect(attr[:current_weather]).to_not have_key(:clouds)
    expect(attr[:current_weather]).to_not have_key(:wind_speed)
    expect(attr[:current_weather]).to_not have_key(:wind_deg)
    expect(attr[:current_weather]).to_not have_key(:wind_gust)
    expect(attr[:current_weather]).to_not have_key(:weather)
    expect(attr[:current_weather]).to_not have_key(:rain)

    expect(attr[:daily_weather]).to be_an(Array)
    expect(attr[:daily_weather].size).to eq(5)

    attr[:daily_weather].each do |day|
      expect(day[:date]).to be_a(String)
      expect(day[:date].length).to eq(10)
      expect(day[:sunrise]).to be_a(String)
      expect(day[:sunrise].length).to eq(29)
      expect(day[:sunset]).to be_a(String)
      expect(day[:sunset].length).to eq(29)
      expect(day[:max_temp]).to be_a(Float).or be_an(Integer)
      expect(day[:min_temp]).to be_a(Float).or be_an(Integer)
      expect(day[:conditions]).to be_a(String)
      expect(day[:icon]).to be_a(String)
      expect(day).to_not have_key(:moonrise)
      expect(day).to_not have_key(:moonset)
      expect(day).to_not have_key(:moon_phase)
      expect(day).to_not have_key(:temp)
      expect(day).to_not have_key(:feels_like)
      expect(day).to_not have_key(:pressure)
      expect(day).to_not have_key(:humidity)
      expect(day).to_not have_key(:dew_point)
      expect(day).to_not have_key(:wind_speed)
      expect(day).to_not have_key(:wind_deg)
      expect(day).to_not have_key(:wind_gust)
      expect(day).to_not have_key(:weather)
      expect(day).to_not have_key(:clouds)
      expect(day).to_not have_key(:pop)
      expect(day).to_not have_key(:rain)
      expect(day).to_not have_key(:uvi)
    end

    expect(attr[:hourly_weather]).to be_an(Array)
    expect(attr[:hourly_weather].size).to eq(8)

    attr[:hourly_weather].each do |hour|
      expect(hour[:time]).to be_a(String)
      expect(hour[:time].length).to eq(8)
      expect(hour[:temperature]).to be_a(Float)
      expect(hour[:conditions]).to be_a(String)
      expect(hour[:icon]).to be_a(String)
      expect(hour).to_not have_key(:feels_like)
      expect(hour).to_not have_key(:pressure)
      expect(hour).to_not have_key(:humidity)
      expect(hour).to_not have_key(:dew_point)
      expect(hour).to_not have_key(:uvi)
      expect(hour).to_not have_key(:clouds)
      expect(hour).to_not have_key(:visibility)
      expect(hour).to_not have_key(:wind_speed)
      expect(hour).to_not have_key(:wind_deg)
      expect(hour).to_not have_key(:wind_gust)
      expect(hour).to_not have_key(:weather)
      expect(hour).to_not have_key(:pop)
      expect(hour).to_not have_key(:rain)
    end

    expect(attr).to_not have_key(:created_at)
    expect(attr).to_not have_key(:updated_at)
  end

  it 'returns 400 error and message if params missing' do
    get '/api/v1/forecast'

    expect(response).to have_http_status(:bad_request)
    expect(json).to eq({ message: 'Location is missing or empty' })
  end

  it 'returns 400 error and message if params empty' do
    get '/api/v1/forecast?location='

    expect(response).to have_http_status(:bad_request)
    expect(json).to eq({ message: 'Location is missing or empty' })
  end
end
