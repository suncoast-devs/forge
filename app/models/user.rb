class User < ApplicationRecord
  has_many :projects, as: :requested_by

  def self.from_auth_hash(auth)
    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.name = auth.info.name
      user.save!
    end
  end
end
