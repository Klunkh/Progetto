class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  default_scope -> { order(created_at: :desc) }
  validates :content, length: { maximum: 140 }
  validates :user_id, presence: true
end
