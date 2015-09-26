class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user.with_keys(%w(id email created_at updated_at)), status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
