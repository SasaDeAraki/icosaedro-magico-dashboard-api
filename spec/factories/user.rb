FactoryBot.define do
  factory :user do
    name { "Giovannizinho" }
    sequence(:email) { |n| "user#{n}@gmail.com" }
    provider { "google_oauth2" }
    sequence(:uid) { |n| "uid-#{n}" }
  end
end
