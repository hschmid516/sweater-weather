require 'rails_helper'

describe ActivityService, :vcr do

  it 'returns activity data' do
    activities = ActivityService.activities('recreational')
    expect(activities).to be_an(Array)
    expect(activities.length).to eq(2)
    expect(activities.first[:type]).to eq('relaxation')
    expect(activities.last[:type]).to eq('recreational')

    activities.each do |activity|
      expect(activity[:activity]).to be_a(String)
      expect(activity[:type]).to be_a(String)
      expect(activity[:participants]).to be_an(Integer)
      expect(activity[:price]).to be_a(Integer).or be_a(Float)
    end
  end
end
