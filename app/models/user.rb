class User < ApplicationRecord
  has_secure_token :api_key
  has_secure_password

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
end
