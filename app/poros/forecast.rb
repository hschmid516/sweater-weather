class Forecast
  attr_reader :id, :current_weather, :daily_weather, :hourly_weather

  def initialize(data)
    @id = nil
    @current_weather = current(data[:current])
    @daily_weather = daily(data[:daily][0..4])
    @hourly_weather = hourly(data[:hourly][0..7])
  end

  def current(data)
    {
      datetime: Time.at(data[:dt]),
      sunrise: Time.at(data[:sunrise]),
      sunset: Time.at(data[:sunset]),
      temperature: data[:temp],
      feels_like: data[:feels_like],
      humidity: data[:humidity],
      uvi: data[:uvi],
      visibility: data[:visibility],
      conditions: data[:weather].first[:description],
      icon: data[:weather].first[:icon]
    }
  end

  def daily(data)
    data.map do |day|
      {
        date: Time.at(day[:dt]).strftime('%F'),
        sunrise: Time.at(day[:sunrise]),
        sunset: Time.at(day[:sunset]),
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather].first[:description],
        icon: day[:weather].first[:icon]
      }
    end
  end

  def hourly(data)
    data.map do |day|
      {
        time: Time.at(day[:dt]).strftime('%T'),
        temperature: day[:temp],
        conditions: day[:weather].first[:description],
        icon: day[:weather].first[:icon]
      }
    end
  end
end
