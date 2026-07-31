class Character < ApplicationRecord
  belongs_to :user
  belongs_to :campaign

  validates :name, presence: true
  validates :system, presence: true
  validates :active, presence: true

  attribute :active, default: true
end
