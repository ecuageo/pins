# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, on: :create

  has_many :profiles
  has_many :access_tokens

  def self.find_by_token(token)
    token = AccessToken.find_by_token(token)
    token && token.user
  end
end
