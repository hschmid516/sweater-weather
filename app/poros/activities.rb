class Activities
  attr_reader :id, :destination, :forecast, :activities

  def initialize(location, weather, activities)
    @id = nil
    @destination = location
    @forecast = { summary: weather[:summary], temperature: "#{weather[:temp]} F" }
    @activities = activity_info(activities)
  end

  def activity_info(data)
    data.map do |activity|
      {
        title: activity[:activity],
        type: activity[:type],
        participants: activity[:participants],
        price: activity[:price]
      }
    end
  end
end
