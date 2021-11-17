class Api::V1::ForecastController < ApplicationController
  skip_before_action :verify_json
  before_action :verify_params

  def index
    params[:units] ||= 'imperial'
    forecast = WeatherFacade.forecast(Forecast, params[:location], params[:units])
    render json: ForecastSerializer.new(forecast)
  end
end
