require 'rails_helper'

describe 'signing in' do
  it 'returns the token' do
    user = User.create!(email: 'angry_bowler@gmail.com', password: 'password', password_confirmation: 'password')

    post '/access', email: 'angry_bowler@gmail.com', password: 'password'

    token = JSON.parse(response.body)["access_token"]
    expect(token).to eq user.access_tokens.last.token
  end
end
