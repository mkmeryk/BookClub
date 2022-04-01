FactoryBot.define do
  factory :rating do
    rate { 1 }
    book { nil }
    user { nil }
  end
end
