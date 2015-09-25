class AccessController < ApplicationController
  def create
    user = User.find_by_email authenticate_params[:email]
    user.authenticate(authenticate_params[:password])
    if user && token = set_token(user)
      render json: {access_token: token}
    else
      render json: {errors: ''}
    end
  end

  private

  def authenticate_params
    params.permit(:email, :password)
  end

  def set_token(user)
    user.access_tokens.create.token
  end
end
