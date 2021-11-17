require 'rails_helper'

describe RoadTripFacade, :vcr do
  it 'creates a trip object' do
    trip = RoadTripFacade.plan_trip('Portland,ME', 'Boston,MA', 'imperial')

    expect(trip).to be_a(RoadTrip)
    expect(trip.id).to be(nil)
    expect(trip.start_city).to be_a(String)
    expect(trip.end_city).to be_a(String)
    expect(trip.travel_time).to be_a(String)
    expect(trip.weather_at_eta).to be_a(Hash)
    expect(trip.weather_at_eta[:temperature]).to be_a(Float)
    expect(trip.weather_at_eta[:conditions]).to be_a(String)
  end
end
