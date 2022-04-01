class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :likers,  dependent: :destroy, source: :user

  validates :body, presence: true
end
