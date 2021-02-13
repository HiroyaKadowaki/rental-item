FactoryBot.define do
  factory :category do
    name {Faker::Name.name}
    association :user
  end
end
