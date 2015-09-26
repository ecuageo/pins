require 'rails_helper'

describe 'Profile API' do
  it 'creating a profile' do
    user = User.create!(email: 'angry_bowler@gmail.com', password: 'password', password_confirmation: 'password')

    post '/profiles', name: 'Dad', token: token(user)

    expect(response.status).to eq 201
  end
end
