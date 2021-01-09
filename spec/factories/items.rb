FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    number {Faker::Number.number(digits: 10)}
    association :user
  end
end
