require 'rails_helper'

describe ImageFacade, :vcr do
  it 'gets image info for city' do
    image = ImageFacade.image('Portland, ME')

    expect(image).to be_a(Background)
    expect(image.id).to be(nil)
    expect(image.image).to be_a(Hash)
    expect(image.image.size).to eq(3)
    expect(image.image[:credit]).to be_a(Hash)
    expect(image.image[:credit].size).to eq(3)
  end
end
