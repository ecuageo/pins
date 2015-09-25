# == Schema Information
#
# Table name: access_tokens
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  token      :string
#  expires_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AccessToken < ActiveRecord::Base
  belongs_to :user
  before_create :set_token

  private

  def set_token
    self.token = SecureRandom.uuid.gsub(/\-/, '')
  end
end
