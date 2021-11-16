class ApplicationController < ActionController::API
  include ExceptionHandler
  before_action :verify_json

  private

  def verify_json
    bad_format if request.format != :json
  end
end
