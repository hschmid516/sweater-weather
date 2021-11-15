class Background
  attr_reader :id, :image

  def initialize(data)
    @id = nil
    @image = image_info(data)
  end

  def image_info(data)
    {
      location: data[:user][:location],
      image_url: data[:urls][:regular],
      credit: {
        source: 'https://unsplash.com/',
        user: data[:user][:username],
        user_url: data[:user][:links][:self]
      }
    }
  end
end
