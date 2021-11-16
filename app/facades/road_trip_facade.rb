class RoadTripFacade
  class << self
    def plan_trip(start, end_city)
      travel_time = MapService.travel_time(start, end_city)
      eta = travel_time + Time.now.to_i
      eta_rounded = (Time.at(eta) + 30.minutes).beginning_of_hour.to_i
      weather = WeatherFacade.forecast(TripForecast, end_city, eta_rounded)
      RoadTrip.new(start, end_city, travel_time, weather)
    end
  end
end
