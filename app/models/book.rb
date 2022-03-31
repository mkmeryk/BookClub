class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: { message: "must be provided" }, uniqueness: {scope: :user_id}
end
