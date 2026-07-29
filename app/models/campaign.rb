class Campaign < ApplicationRecord
  validate :name,
    presence: true

  validate :system,
    presence: true

  validate :active,
    presence: true

  attribute :system, default: "lancer"

  attribute :active, default: true
end
