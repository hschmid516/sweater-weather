class ActivityFacade
  class << self
    def activities(location)
      weather_info = WeatherFacade.forecast(location).current_weather
      weather = { summary: weather_info[:summary], temp: weather_info[:temperature] }
      activities = ActivityService.activities(activity_params(weather))
      Activities.new(location, weather, activities)
    end

    private

    def activity_params(weather)
      if weather[:temp] >= 60
        'recreational'
      elsif weather[:temp] >= 50 && weather[:temp] < 60
        'busywork'
      else
        'cooking'
      end
    end
  end
end
