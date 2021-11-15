class ActivityService
  class << self
    def activities(params)
      [ApiClient.get_data("http://www.boredapi.com/api/activity/?type=relaxation"),
        ApiClient.get_data("http://www.boredapi.com/api/activity/?type=#{params}")]
    end
  end
end
