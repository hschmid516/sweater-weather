class WeatherFacade
  class << self
    def forecast(object, location, units, eta = nil)
      location_info = MapService.find_lat_long(location)
      lat_long = location_info[:results].first[:locations].first[:latLng]
      forecast = WeatherService.forecast(lat_long, units)
      object.new(forecast, eta)
    end
  end
end
