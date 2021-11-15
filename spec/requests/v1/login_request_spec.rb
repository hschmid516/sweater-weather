require 'rails_helper'

describe 'user login' do
  let!(:user) { create(:user) }

  it 'creates a session' do
    user_params = {
      email: user.email,
      password: user.password
    }

    post '/api/v1/sessions', params: user_params, as: :json

    expect(response).to be_successful
    expect(json[:data][:attributes][:email]).to eq(user_params[:email])
    expect(json[:data][:attributes][:api_key]).to be_a(String)
    expect(json[:data][:attributes]).to_not have_key(:password)
    expect(json[:data][:attributes]).to_not have_key(:password_confirmation)
    expect(json[:data][:attributes]).to_not have_key(:password_digest)
  end
end
