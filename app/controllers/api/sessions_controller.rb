class Api::SessionsController < ApplicationController
    def create
      user = User.find_by(username: params[:user][:username])
  
      if user&.authenticate(params[:password])
        # Successful login
        render json: { message: 'Login successful' }
      else
        # Failed login
        render json: { message: 'Invalid username or password' }, status: :unprocessable_entity
      end
    end
  end
  