class Character < ApplicationRecord
  belongs_to :user
  belongs_to :campaign

  validates :name, presence: true
  validates :active, inclusion: { in: [ true, false ] }

  attribute :active, default: true
end
