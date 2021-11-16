class ApplicationController < ActionController::API
  include ExceptionHandler

  def verify_json
    bad_format if request.format != :json
  end
end
