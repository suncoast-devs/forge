class Project < ApplicationRecord
  enum status: [:pending, :in_progress, :complete]
  has_many :comments
  belongs_to :requested_by, class_name: "User"
  belongs_to :claimed_by, class_name: "User", optional: true
  validates :title, presence: true
  validates :description, presence: true
  validates :deadline_on, presence: true
  validates :bid, presence: true
  after_initialize :set_default_status

  private

  def set_default_status
    self.status ||= :pending
  end
end
