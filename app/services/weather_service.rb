class WeatherService

  class << self
    MAP_URL = "http://www.mapquestapi.com/geocoding/v1/address"
    WEATHER_URL = "https://api.openweathermap.org/data/2.5/onecall"

    def forecast(lat_long)
      ApiClient.get_data("#{WEATHER_URL}?lat=#{lat_long[:lat]}&lon=#{lat_long[:lng]}&exclude=minutely,alerts&appid=#{ENV['WEATHER_KEY']}&units=imperial")
    end

    def find_lat_long(location)
      ApiClient.get_data("#{MAP_URL}?key=#{ENV['MAP_KEY']}&location=#{location}&maxResults=1")
    end
  end
end