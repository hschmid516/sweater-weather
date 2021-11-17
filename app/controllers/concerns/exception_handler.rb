module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    # rescue_from ActiveRecord::RecordNotFound do |e|
    #   json_response({ message: e.message, error: nil }, :not_found)
    # end

    # rescue_from ActiveRecord::RecordInvalid do |e|
    #   json_response({ message: e.message }, :not_found)
    # end

    def bad_request(object)
      render json: {
        message: object.errors.full_messages
      }, status: 400
    end

    def unauthorized
      render json: {
        message: 'Credentials are missing or incorrect'
      }, status: 401
    end

    def bad_format
      render json: {
        message: 'Params must be sent as JSON payload in body'
      }, status: 400
    end

    def bad_params
      render json: {
        message: 'Location is missing or empty'
      }, status: 400
    end
  end
end
