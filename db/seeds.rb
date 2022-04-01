# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Like.destroy_all
Review.destroy_all
Book.destroy_all
User.destroy_all

PASSWORD = "123"

approvals = ['nil', 'approved', 'rejected', 'pending']

5.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name}@#{last_name}.com",
        password: PASSWORD
    )
end

users = User.all

20.times do
    created_at = Faker::Date.backward(days:365 * 5)
    b = Book.create(
        title: Faker::Book.title,
        genre: Faker::Book.genre,  
        image_url: Faker::LoremFlickr.image,      
        introduction: Faker::Movie.quote,
        user: users.sample
    )
    if b.valid?
        rand(1..3).times do
            r = Review.create(
                body: Faker::Quotes::Shakespeare.hamlet_quote,
                approval: approvals.sample,
                book: b,
                user: users.sample,
                likers: users.shuffle.slice(0, rand(users.count))
            )
        end
    end
end

books = Book.all
revies = Review.all
likes = Like.all

puts Cowsay.say("Generated #{books.count} books", :frogs)
puts Cowsay.say("Generated #{reviews.count} reviews", :cow)
puts Cowsay.say("Generated #{users.count} users", :koala)
puts Cowsay.say("Generated #{likes.count} likes", :dragon)