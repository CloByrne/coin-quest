# controllers/authentication_controller.rb

require_relative '../helpers/auth_helper'
require 'jwt'

class AuthenticationController
  def create_token(user_id)
    payload = { user_id: user_id }
    token = JWT.encode(payload, SECRET_KEY, 'HS256')
    # Return the generated token
    token
  end

  # Other authentication-related methods...
end
