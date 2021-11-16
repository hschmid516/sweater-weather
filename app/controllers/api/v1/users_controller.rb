class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      bad_request(user)
    end
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
