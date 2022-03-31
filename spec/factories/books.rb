FactoryBot.define do
  factory :book do
    title { "MyString" }
    image_url { "MyText" }
    introduction { "MyText" }
    genre { "MyString" }
    avg_rating { 1 }
    user { nil }
  end
end
