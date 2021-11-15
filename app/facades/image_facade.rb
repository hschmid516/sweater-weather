class ImageFacade
  class << self
    def image(location)
      image = ImageService.image(location)
      Background.new(image)
    end
  end
end
