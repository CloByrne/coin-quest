class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = User.new(user_params)

    if user.save
      render json: { message: 'User registered successfully' }, status: :created
    else
      render json: { error: 'Failed to register user' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
