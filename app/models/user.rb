class User < ApplicationRecord

    has_secure_password
    has_many :books
    has_many :ratings
    has_many :reviews
    has_many :notifications, dependent: :destroy
   
    has_many :likes, dependent: :destroy
    has_many :liked_reviews, through: :likes, source: :review



    def full_name
        self.first_name + " " + self.last_name
    end

end
