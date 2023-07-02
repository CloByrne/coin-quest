class SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:email])
      
      if user && user.authenticate(params[:password])
        # Authentication successful
        # Generate and return a JWT token
        token = JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base, 'HS256')
        
        render json: { token: token }
      else
        # Authentication failed
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  end
  