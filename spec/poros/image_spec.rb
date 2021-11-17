require 'rails_helper'

describe Background, :vcr do
  it 'has attributes' do
    image = Background.new(image_data)

    expect(image).to be_a(Background)
    expect(image.id).to be(nil)
    expect(image.image).to eq(
      {
        location: 'Portland, ME',
        image_url:
          "https://images.unsplash.com/photo-1629737237147-7aee70ee8cf6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzU0ODR8MHwxfHNlYXJjaHwxfHxwb3J0bGFuZCUyQ21lfGVufDB8fHx8MTYzNjkyODE5Ng&ixlib=rb-1.2.\n1&q=80&w=1080",
        credit: {
          source: 'https://unsplash.com/',
          user: 'itsallgoodie',
          name: 'Christopher Goodwin',
          user_url: 'https://unsplash.com/@itsallgoodie'
        }
      }
    )
  end
end
