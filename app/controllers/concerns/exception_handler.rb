module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    # rescue_from ActiveRecord::RecordNotFound do |e|
    #   json_response({ message: e.message, error: nil }, :not_found)
    # end
    #
    # rescue_from ActiveRecord::RecordInvalid do |e|
    #   json_response({ message: e.message }, :not_found)
    # end

    def bad_request(object)
      render json: {
          message: object.errors.full_messages,
        }, status: 400
    end
  end
end
