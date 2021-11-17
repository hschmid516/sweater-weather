class Api::V1::BackgroundsController < ApplicationController
  skip_before_action :verify_json
  before_action :verify_params

  def index
    image = ImageFacade.image(params[:location])
    render json: ImageSerializer.new(image)
  end
end
