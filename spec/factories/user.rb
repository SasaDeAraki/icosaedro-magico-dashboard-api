FactoryBot.define do
  factory :user do
    name { "Giovannizinho" }
    sequence(:email) { |n| "user#{n}@gmail.com" }
    password { "12345678" }
  end
end
