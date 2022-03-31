class User < ApplicationRecord

    has_secure_password
    has_many :books
    has_many :reviews

    def full_name
        self.first_name + " " + self.last_name
    end

end
