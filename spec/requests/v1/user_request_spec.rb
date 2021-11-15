require 'rails_helper'

describe 'user registation' do
  it 'creates a user' do
    user_params = {
      email: "email@gmail.com",
      password: "password",
      password_confirmation: "password"
    }

    post '/api/v1/users', params: {user: user_params}, as: :json
    expect(response).to have_http_status(:created)
    expect(json[:data][:attributes][:email]).to eq(user_params[:email])
    expect(json[:data][:attributes][:api_key]).to be_a(String)
    expect(json[:data][:attributes]).to_not have_key(:password)
    expect(json[:data][:attributes]).to_not have_key(:password_confirmation)
  end
end
