# helpers/auth_helper.rb

require 'securerandom'

module AuthHelper
  def self.generate_secret_key
    SecureRandom.hex(32)
  end
end

# Generate and store the secret key
SECRET_KEY = AuthHelper.generate_secret_key
