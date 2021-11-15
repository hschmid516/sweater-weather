require 'rails_helper'

describe Activities do
  it 'has attributes' do
    location = "chicago,il"
    weather = { summary: "overcast clouds", temp: 33.71 }
    activities =
    [
      {
        activity: "Start a daily journal",
        type: "relaxation",
        participants: 1,
        price: 0,
        link: "",
        key: "8779876",
        accessibility: 0
      },
      {
        activity: "Learn a new recipe",
        type: "cooking",
        participants: 1,
        price: 0,
        link: "",
        key: "6553978",
        accessibility: 0.05
      }
    ]
    activities = Activities.new(location, weather, activities)

    expect(activities).to be_an(Activities)
    expect(activities.id).to be(nil)
    expect(activities.destination).to eq("chicago,il")
    expect(activities.forecast).to eq({summary: "overcast clouds", temperature: "33.71 F"})
    expect(activities.activities).to eq(
      [
        {
          participants: 1,
          price: 0,
          title: "Start a daily journal",
          type: "relaxation"
        }, 
        {
          participants: 1,
          price: 0,
          title: "Learn a new recipe",
          type: "cooking"
        }
      ]
    )
  end
end
