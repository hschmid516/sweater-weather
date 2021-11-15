require 'rails_helper'

describe ImageService, :vcr do
  let!(:lat_lng) { { lat: 43.659218, lng: -70.256519 } }

  it 'returns background image data' do
    image = ImageService.image('Portland, ME')
    expect(image).to be_a(Hash)
    expect(image[:user][:location]).to be_a(String)
    expect(image[:urls][:regular]).to be_a(String)
    expect(image[:user][:username]).to be_a(String)
    expect(image[:user][:links][:self]).to be_a(String)
  end
end
