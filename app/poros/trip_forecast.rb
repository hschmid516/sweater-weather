class TripForecast
  attr_reader :forecast

  def initialize(data, eta)
    @forecast = get_forecast(data[:hourly], eta)
  end

  def get_forecast(data, eta)
    data.filter_map do |hour|
      if hour[:dt] == eta
        { temperature: hour[:temp],
          conditions: hour[:weather].first[:description] }
      end
    end
  end
end
