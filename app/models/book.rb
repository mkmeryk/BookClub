class Book < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :ratings, dependent: :destroy

  validates :title, presence: { message: "must be provided" }, uniqueness: {scope: :user_id}
end
