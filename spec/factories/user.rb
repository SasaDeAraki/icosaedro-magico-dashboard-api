FactoryBot.define do
  factory :user do
    name { "Giovannizinho" }
    sequence(:email) { |n| "user#{n}@gmail.com" }
    passwordHash { "123456" }
  end
end