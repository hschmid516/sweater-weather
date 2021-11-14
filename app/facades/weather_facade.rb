class WeatherFacade
  class << self
    def forecast(location)
      location_info = WeatherService.find_lat_long(location)
      lat_long = location_info[:results].first[:locations].first[:latLng]
      forecast = WeatherService.forecast(lat_long)
      Forecast.new(forecast)
    end
  end
end
