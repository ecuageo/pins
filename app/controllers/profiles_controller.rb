class ProfilesController < ApplicationController

  def index
    render text: 'something'
  end

  def create
    profile = current_user.profiles.create(profile_params)
    if profile.valid?
      render json: profile, status: :created
    else
      render json: profile.errors
    end
  end

  private

  def profile_params
    params.permit(:name)
  end
end
