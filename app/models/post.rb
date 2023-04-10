class Post < ApplicationRecord
  belongs_to :user
  validates :game_title, presence: true
  validates :evaluation, presence: true, numericality: { greater_than_or_equal_to: 1, less_than: 10 }
  validates :title, presence: true, length: { maximum: 10 }
  validates :body, presence: true, length: { maximum: 200 }
end
