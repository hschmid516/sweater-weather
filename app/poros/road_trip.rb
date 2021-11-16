class RoadTrip
  attr_reader :id, :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(start, end_city, travel_time, weather)
    @start_city = start.gsub(/,/, ', ')
    @end_city = end_city.gsub(/,/, ', ')
    @travel_time = Time.at(travel_time).utc.strftime "%H:%M"
    @weather_at_eta = { temperature: weather.forecast[:temperature],
                 conditions: weather.forecast[:conditions] }
  end
end
