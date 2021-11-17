require 'rails_helper'

describe UserSerializer do
  let!(:user) { build(:user) }

  it 'should have attributes' do
    serializer = UserSerializer.new(user).serializable_hash
    expect(serializer).to have_key(:data)
    expect(serializer[:data]).to have_key(:id)
    expect(serializer[:data]).to have_key(:type)
    expect(serializer[:data]).to have_key(:attributes)
    expect(serializer[:data][:attributes]).to have_key(:api_key)
    expect(serializer[:data][:attributes]).to have_key(:email)
  end
end
