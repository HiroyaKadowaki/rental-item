FactoryBot.define do
  factory :booking do
    date {Faker::Date.in_date_period(year: 2022, month: 2)}
    association :item
    association :user
  end
end
