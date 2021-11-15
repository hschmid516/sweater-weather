class Api::V1::ActivitiesController < ApplicationController
  def index
    activities = ActivityFacade.activities(params[:destination])
    render json: ActivitySerializer.new(activities)
  end
end
