class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  validates :body, presence: true
end
