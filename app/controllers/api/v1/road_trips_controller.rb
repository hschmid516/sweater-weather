class Api::V1::RoadTripsController < ApplicationController
  before_action :verify_api_key, only: :create

  def create
    trip = RoadTripFacade.plan_trip(params[:origin], params[:destination])
    render json: RoadTripSerializer.new(trip)
  end

  private

  def verify_api_key
    user = User.find_by(api_key: params[:api_key])
    unauthorized if !user
  end
end
