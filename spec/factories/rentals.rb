FactoryBot.define do
  factory :rental do
    rental_day {"2021.01.30"}
    association :user
    association :item
  end
end
