require 'rails_helper'

describe MapService, :vcr do
  let!(:lat_lng) { { lat: 43.659218, lng: -70.256519 } }

  it 'returns lat long from location' do
    lat_long = MapService.find_lat_long('Portland, ME')

    expect(lat_long).to be_a(Hash)
    expect(lat_long.length).to eq(3)
    expect(lat_long[:results].first[:locations]).to be_an(Array)
    expect(lat_long[:results].first[:locations].length).to eq(1)
    expect(lat_long[:results].first[:locations].first[:latLng]).to eq(lat_lng)
  end

  it 'returns travel time' do
    time = MapService.travel_time('Portland,ME', 'Boston,MA')
    expect(time).to be_an(Integer)
  end
end
