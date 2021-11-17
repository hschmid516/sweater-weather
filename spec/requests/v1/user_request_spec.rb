require 'rails_helper'

describe 'user registation' do
  let(:user) { create(:user) }

  it 'creates a user' do
    user_params = {
      email: 'email@gmail.com',
      password: 'password',
      password_confirmation: 'password'
    }

    post '/api/v1/users', params: user_params, as: :json

    expect(response).to have_http_status(:created)
    expect(json[:data][:attributes][:email]).to eq(user_params[:email])
    expect(json[:data][:attributes][:api_key]).to be_a(String)
    expect(json[:data][:attributes]).to_not have_key(:password)
    expect(json[:data][:attributes]).to_not have_key(:password_confirmation)
    expect(json[:data][:attributes]).to_not have_key(:password_digest)
  end

  it 'cant call endpoint with params in URL' do
    post "/api/v1/users?email=#{user.email}&password=#{user.password}&password_confirmation#{user.password_confirmation}"

    expect(response).to have_http_status(:bad_request)
    expect(json).to eq({ message: 'Params must be sent as JSON payload in body' })
  end

  it 'has 400 error and message if email already taken' do
    user_params = {
      email: user.email,
      password: user.password,
      password_confirmation: user.password_confirmation
    }

    post '/api/v1/users', params: user_params, as: :json

    expect(response).to have_http_status(:bad_request)
    expect(json).to eq({ message: ['Email has already been taken'] })
  end

  it 'has 400 error and message if password mismatch' do
    user_params = {
      email: '123@gmail.com',
      password: 'password',
      password_confirmation: 'wrongpassword'
    }

    post '/api/v1/users', params: user_params, as: :json

    expect(response).to have_http_status(:bad_request)
    expect(json).to eq({ message: ["Password confirmation doesn't match Password"] })
  end

  it 'has 400 error and message if field missing' do
    user_params = {
      password: 'password',
      password_confirmation: 'password'
    }

    post '/api/v1/users', params: user_params, as: :json

    expect(response).to have_http_status(:bad_request)
    expect(json).to eq({ message: ["Email can't be blank"] })
  end
end
