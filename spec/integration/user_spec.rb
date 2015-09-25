require 'rails_helper'

describe 'User Api' do
  it 'should validate true' do
    post '/user', user: {email: 'ecuageo@gmail.com', password: 'password', password_confirmation: 'password'}
    expect(response.status).to eq 201
  end
end
