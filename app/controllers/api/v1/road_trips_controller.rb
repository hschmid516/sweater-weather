class Api::V1::RoadTripsController < ApplicationController
  def create
    trip = RoadTripFacade.plan_trip(params[:origin], params[:destination])
    render json: RoadTripSerializer.new(trip)
  end
end
