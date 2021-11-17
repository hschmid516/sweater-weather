class MapService
  class << self
    MAP_URL = 'http://www.mapquestapi.com'

    def find_lat_long(location)
      ApiClient.get_data("#{MAP_URL}/geocoding/v1/address?key=#{ENV['MAP_KEY']}&location=#{location}&maxResults=1")
    end

    def travel_time(from, to)
      ApiClient.get_data("#{MAP_URL}/directions/v2/route?key=#{ENV['MAP_KEY']}&from=#{from}&to=#{to}")[:route][:realTime]
    end
  end
end
