class Api::V1::ForecastController < ApplicationController
  skip_before_action :verify_json
  before_action :verify_params

  def index
    forecast = WeatherFacade.forecast(Forecast, { location: params[:location] })
    render json: ForecastSerializer.new(forecast)
  end
end
