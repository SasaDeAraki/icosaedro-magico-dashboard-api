FactoryBot.define do
  factory :user do
    name { "Giovannizinho" }
    sequence(:email) { |n| "user#{n}@gmail.com" }
    password_hash { "123456" }
  end
end
