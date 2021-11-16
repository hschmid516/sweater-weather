class ApplicationController < ActionController::API
  include ExceptionHandler

  private
  
  def verify_json
    bad_format if request.format != :json
  end
end
