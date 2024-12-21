FactoryBot.define do
  factory :tank do
    name { Faker::Book.title }
    description { Faker::Book.title }
    user { create(:user) }
  end
end
