require 'rails_helper'

describe ImageSerializer do
  let!(:image) { Background.new(image_data) }

  it 'should have attributes' do
    serializer = ImageSerializer.new(image).serializable_hash
    expect(serializer).to have_key(:data)
    expect(serializer[:data]).to have_key(:attributes)
    expect(serializer[:data]).to have_key(:id)
    expect(serializer[:data]).to have_key(:type)
    expect(serializer[:data][:attributes]).to have_key(:image)
    expect(serializer[:data][:attributes][:image]).to have_key(:location)
    expect(serializer[:data][:attributes][:image]).to have_key(:image_url)
    expect(serializer[:data][:attributes][:image]).to have_key(:credit)
    expect(serializer[:data][:attributes][:image][:credit]).to have_key(:source)
    expect(serializer[:data][:attributes][:image][:credit]).to have_key(:user)
    expect(serializer[:data][:attributes][:image][:credit]).to have_key(:user_url)
    expect(serializer[:data][:attributes][:image][:credit]).to have_key(:name)
  end
end
