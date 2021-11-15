require 'rails_helper'

describe ActivityFacade, :vcr do
  it 'gets activity info for location' do
    activities = ActivityFacade.activities('chicago,il')

    expect(activities).to be_an(Activities)
    expect(activities.id).to be(nil)
    expect(activities.destination).to be_a(String)
    expect(activities.forecast).to be_a(Hash)
    expect(activities.activities).to be_an(Array)
    expect(activities.activities.first[:title]).to be_a(String)
    expect(activities.activities.first[:type]).to be_a(String)
    expect(activities.activities.first[:participants]).to be_an(Integer)
    expect(activities.activities.first[:price]).to be_an(Integer).or be_a(Float)
  end

  it 'gets type of activity based on weather' do
    params1 = { summary: 'cloudy', temp: 70 }
    params2 = { summary: 'cloudy', temp: 55 }
    params3 = { summary: 'cloudy', temp: 45 }
    expect(ActivityFacade.send(:activity_params, params1)).to eq('recreational')
    expect(ActivityFacade.send(:activity_params, params2)).to eq('busywork')
    expect(ActivityFacade.send(:activity_params, params3)).to eq('cooking')
  end
end
