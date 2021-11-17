class TripForecast
  attr_reader :forecast

  def initialize(data, eta)
    @forecast = get_forecast(data[:hourly], eta)
  end

  def get_forecast(data, eta)
    data.each_with_object({}) do |hour, acc|
      if hour[:dt] == eta
        acc[:temperature] = hour[:temp]
        acc[:conditions] = hour[:weather].first[:description]
      end
    end
  end
end
