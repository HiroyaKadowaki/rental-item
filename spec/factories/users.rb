FactoryBot.define do
  factory :user do
    name {Gimei.name.kanji}
    department {"営業部"}
    email {Faker::Internet.free_email}
    password {"rental123"}
    password_confirmation {password}
  end
end
