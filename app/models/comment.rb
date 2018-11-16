class Comment < ApplicationRecord
  has_one_attached :file
  belongs_to :author, class_name: "User"
  belongs_to :project
end
