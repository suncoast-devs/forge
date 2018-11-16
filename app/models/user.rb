class User < ApplicationRecord
  enum role: [:basic, :admin]
  has_many :projects, as: :requested_by
  after_initialize :set_default_role

  def self.from_auth_hash(auth)
    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.name = auth.info.name
      user.role = :admin if auth.info.email =~ /@suncoast.io$/
      user.save!
    end
  end

  private

  def set_default_role
    self.role ||= :basic
  end
end
