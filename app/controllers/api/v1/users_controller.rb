class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    render json: UserSerializer.new(user), status: :created
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_digest)
  end
end
