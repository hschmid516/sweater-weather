class ImageService

  class << self
    IMG_URL = "https://api.unsplash.com/search/photos/"

    def image(query)
      ApiClient.get_data("#{IMG_URL}?client_id=#{ENV['IMG_KEY']}&query=#{query}&per_page=1")[:results].first
    end
  end
end
