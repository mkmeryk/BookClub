FactoryBot.define do
  factory :review do
    approval { "MyString" }
    body { "MyText" }
    book { nil }
    user { nil }
  end
end
