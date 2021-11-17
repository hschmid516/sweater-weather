class RoadTripFacade
  class << self
    def plan_trip(start, end_city)
      travel_time = MapService.travel_time(start, end_city)
      weather = WeatherFacade.forecast(TripForecast, end_city, eta(travel_time)) if travel_time
      RoadTrip.new(start, end_city, verify_time(travel_time), weather)
    end

    private

    def verify_time(time)
      time || 'impossible route'
    end

    def eta(travel_time)
      eta = travel_time + Time.now.to_i
      (Time.at(eta) + 30.minutes).beginning_of_hour.to_i
    end
  end
end
