class Api::V1::BackgroundsController < ApplicationController
  skip_before_action :verify_json

  def index
    image = ImageFacade.image(params[:location])
    render json: BackgroundSerializer.new(image)
  end
end
