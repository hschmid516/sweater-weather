require 'rails_helper'

describe ActivitiesSerializer, :vcr do
  it 'serializes activities' do
    activities = ActivityFacade.activities('chicago,il')
    serialized = ActivitiesSerializer.new(activities).to_json

    expect(serialized).to eq("{\"data\":{\"id\":null,\"type\":\"activities\",\"attributes\":{\"destination\":\"chicago,il\",\"forecast\":{\"summary\":\"light snow\",\"temperature\":\"33.17 F\"},\"activities\":[{\"title\":\"Sit in the dark and listen to your favorite music with no distractions\",\"type\":\"relaxation\",\"participants\":1,\"price\":0},{\"title\":\"Bake a pie with some friends\",\"type\":\"cooking\",\"participants\":3,\"price\":0.3}]}}}")
  end
end
