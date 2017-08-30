class User < ApplicationRecord
  # has_and_belongs_to_many :restaurants

  def generate_auth_token
    token = SecureRandom.hex
    self.update_attributes(guid: token)
  end

  def invalidate_auth_token
    self.update_attributes(guid: nil)
  end
end
