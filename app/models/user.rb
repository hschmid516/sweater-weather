class User < ApplicationRecord
  has_secure_token :api_key
  has_secure_password
end
