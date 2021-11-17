require 'rails_helper'

describe Forecast do
  it 'has attributes' do
    forecast = Forecast.new(weather_data)

    expect(forecast).to be_a(Forecast)
    expect(forecast.id).to be(nil)
    expect(forecast.current_weather).to eq(
      {
        datetime: '2021-11-13 18:55:15 -0700',
        sunrise: '2021-11-13 04:32:55 -0700',
        sunset: '2021-11-13 14:17:58 -0700',
        temperature: 45.91,
        feels_like: 42.94,
        humidity: 92,
        uvi: 0,
        visibility: 6437,
        conditions: 'mist',
        icon: '50n'
      }
    )
    expect(forecast.daily_weather).to eq(
      [
        { date: '2021-11-13', sunrise: '2021-11-13 04:32:55 -0700', sunset: '2021-11-13 14:17:58 -0700',
          max_temp: 54.55, min_temp: 45.3, conditions: 'moderate rain', icon: '10d' },
        { date: '2021-11-14', sunrise: '2021-11-14 04:34:14 -0700', sunset: '2021-11-14 14:16:59 -0700',
          max_temp: 48.16, min_temp: 39.43, conditions: 'clear sky', icon: '01d' },
        { date: '2021-11-15', sunrise: '2021-11-15 04:35:32 -0700', sunset: '2021-11-15 14:16:02 -0700',
          max_temp: 46.98, min_temp: 38.16, conditions: 'light rain', icon: '10d' },
        { date: '2021-11-16', sunrise: '2021-11-16 04:36:51 -0700', sunset: '2021-11-16 14:15:07 -0700',
          max_temp: 43.59, min_temp: 32.41, conditions: 'clear sky', icon: '01d' },
        { date: '2021-11-17', sunrise: '2021-11-17 04:38:08 -0700', sunset: '2021-11-17 14:14:14 -0700',
          max_temp: 42.03, min_temp: 31.14, conditions: 'light rain', icon: '10d' }
      ]
    )
    expect(forecast.hourly_weather).to eq(
      [
        { time: '18:00:00', temperature: 46.89, conditions: 'moderate rain', icon: '10n' },
        { time: '19:00:00', temperature: 45.91, conditions: 'overcast clouds', icon: '04n' },
        { time: '20:00:00', temperature: 46.11, conditions: 'overcast clouds', icon: '04n' },
        { time: '21:00:00', temperature: 45.3, conditions: 'broken clouds', icon: '04n' },
        { time: '22:00:00', temperature: 43.74, conditions: 'broken clouds', icon: '04n' },
        { time: '23:00:00', temperature: 42.57, conditions: 'broken clouds', icon: '04n' },
        { time: '00:00:00', temperature: 41.13, conditions: 'clear sky', icon: '01n' },
        { time: '01:00:00', temperature: 40.57, conditions: 'clear sky', icon: '01n' }
      ]
    )
  end
end
