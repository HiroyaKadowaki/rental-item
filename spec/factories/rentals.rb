FactoryBot.define do
  factory :rental do
    association :user
    association :item
  end
end
