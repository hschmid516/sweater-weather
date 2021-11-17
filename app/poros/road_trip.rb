class RoadTrip
  attr_reader :id, :start_city, :end_city

  def initialize(start, end_city, time, weather = nil)
    @start_city = start.gsub(/,/, ', ')
    @end_city = end_city.gsub(/,/, ', ')
    @time = time
    @weather = weather
  end

  def travel_time
    @time.is_a?(Integer) ? (Time.at(@time).utc.strftime '%H:%M') : @time
  end

  def weather_at_eta
    if @weather
      { temperature: @weather.forecast[:temperature],
        conditions: @weather.forecast[:conditions] }
    end
  end
end
