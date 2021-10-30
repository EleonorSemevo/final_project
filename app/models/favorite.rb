class Favorite < ApplicationRecord
  validates :user_id, presence: true
  validates :comment_id, presence: true
  belongs_to :user
  belongs_to :comment
end
